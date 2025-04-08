-------------------------------------------------------------------------------
-- Title      : Clock and reset generation
-- Project    : 
-------------------------------------------------------------------------------
-- File       : clks_rst.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-07
-- Last update: 2025-04-07
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: From a 100 MHz oscillator, generate 50 MH, 37.5 MHz and 33 MHz clocks that are then muxed to
-- provide a timebase clock for the timecode generator. A reset in the output domain is provided.
--
-- A copy of the reference clock is output, as well as a reset in that domain.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-07  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

use work.ltc_mtc_pkg.all;

entity clks_rst is

    port (
        clkref     : in  std_logic;     -- reference or board input clock
        arst_l     : in  std_logic;     -- external asynchronous reset
        frame_rate : in  frame_rate_t;  -- desired frame rate, used as clock select
        clktimer   : out std_logic;     -- selected timer clock
        rsttimer_l : out std_logic;     -- reset in that domain
        clkmain    : out std_logic;     -- general use clock at reference frequency
        rstmain_l  : out std_logic);    -- clock in that domain

end entity clks_rst;

architecture clkgen of clks_rst is

    -- reference clock after buffer.
    signal clkref_buf : std_logic;

    -- feedback clock.
    signal clkfb_in  : std_logic;       -- output of BUFG on feedback net
    signal clkfb_out : std_logic;       -- feedback out, to BUFG

    -- MMCM output clocks.
    signal clk_out1 : std_logic;
    signal clk_out2 : std_logic;
    signal clk_out3 : std_logic;

    -- locked status,
    signal locked : std_logic;

    -- for the reset in the timer clock domain.
    signal timer_reset : std_logic;

    -- one-hot clock selects decoded from frame_rate input
    signal clk_sel : std_logic_vector(3 downto 0);

    -- output of selected clock 1 or 2:
    signal clk_sel_1_or_2 : std_logic;

    -- delay frame rate for edge detect, used to assert the final output clock.
    signal frame_rate_d : frame_rate_t;
    signal frame_rate_e : std_logic;    -- true on change of frame rate

begin  -- architecture clkgen

    -- input buffer
    refclk_bufg : BUFG
        port map (
            O => clkmain,
            I => clkref);

    -- feedback buffer
    feedback_bufg : BUFG
        port map (
            O => clkfb_in,
            I => clkfb_out);

    mmcm_adv_inst : MMCME2_BASE
        generic map(
            BANDWIDTH            => "OPTIMIZED",
            CLKFBOUT_MULT_F      => 8.250000,
            CLKFBOUT_PHASE       => 0.000000,
            CLKIN1_PERIOD        => 10.000000,
            CLKOUT0_DIVIDE_F     => 16.500000,
            CLKOUT0_DUTY_CYCLE   => 0.500000,
            CLKOUT0_PHASE        => 0.000000,
            CLKOUT1_DIVIDE       => 22,
            CLKOUT1_DUTY_CYCLE   => 0.500000,
            CLKOUT1_PHASE        => 0.000000,
            CLKOUT2_DIVIDE       => 25,
            CLKOUT2_DUTY_CYCLE   => 0.500000,
            CLKOUT2_PHASE        => 0.000000,
            CLKOUT3_DIVIDE       => 1,
            CLKOUT3_DUTY_CYCLE   => 0.500000,
            CLKOUT3_PHASE        => 0.000000,
            CLKOUT4_CASCADE      => FALSE,
            CLKOUT4_DIVIDE       => 1,
            CLKOUT4_DUTY_CYCLE   => 0.500000,
            CLKOUT4_PHASE        => 0.000000,
            CLKOUT5_DIVIDE       => 1,
            CLKOUT5_DUTY_CYCLE   => 0.500000,
            CLKOUT5_PHASE        => 0.000000,
            CLKOUT6_DIVIDE       => 1,
            CLKOUT6_DUTY_CYCLE   => 0.500000,
            CLKOUT6_PHASE        => 0.000000,
            DIVCLK_DIVIDE        => 1,
            REF_JITTER1          => 0.010000,
            STARTUP_WAIT         => FALSE
            )
        port map (
            CLKFBIN           => clkfb_in,
            CLKFBOUT          => clkfb_out,
            CLKFBOUTB         => open,
            CLKIN1            => clkmain,
            CLKOUT0           => clk_out1,  -- 50 MHz for 25 fps
            CLKOUT0B          => open,
            CLKOUT1           => clk_out2,  -- 37.5 MHz for 24 fps
            CLKOUT1B          => open,
            CLKOUT2           => clk_out3,  -- 33 MHz for 30 fps
            CLKOUT2B          => open,
            CLKOUT3           => open,
            CLKOUT3B          => open,
            CLKOUT4           => open,
            CLKOUT5           => open,
            CLKOUT6           => open,
            LOCKED            => locked,
            PWRDWN            => '0',
            RST               => '0');

    -- reset in the "main" clock domain.
    main_reset_sync : entity work.reset_sync
        port map (
            clk    => clkmain,
            arst_l => arst_l,
            srst_l => rstmain_l);

    -- decode the frame_rate to give one-hot clock selects.
    get_clock_selects : process (clkmain) is
    begin  -- process get_clock_selects
        if rising_edge(clkmain) then
            if rstmain_l = '0' then
                frame_rate_d <= FR_30;
                clk_sel      <= "1001";
            else
                FrameRateDecoder : case frame_rate is
                    when FR_30 => clk_sel <= "1001";
                    when FR_25 => clk_sel <= "1010";
                    when FR_24 => clk_sel <= "0100";
                end case FrameRateDecoder;

                frame_rate_d <= frame_rate;
                frame_rate_e <= '1' when frame_rate /= frame_rate_d else '0';
            end if;
        end if;
    end process get_clock_selects;

    -- select clocks 1 or 2
    clksel_1_2_bufgctrl : BUFGCTRL
        port map (
            O       => clk_sel_1_or_2,
            CE0     => '1',
            CE1     => '1',
            I0      => clk_out1,
            I1      => clk_out2,
            IGNORE0 => '0',
            IGNORE1 => '0',
            S0      => clk_sel(0),
            S1      => clk_sel(1));

    -- select clocks 1/2 or 3
    clksel_12_3_bufgctrl : BUFGCTRL
        port map (
            O       => clktimer,
            CE0     => '1',
            CE1     => '1',
            I0      => clk_sel_1_or_2,
            I1      => clk_out3,
            IGNORE0 => '0',
            IGNORE1 => '0',
            S0      => clk_sel(3),
            S1      => clk_sel(2));

    -- generate a reset in the clktimer domain.
    timer_reset <= '0' when (arst_l = '0' or frame_rate_e = '1' or locked = '0') else '1';
    
    timer_reset_sync : entity work.reset_sync
        port map (
            clk    => clktimer,
            arst_l => timer_reset,
            srst_l => rsttimer_l);
end architecture clkgen;
