-------------------------------------------------------------------------------
-- Title      : Clock and reset generation
-- Project    : 
-------------------------------------------------------------------------------
-- File       : clks_rst.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-07
-- Last update: 2025-06-09
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: From a 100 MHz oscillator, generate 50 MH, 37.5 MHz and 33 MHz clocks that are then muxed to
-- provide a timebase clock for the timecode generator. A reset in the output domain is provided.
--
-- A copy of the reference clock is output, as well as a reset in that domain.
--
-- Also from a 100 MHz oscillator, generate a 38.4 MHz clock for an I2S ADC. This clock is 384x a 100 kHz
-- sample rate. The ADC is used to receive LTC.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-07  -        andy    Created
-- 2025-04-19           andy    bring out MMCM clocks and let entities that need to mux them do so. 
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

use work.ltc_mtc_pkg.all;

use work.clk_mux_pkg.all;

entity clks_rst is

    port (
        -- from the board.
        clk_ref     : in  std_logic;    -- reference or board input clock
        arst_l      : in  std_logic;    -- external asynchronous reset
        -- to other things that need to select a clock
        clk_bundle  : out clk_bundle_t;
        mmcm_locked : out std_logic;
        -- for non-timer logic that always runs.
        clk_main    : out std_logic;    -- general use clock at reference frequency
        rst_main    : out std_logic;    -- clock in that domain
        -- I2S clocks.
        rst_audio   : out std_logic;
        clk_audio   : out std_logic;
        sclk_audio  : out std_logic;
        lrclk_audio : out std_logic);

end entity clks_rst;

architecture clkgen of clks_rst is

    ---------------------------------------------------------------------------------------------------------
    -- Timer clock generators.
    ---------------------------------------------------------------------------------------------------------
    -- feedback clock.
    signal clkfb_in  : std_logic;       -- output of BUFG on feedback net
    signal clkfb_out : std_logic;       -- feedback out, to BUFG

    -- MMCM locked status, which we sync to the main clock to create resets in the downstream domains.
    signal locked : std_logic;

    ---------------------------------------------------------------------------------------------------------
    -- Audio clock generator.
    ---------------------------------------------------------------------------------------------------------
    -- unbuffered I2S MCLK out from MMCM.
    signal clk_audio_ub     : std_logic;
    -- feedback clock for audio MMCM.
    signal clk_audio_fb_in  : std_logic;
    signal clk_audio_fb_out : std_logic;
    -- mmcm status
    signal locked_audio     : std_logic;
    -- dividers for I2S clock outputs.
    signal div_sclk         : natural range 0 to 5;   -- divide MCLK by 6 to get SCLK
    signal div_lrclk        : natural range 0 to 63;  -- divide SCLK by 64 to get LRCLK


begin  -- architecture clkgen

    -- input buffer
    refclk_bufg : BUFG
        port map (
            O => clk_main,
            I => clk_ref);

    -- feedback buffer
    feedback_bufg : BUFG
        port map (
            O => clkfb_in,
            I => clkfb_out);

    mmcm_adv_inst : MMCME2_BASE
        generic map(
            BANDWIDTH          => "OPTIMIZED",
            CLKFBOUT_MULT_F    => 8.250000,
            CLKFBOUT_PHASE     => 0.000000,
            CLKIN1_PERIOD      => 10.000000,
            CLKOUT0_DIVIDE_F   => 16.500000,
            CLKOUT0_DUTY_CYCLE => 0.500000,
            CLKOUT0_PHASE      => 0.000000,
            CLKOUT1_DIVIDE     => 22,
            CLKOUT1_DUTY_CYCLE => 0.500000,
            CLKOUT1_PHASE      => 0.000000,
            CLKOUT2_DIVIDE     => 25,
            CLKOUT2_DUTY_CYCLE => 0.500000,
            CLKOUT2_PHASE      => 0.000000,
            CLKOUT3_DIVIDE     => 1,
            CLKOUT3_DUTY_CYCLE => 0.500000,
            CLKOUT3_PHASE      => 0.000000,
            CLKOUT4_CASCADE    => FALSE,
            CLKOUT4_DIVIDE     => 1,
            CLKOUT4_DUTY_CYCLE => 0.500000,
            CLKOUT4_PHASE      => 0.000000,
            CLKOUT5_DIVIDE     => 1,
            CLKOUT5_DUTY_CYCLE => 0.500000,
            CLKOUT5_PHASE      => 0.000000,
            CLKOUT6_DIVIDE     => 1,
            CLKOUT6_DUTY_CYCLE => 0.500000,
            CLKOUT6_PHASE      => 0.000000,
            DIVCLK_DIVIDE      => 1,
            REF_JITTER1        => 0.010000,
            STARTUP_WAIT       => FALSE
            )
        port map (
            CLKFBIN   => clkfb_in,
            CLKFBOUT  => clkfb_out,
            CLKFBOUTB => open,
            CLKIN1    => clk_main,
            CLKOUT0   => clk_bundle(CLK_25FPS),  --clk_out_50,    -- 50 MHz for 25 fps
            CLKOUT0B  => open,
            CLKOUT1   => clk_bundle(CLK_24FPS),  -- clk_out_37p5,  -- 37.5 MHz for 24 fps
            CLKOUT1B  => open,
            CLKOUT2   => clk_bundle(CLK_30FPS),  -- clk_out_33,    -- 33 MHz for 30 fps
            CLKOUT2B  => open,
            CLKOUT3   => open,
            CLKOUT3B  => open,
            CLKOUT4   => open,
            CLKOUT5   => open,
            CLKOUT6   => open,
            LOCKED    => locked,
            PWRDWN    => '0',
            RST       => '0');

    -- reset in the "main" clock domain.
    main_reset_sync : entity work.reset_sync(synchronizer)
        generic map (
            ASYNC_ACTIVE => '0')
        port map (
            clk  => clk_main,
            arst => arst_l,
            srst => rst_main);

    ---------------------------------------------------------------------------------------------------------
    -- generate a reset in the clk_timer domain.
    ---------------------------------------------------------------------------------------------------------

    -- This includes changes in the frame rate because when that happens, the clock changes and we want to
    -- ensure downstream logic resets.
    --
    -- better timing by synchronizing the MMCM locked status to the main clock before combining it with other
    -- possible downstream clock reset sources.
    mmcm_locked_cdcc : entity work.cdc_sync(synchronizer)
        generic map (
            t           => std_logic,
            RESET_STATE => '0',
            SYNC_FLOPS  => 3)
        port map (
            clk => clk_main,
            rst => rst_main,
            d   => locked,
            q   => mmcm_locked);

    ---------------------------------------------------------------------------------------------------------
    -- Create a 38.4 MHz modulator clock for the I2S ADC.
    -- Divide that clock down to create BCLK and LRCLK.
    -- We will operate the ADC in I2S master mode.
    ---------------------------------------------------------------------------------------------------------
    -- feedback buffer
    audio_clk_fb_bufg : BUFG
        port map (
            O => clk_audio_fb_in,
            I => clk_audio_fb_out);

    audio_clk_mmcm : MMCME2_BASE
        generic map(
            BANDWIDTH          => "OPTIMIZED",
            CLKFBOUT_MULT_F    => 48.000000,
            CLKFBOUT_PHASE     => 0.000000,
            CLKIN1_PERIOD      => 10.000000,
            CLKOUT0_DIVIDE_F   => 25.00000,
            CLKOUT0_DUTY_CYCLE => 0.500000,
            CLKOUT0_PHASE      => 0.000000,
            CLKOUT1_DIVIDE     => 1,
            CLKOUT1_DUTY_CYCLE => 0.500000,
            CLKOUT1_PHASE      => 0.000000,
            CLKOUT2_DIVIDE     => 1,
            CLKOUT2_DUTY_CYCLE => 0.500000,
            CLKOUT2_PHASE      => 0.000000,
            CLKOUT3_DIVIDE     => 1,
            CLKOUT3_DUTY_CYCLE => 0.500000,
            CLKOUT3_PHASE      => 0.000000,
            CLKOUT4_CASCADE    => FALSE,
            CLKOUT4_DIVIDE     => 1,
            CLKOUT4_DUTY_CYCLE => 0.500000,
            CLKOUT4_PHASE      => 0.000000,
            CLKOUT5_DIVIDE     => 1,
            CLKOUT5_DUTY_CYCLE => 0.500000,
            CLKOUT5_PHASE      => 0.000000,
            CLKOUT6_DIVIDE     => 1,
            CLKOUT6_DUTY_CYCLE => 0.500000,
            CLKOUT6_PHASE      => 0.000000,
            DIVCLK_DIVIDE      => 5,
            REF_JITTER1        => 0.010000,
            STARTUP_WAIT       => FALSE
            )
        port map (
            CLKFBIN   => clk_audio_fb_in,
            CLKFBOUT  => clk_audio_fb_out,
            CLKFBOUTB => open,
            CLKIN1    => clk_main,
            CLKOUT0   => clk_audio_ub,
            CLKOUT0B  => open,
            CLKOUT1   => open,
            CLKOUT1B  => open,
            CLKOUT2   => open,
            CLKOUT2B  => open,
            CLKOUT3   => open,
            CLKOUT3B  => open,
            CLKOUT4   => open,
            CLKOUT5   => open,
            CLKOUT6   => open,
            LOCKED    => locked_audio,
            PWRDWN    => '0',
            RST       => '0');

    audio_clk_bufg : BUFG
        port map (
            O => clk_audio,
            I => clk_audio_ub);

    -- reset in the audio clock domain.
    audio_reset_sync : entity work.reset_sync(synchronizer)
        generic map (
            ASYNC_ACTIVE => '0')
        port map (
            clk  => clk_audio,
            arst => locked_audio,
            srst => rst_audio);

    -- dividers for SCLK and LRCLK. We operate at 384x oversampling and a 100 kHz sample rate.
    -- SCLK is 64x LRCLK, so MCLK is 6x SCLK.
    i2s_clk_gen : process (clk_audio) is
    begin  -- process i2s_clk_gen
        if rising_edge(clk_audio) then
            if rst_audio = '1' then
                sclk_audio  <= '0';
                lrclk_audio <= '0';
                div_sclk    <= 0;
                div_lrclk   <= 0;
            else

                sclk_divider : if div_sclk = 2 then
                    sclk_audio <= '0';
                elsif div_sclk = 5 then
                    sclk_audio <= '1';
                end if sclk_divider;

                sclk_cntr : if div_sclk = 5 then
                    div_sclk <= 0;

                    lrclk_cntr : if div_lrclk = 63 then
                        div_lrclk <= 0;
                    else
                        div_lrclk <= div_lrclk + 1;
                    end if lrclk_cntr;

                else
                    div_sclk <= div_sclk + 1;
                end if sclk_cntr;

                lrclk_toggler : if div_sclk = 5 then
                    lrclk_fall : if div_lrclk = 31 then
                        lrclk_audio <= '0';
                    elsif div_lrclk = 63 then
                        lrclk_audio <= '1';
                    end if lrclk_fall;
                end if lrclk_toggler;

            end if;
        end if;
    end process i2s_clk_gen;

end architecture clkgen;
