-------------------------------------------------------------------------------
-- Title      : Choose what to display on the 7-segment LEDs
-- Project    : 
-------------------------------------------------------------------------------
-- File       : display_mux.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-05-12
-- Last update: 2025-06-22
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: There are three things that can drive the LED timecode display.
-- They are:
-- 1. The time code generator, which also feeds both the LTC and MTC outputs,
-- 2. The MTC receiver,
-- 3. The LTC receiver.
--
-- Two switches determine what is displayed:
-- a. Internal/External,
-- b. MTC/LTC if in external mode.
--
-- The three sources have the time code and the frame rate. Based on the source selects and the chosen frame
-- rate, we choose the timer clock. The selected time code is synchronized to that clock and that's what
-- drives the display logic.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-05-12  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

use work.ltc_mtc_pkg.all;
use work.mtc_pkg.all;
use work.timecode_pkg.all;
use work.clk_mux_pkg.all;
use work.mtc_pkg.all;
use work.seven_segment_display_pkg.all;

entity display_mux is
    generic (
        CLKPER_30FPS : time;
        CLKPER_25FPS : time;
        CLKPER_24FPS : time);
    port (
        -- main clock, for selection
        clk_main            : in  std_logic;
        rst_main            : in  std_logic;
        -- so we know we have timer clocks.
        mmcm_locked         : in  std_logic;
        -- all of the timer clocks.
        clk_bundle          : in  clk_bundle_t;
        -- display select.
        tc_display_src      : in  std_logic;     -- 0 = internal, 1 = external
        tc_ext_src          : in  std_logic;     -- 0 = mtc, 1 = ltc
        -- the frame rate and time generated by the local timer
        gen_frame_time      : in  frame_time_t;  -- on generator timer clock, needs CDC.
        gen_frame_rate      : in  frame_rate_t;  -- on main clock
        -- decoded frame rate and time received from the MIDI port, all on the main clock
        mtcd_frame_time     : in  mtc_pkt_t;
        mtcd_new_frame_time : in  std_logic;
        -- decode frame rate and time received from the LTC in port, also on the main clock
        ltcd_frame_time     : in  frame_time_t;
        ltcd_frame_rate     : in  frame_rate_t;
        ltcd_new_frame_time : in  std_logic;
        -- all of the LED segments to display the current selected time code
        display             : out display_t);
end entity display_mux;

architecture mux of display_mux is

    attribute MARK_DEBUG : string;

    attribute MARK_DEBUG of tc_display_src : signal is "TRUE";
    attribute MARK_DEBUG of tc_ext_src : signal is "TRUE";
    
    -- generator frame time is on that timer's clock, we need it on the main clock.
    signal gen_frame_time_s : frame_time_t;

    -- time code received/decoded from the analog LTC input is on the ADC clock, we need it on the main clock.
    signal ltcd_frame_time_s    : frame_time_t;
    signal ltcd_frame_rate_s     : frame_rate_t;
    signal ltcd_new_frame_time_s : std_logic;

    -- frame rate based on the selects, then select the correct time.
    signal frame_rate_mux : frame_rate_t;
    signal frame_time_mux : frame_time_t;

    attribute MARK_DEBUG of frame_rate_mux : signal is "TRUE";
    attribute MARK_DEBUG of frame_time_mux : signal is "TRUE";

    -- synchronize the received/decoded frame rate and time to the display clock.
    signal frame_rate_mux_s : frame_rate_t;
    signal frame_time_mux_s : frame_time_t;

    -- display clock from the mux.
    signal clk_display : std_logic;
    signal rst_display : std_logic;

    ---------------------------------------------------------------------------------------------------------
    -- Convert straight-binary MTC to the BCD format required by LTC.
    ---------------------------------------------------------------------------------------------------------
    function MTCToLTC (
        constant ARG : mtc_pkt_t)
        return frame_time_t is
        variable rv : frame_time_t;
    begin  -- function MTCToLTC
        rv.frame_cnt := FramesNatToBCD(ARG.frames);
        rv.ft_sec    := SecondsNatToBCD(ARG.seconds);
        rv.ft_min    := MinutesNatToBCD(ARG.minutes);
        rv.ft_hr     := HoursNatToBCD(ARG.hours);
        return rv;
    end function MTCToLTC;

begin  -- architecture mux

    ---------------------------------------------------------------------------------------------------------
    -- the time code from the generator is on the generator's timer clock. We need it on the main clock for
    -- muxing with the others.
    ---------------------------------------------------------------------------------------------------------
    gen_frame_time_cdc_sync : entity work.cdc_sync(synchronizer)
        generic map (
            t           => frame_time_t,
            RESET_STATE => FRAME_TIME_RESET,
            SYNC_FLOPS  => 3)
        port map (
            clk => clk_main,
            rst => rst_main,
            d   => gen_frame_time,
            q   => gen_frame_time_s);

    ---------------------------------------------------------------------------------------------------------
    -- Time code from the LTC receiver is on the A/D modulator clock. We need it on the main clock for muxing
    -- with the others.
    ---------------------------------------------------------------------------------------------------------
    ltc_frame_time_cdc_sync : entity work.cdc_sync(synchronizer)
        generic map (
            t           => frame_time_t,
            RESET_STATE => FRAME_TIME_RESET,
            SYNC_FLOPS  => 3)
        port map (
            clk => clk_main,
            rst => rst_main,
            d   => ltcd_frame_time,
            q   => ltcd_frame_time_s);
 
    ltc_frame_rate_cdc_sync : entity work.cdc_sync(synchronizer)
        generic map (
            t           => frame_rate_t,
            RESET_STATE => FR_24,
            SYNC_FLOPS  => 3)
        port map (
            clk => clk_main,
            rst => rst_main,
            d   => ltcd_frame_rate,
            q   => ltcd_frame_rate_s);
    
    ltc_new_frame_time_cdc_sync : entity work.cdc_sync(synchronizer)
        generic map (
            t           => std_logic,
            RESET_STATE => '0',
            SYNC_FLOPS  => 3)
        port map (
            clk => clk_main,
            rst => rst_main,
            d   => ltcd_new_frame_time,
            q   => ltcd_new_frame_time_s);
    
    ---------------------------------------------------------------------------------------------------------
    -- Determine frame rate for the display.
    -- For the two incoming frame times, update the muxes only when we have a new time.
    ---------------------------------------------------------------------------------------------------------
    choose_frame_rate : process (clk_main) is
    begin  -- process choose_frame_rate
        if rising_edge(clk_main) then
            if rst_main = '1' then
                frame_rate_mux <= FR_24;
                frame_time_mux <= FRAME_TIME_RESET;
            else
                ext_int_sel : if tc_display_src = '0' then
                    -- display source is internal generator
                    frame_rate_mux <= gen_frame_rate;
                    frame_time_mux <= gen_frame_time_s;
                else
                    -- display source is either LTC or MTC.
                    ltc_mtc_sel : if tc_ext_src = '0' then
                        -- choose MTC. We need to convert from binary MTC to BCD LTC.
                        got_new_mtc : if mtcd_new_frame_time then
                            frame_rate_mux <= mtcd_frame_time.frame_rate;
                            frame_time_mux <= MTCToLTC(mtcd_frame_time);
                        end if got_new_mtc;
                    else
                        --
                        got_new_ltc : if ltcd_new_frame_time_s then
                            frame_rate_mux <= ltcd_frame_rate_s;
                            frame_time_mux <= ltcd_frame_time_s;
                        end if got_new_ltc;
                    end if ltc_mtc_sel;
                end if ext_int_sel;
            end if;
        end if;
    end process choose_frame_rate;

    ---------------------------------------------------------------------------------------------------------
    -- timer clock frequency is determined by the selected frame rate.
    ---------------------------------------------------------------------------------------------------------
    display_clk_mux : entity work.clk_mux(mux)
        port map (
            clk_main    => clk_main,
            rst_main    => rst_main,
            mmcm_locked => mmcm_locked,
            frame_rate  => frame_rate_mux,
            clk_bundle  => clk_bundle,
            clk_out     => clk_display,
            rst_out     => rst_display);

    ---------------------------------------------------------------------------------------------------------
    -- Synchronize the selected frame time and rate (from mux above, on main clock) to the display clock.
    ---------------------------------------------------------------------------------------------------------
    -- synchronize the selected frame time to the selected display clock.
    chosen_frame_time_cdc_sync : entity work.cdc_sync(synchronizer)
        generic map (
            t           => frame_time_t,
            RESET_STATE => FRAME_TIME_RESET,
            SYNC_FLOPS  => 3)
        port map (
            clk => clk_display,
            rst => rst_display,
            d   => frame_time_mux,
            q   => frame_time_mux_s);

    -- synchronize the selected frame rate to the selected display clock.
    chosen_frame_rate_cdc_sync : entity work.cdc_sync(synchronizer)
        generic map (
            t           => frame_rate_t,
            RESET_STATE => FR_24,
            SYNC_FLOPS  => 3)
        port map (
            clk => clk_display,
            rst => rst_display,
            d   => frame_rate_mux,
            q   => frame_rate_mux_s);

    ---------------------------------------------------------------------------------------------------------
    -- drive the display.
    ---------------------------------------------------------------------------------------------------------
    received_tcd : entity work.timecode_display(digit_driver)
        generic map (
            CLKPER_30FPS => CLKPER_30FPS,
            CLKPER_25FPS => CLKPER_25FPS,
            CLKPER_24FPS => CLKPER_24FPS)
        port map (
            clk_timer  => clk_display,
            rst_timer  => rst_display,
            frame_time => frame_time_mux_s,
            frame_rate => frame_rate_mux_s,
            display    => display);

end architecture mux;
