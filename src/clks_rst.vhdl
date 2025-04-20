-------------------------------------------------------------------------------
-- Title      : Clock and reset generation
-- Project    : 
-------------------------------------------------------------------------------
-- File       : clks_rst.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-07
-- Last update: 2025-04-19
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
        clkref     : in  std_logic;     -- reference or board input clock
        arst_l     : in  std_logic;     -- external asynchronous reset
        -- from something 
        frame_rate : in  frame_rate_t;  -- desired frame rate, used as clock select
        -- to other things that need to select a clock
        clk_bundle : out clk_bundle_t;
        mmcm_locked : out std_logic;
        -- use for LTC time code generator.
        clktimer   : out std_logic;     -- selected timer clock
        rsttimer_l : out std_logic;     -- reset in that domain
        -- for non-timer logic that always runs.
        clkmain    : out std_logic;     -- general use clock at reference frequency
        rstmain_l  : out std_logic);    -- clock in that domain

end entity clks_rst;

architecture clkgen of clks_rst is

    -- feedback clock.
    signal clkfb_in  : std_logic;       -- output of BUFG on feedback net
    signal clkfb_out : std_logic;       -- feedback out, to BUFG

    -- MMCM locked status, which we sync to the main clock to create resets in the downstream domains.
    signal locked : std_logic;
    signal locked_s : std_logic;

    -- for the reset in the timer clock domain.
    signal timer_reset_l : std_logic;

    -- delay frame rate for edge detect, used to assert the final output clock.
    signal frame_rate_d : frame_rate_t;
    signal frame_rate_e : std_logic;    -- true on change of frame rate

    -- mux select.
    signal clk_sel : clk_sel_t;

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
            CLKIN1    => clkmain,
            CLKOUT0   => clk_bundle(CLK_25FPS), --clk_out_50,    -- 50 MHz for 25 fps
            CLKOUT0B  => open,
            CLKOUT1   => clk_bundle(CLK_24FPS), -- clk_out_37p5,  -- 37.5 MHz for 24 fps
            CLKOUT1B  => open,
            CLKOUT2   => clk_bundle(CLK_30FPS),-- clk_out_33,    -- 33 MHz for 30 fps
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
        port map (
            clk    => clkmain,
            arst_l => arst_l,
            srst_l => rstmain_l);

    ---------------------------------------------------------------------------------------------------------
    -- generate a reset in the clktimer domain.
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
            clk   => clkmain,
            rst_l => rstmain_l,
            d     => locked,
            q     => locked_s);

    -- to outside world.
    mmcm_locked <= locked_s;

    -- Select one of the three options as the timer clock, based on the switches.
    -- Generate a reset synchronized to that clock.
    -- combine reset sources and register to the main clock before feeding it to the reset generator.
    -- This ensures so we don't have a weird combinatorial path on the reset synchronizer's async reset input.
    -- Those reset sources are:
    -- 1. Main timer reset, asserted at the beginning of time,
    -- 2. MMCM lock, which should assert soon after the beginning of time,
    -- 3. Change in frame rate, which can happen at any time.
    timer_clk_mux: entity work.clk_mux(mux)
        port map (
            clkmain      => clkmain,
            rstmain_l    => rstmain_l,
            mmcm_locked  => locked_s,
            frame_rate   => frame_rate,
            clk_bundle   => clk_bundle,
            --
            clk_out      => clktimer,
            rst_out_l    => rsttimer_l);
        
end architecture clkgen;
