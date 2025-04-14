-------------------------------------------------------------------------------
-- Title      : Display the timecode on eight 7-segment digits.
-- Project    : 
-------------------------------------------------------------------------------
-- File       : timecode_display.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-09
-- Last update: 2025-04-13
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Update the time code display.
--
-- The display runs on the timer clock so no synchronization is necessary.
--
-- However, we do need to vary the count for the refresh timer to maintain the same rate as the frame rate
-- changes. 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-09  -        andy	Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

use work.ltc_mtc_pkg.all;

entity timecode_display is
    generic (
        CLKPER_30FPS : time;
        CLKPER_25FPS : time;
        CLKPER_24FPS : time);
    port (
        clktimer   : in  std_logic;     -- clock at a rate that divides nicely into the frame rate
        rsttimer_l : in  std_logic;     -- reset in that domain
        frame_time : in  frame_time_t;  -- the current frame time, on clktimer
        frame_rate : in  frame_rate_t;  -- the current frame rate
        display    : out display_t);    -- all seven segments

end entity timecode_display;

architecture digit_driver of timecode_display is

    ---------------------------------------------------------------------------------------------------------
    -- Display.
    ---------------------------------------------------------------------------------------------------------
    -- On every frame tick, capture digit segments. Each digit includes the decimal point.
    -- These are the common cathodes of the digit display LEDs.
    signal all_digits : digit_array_t;

    -- Index into the LED anodes. Cathodes are common to all digits, and enabling the anode lights that
    -- digit.
    signal this_anode : natural range 0 to NUM_DIGITS - 1;

    -- Display refresh timer. The period is for one digit. Refreshing the display takes eight times that one
    -- digit. On each refresh tick, we turn on one anode so that its digit can update.
    -- The refresh period of 1 ms per digit, or 8 ms for all digits, was determined by inspection. There is
    -- no visible flicker in the display.
    -- The timer type represents the worst case.
    constant REFRESH_PERIOD : time := 1 MS;
    constant TICKS_PER_REFRESH_24 : natural := integer(REFRESH_PERIOD / CLKPER_24FPS) - 1;
    constant TICKS_PER_REFRESH_25 : natural := integer(REFRESH_PERIOD / CLKPER_25FPS) - 1;
    constant TICKS_PER_REFRESH_30 : natural := integer(REFRESH_PERIOD / CLKPER_30FPS) - 1;
    subtype refresh_timer_t is natural range 0 to TICKS_PER_REFRESH_25;
    -- from the above, we determine the rollover reload count.
    signal reload : refresh_timer_t;
    -- the timer, and a strobe tick true when it rolls over.
    signal refresh_timer : refresh_timer_t;
    signal refresh_tick  : std_logic;
    
begin  -- architecture digit_driver

    ---------------------------------------------------------------------------------------------------------
    -- Convert the time code's individual digits to a 7-segment digit.
    -- Light up the decimal point to separate hours/minutes/seconds/frames
    ---------------------------------------------------------------------------------------------------------
    UpdateDigits: process (clktimer) is
    begin  -- process UpdateDigits
        if rising_edge(clktimer) then
            all_digits(DIGIT_FRAME_LSD) <= segment_driver(frame_time.frame_cnt.lsd, DECPT_OFF);
            all_digits(DIGIT_FRAME_MSD) <= segment_driver(frame_time.frame_cnt.msd, DECPT_OFF);
            all_digits(DIGIT_SEC_LSD)   <= segment_driver(frame_time.ft_sec.lsd, DECPT_ON);
            all_digits(DIGIT_SEC_MSD)   <= segment_driver(frame_time.ft_sec.msd, DECPT_OFF);
            all_digits(DIGIT_MIN_LSD)   <= segment_driver(frame_time.ft_min.lsd, DECPT_ON);
            all_digits(DIGIT_MIN_MSD)   <= segment_driver(frame_time.ft_min.msd, DECPT_OFF);
            all_digits(DIGIT_HR_LSD)    <= segment_driver(frame_time.ft_hr.lsd, DECPT_ON);
            all_digits(DIGIT_HR_MSD)    <= segment_driver(frame_time.ft_hr.msd, DECPT_OFF);
        end if;
    end process UpdateDigits;

    ---------------------------------------------------------------------------------------------------------
    -- We multiplex the cathodes and enable the outputs with the anode.
    -- This is where we set the update rate and drive the anodes and the cathodes.
    --
    -- The refresh timer indicates when the next digit should be selected and illuminated.
    -- The timer rollover is pipelined, that is, we set the tick strobe when the count is 1 so it is true on
    -- count equals zero. Then that single bit is an enable for the output updates.
    -- Note the this_anode is updated with timer = 1, so on refresh tick the new anode is updated
    -- simultaneously with the cathodes for that digit.
    ---------------------------------------------------------------------------------------------------------
    RefreshDisplay: process (clktimer) is
    begin  -- process RefreshDisplay
        if rising_edge(clktimer) then 
            if rsttimer_l = '0' then
                reload        <= 0;
                refresh_timer <= 0;
                refresh_tick  <= '0';
                this_anode    <= 0;
                display       <= DISPLAY_TYPE_RESET;
            else

                -- determine the reload count.
                Selector: case frame_rate is
                    when FR_30 => reload <= TICKS_PER_REFRESH_30;
                    when FR_25 => reload <= TICKS_PER_REFRESH_25;
                    when FR_24 => reload <= TICKS_PER_REFRESH_24;
                    when others => report "30 FPS drop frame not supported in timecode_display" severity ERROR;
                end case Selector;
                
                -- the refresh timer just runs continously.
                TheRefreshTimer: if refresh_timer = 0 then
                    refresh_timer <= reload;
                else
                    refresh_timer <= refresh_timer - 1;
                end if TheRefreshTimer;

                -- When the timer rolls over, assert our tick and also update the current anode which is also
                -- the current digit to display. anode update aligns with cathode update below.
                RolloverTick: if refresh_timer = 1 then
                    refresh_tick <= '1';
                    this_anode   <= (this_anode + 1) mod NUM_DIGITS;
                else
                    refresh_tick <= '0';
                end if RolloverTick;

                -- drive segments and anode. Note that we first clear all anodes, and then only enable the
                -- anode that is currently selected.
                UpdateDisplay: if refresh_tick then
                    display.AN <= (others => '1');
                    display.AN(this_anode) <= '0';
                    display.CA <= all_digits(this_anode)(CA_IDX);
                    display.CB <= all_digits(this_anode)(CB_IDX);
                    display.CC <= all_digits(this_anode)(CC_IDX);
                    display.CD <= all_digits(this_anode)(CD_IDX);
                    display.CE <= all_digits(this_anode)(CE_IDX);
                    display.CF <= all_digits(this_anode)(CF_IDX);
                    display.CG <= all_digits(this_anode)(CG_IDX);
                    display.DP <= all_digits(this_anode)(DP_IDX);
                end if UpdateDisplay;
                
            end if;
        end if;
    end process RefreshDisplay;



end architecture digit_driver;

