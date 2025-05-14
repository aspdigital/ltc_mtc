-------------------------------------------------------------------------------
-- Title      : Generate both LTC and MTC
-- Project    : 
-------------------------------------------------------------------------------
-- File       : tc_generator.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-05-13
-- Last update: 2025-05-13
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: This wrapper generates both LTC and MTC based on the switches.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-05-13  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ltc_mtc_pkg.all;   
use work.timecode_pkg.all;
use work.clk_mux_pkg.all;
use work.mtc_pkg.all;

entity tc_generator is
    generic (
        CLK_MAIN_PER  : time;
        DEBOUNCE_WAIT : time;
        DEBOUNCE_CLK_PER : time);
    port (
        -- clocking. Main clock always runs and is for selecting the generator clocks.
        clk_main       : in  std_logic;     -- "main" logic clock
        rst_main       : in  std_logic;     -- reset in that domain
        -- bundle contains the three clocks used for the generator.
        clk_bundle     : in  clk_bundle_t;  -- the clocks that can drive the generators
        mmcm_locked    : in  std_logic;     -- true when those clocks are valid
        -- from the switches that set the generator frame rate.
        frsw           : in std_logic_vector(1 downto 0);
        -- send MIDI Full Frame MTC if asserted.
        do_full_frame  : in std_logic;
        -- time code outputs, and the rate at which they run.
        ltc            : out std_logic; 
        mtc            : out std_logic;
        gen_frame_rate : out frame_rate_t;
        gen_frame_time : out frame_time_t);

end entity tc_generator;

architecture tcgen of tc_generator is

    -- we determine the frame rate from two switches. This selects the clock used to generate the timecode.
    signal frame_rate : frame_rate_t;
    signal frame_rate_s : frame_rate_t;  -- sync to the timer clock

    -- that clock.
    signal clk_timer : std_logic;
    signal rst_timer : std_logic;

    -- debounce sync the "do full frame" button press to the timer clock.
    signal do_full_frame_s : std_logic;

    -- we get a tick once per frame, and we get a quarter-frame tick for MIDI time code.
    signal frame_tick : std_logic;
    signal qframe_pkt : qframe_pkt_t;

    -- the output of the frame time generator.
    signal frame_time : frame_time_t;

begin  -- architecture tcgen

    ---------------------------------------------------------------------------------------------------------
    -- Frame rate is set by the state of switches 0 and 1.
    -- After debounce, encode that select into the frame rate type. We do this on the main clock, and not the
    -- timer clock, because the frame rate here is used (in clks_rst) to select the timer clock.
    ---------------------------------------------------------------------------------------------------------
    get_generator_frame_rate : process (clk_main) is
    begin  -- process GetFrameRate
        if rising_edge(clk_main) then
            if rst_main = '1' then
                frame_rate <= FR_24;
            else
                frame_rate <= frame_rate_t'val(to_integer(unsigned(frsw)));
            end if;
        end if;
    end process get_generator_frame_rate;

    gen_frame_rate <= frame_rate;

    ---------------------------------------------------------------------------------------------------------
    -- Select one of the three options as the timer clock, based on the switches.
    -- Generate a reset synchronized to that clock.
    -- combine reset sources and register to the main clock before feeding it to the reset generator.
    -- This ensures so we don't have a weird combinatorial path on the reset synchronizer's async reset input.
    -- Those reset sources are:
    -- 1. Main timer reset, asserted at the beginning of time,
    -- 2. MMCM lock, which should assert soon after the beginning of time,
    -- 3. Change in frame rate, which can happen at any time.
    ---------------------------------------------------------------------------------------------------------
    timer_clk_mux : entity work.clk_mux(mux)
        port map (
            clk_main    => clk_main,
            rst_main    => rst_main,
            mmcm_locked => mmcm_locked,
            frame_rate  => frame_rate,
            clk_bundle  => clk_bundle,
            --
            clk_out     => clk_timer,
            rst_out     => rst_timer);

    ---------------------------------------------------------------------------------------------------------
    -- Sync frame rate to the timer clock, as it is needed in that domain.
    -- NB that the timer clock will change if the frame rate changes.
    ---------------------------------------------------------------------------------------------------------
    frame_rate_cdc_sync : entity work.cdc_sync(synchronizer)
        generic map (
            t           => frame_rate_t,
            RESET_STATE => FR_30,
            SYNC_FLOPS  => 3)
        port map (
            clk => clk_timer,
            rst => rst_timer,
            d   => frame_rate,
            q   => frame_rate_s);

    ---------------------------------------------------------------------------------------------------------
    -- Frame tick counter.
    -- Generate a strobe once per frame, at the rate of 24, 25 or 30 fps, depending on the chosen rate.
    ---------------------------------------------------------------------------------------------------------
    frame_timer_tick : entity work.frame_timer(timer)
        port map (
            clk        => clk_timer,
            rst        => rst_timer,
            frame_rate => frame_rate_s,
            frame_tick => frame_tick,
            qframe_pkt => qframe_pkt);

    ---------------------------------------------------------------------------------------------------------
    -- This is where we generate the time code, given a frame rate. The code updates with every frame_tick.
    -- The generator runs freely. It restarts only when the frame rate changes.
    ---------------------------------------------------------------------------------------------------------
    tcg : entity work.timecode_generator(timers)
        port map (
            clk_timer  => clk_timer,
            rst_timer  => rst_timer,
            frame_rate => frame_rate_s,
            frame_tick => frame_tick,
            frame_time => frame_time);

    -- for the display logic.
    gen_frame_time <= frame_time;

    ---------------------------------------------------------------------------------------------------------
    -- Encode the time code as LTC and drive it out
    ---------------------------------------------------------------------------------------------------------
    ltc_enc : entity work.ltc_encoder(coder)
        port map (
            clk_timer  => clk_timer,
            rst_timer  => rst_timer,
            frame_rate => frame_rate_s,
            frame_tick => frame_tick,
            frame_time => frame_time,
            ltc        => ltc);

    ---------------------------------------------------------------------------------------------------------
    -- Sync the "full frame" button to the selected timer clock.
    ---------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------
    -- Debounce the button we use to initiate a Full Frame time message over MIDI.
    -- As this switch is used in the timer clock domain, sync it to that clock.
    ---------------------------------------------------------------------------------------------------------
    ff_sw_debounce : entity work.debounce(swdeb)
        generic map (
            CLKPER        => DEBOUNCE_CLK_PER,         -- period of the logic clock
            DEBOUNCE_WAIT => DEBOUNCE_WAIT,  -- when to sample after initial switch change
            ACTIVE_STATE  => '1')
        port map (
            clk  => clk_timer,               -- the logic clock to which the switch is synchronized
            rst  => rst_timer,               -- reset in that domain
            sw   => do_full_frame,                    -- the switch input
            swdb => do_full_frame_s);          -- debounced switch output

    ---------------------------------------------------------------------------------------------------------
    -- Encode the time code as MTC and drive it out.
    ---------------------------------------------------------------------------------------------------------
    mtc_enc_and_tx : entity work.mtc_tx(mtc_driver)
        generic map (
            CLK_MAIN_PER => CLK_MAIN_PER)
        port map (
            clk_timer     => clk_timer,
            rst_timer     => rst_timer,
            frame_rate    => frame_rate_s,
            frame_tick    => frame_tick,
            frame_time    => frame_time,
            qframe_pkt    => qframe_pkt,
            do_full_frame => do_full_frame,
            clk_main      => clk_main,
            rst_main      => rst_main,
            midi_ser_tx   => mtc);

end architecture tcgen;
