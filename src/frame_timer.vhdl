-------------------------------------------------------------------------------
-- Title      : Strobe at the frame rate
-- Project    : 
-------------------------------------------------------------------------------
-- File       : frame_timer.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-06
-- Last update: 2025-04-08
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Generate a strobe at the selected frame rate.
-- This is essentially a counter that runs continuously and rolls over at the frame rate.
-- 
-- NB we use magic numbers for the dividers as we "know" the frequency of the clock used to generate the
-- given frame rate. The clock coming in here will always be at the "correct" frequency as it is selected by
-- the frame rate decider logic.
--
-- TODO: pass in the frequencies/periods of the clocks for each frame rate and use them instead of the magic
-- numbers.
--
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-06  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.ltc_mtc_pkg.all;

entity frame_timer is
    port (
        clk        : in  std_logic;     -- our logic clock
        rst_l      : in  std_logic;     -- reset in that domain
        frame_rate : in  frame_rate_t;  -- the frame rate
        frame_tick : out std_logic);    -- strobe true at frame rate

end entity frame_timer;

architecture timer of frame_timer is

    -- these are magic numbers, based on timer clock frequencies.
    -- for 24 fps the timer clock is 37.5 MHz.
    constant TICKS_PER_FRAME_24 : natural := 1562500;
    -- for 25 fps the timer clock is 50 MHz.
    constant TICKS_PER_FRAME_25 : natural := 2000000;
    -- for 30 fps the timer clock is 33 MHz.
    constant TICKS_PER_FRAME_30 : natural := 1100000;

    subtype frame_tickcnt_t is natural range 0 to TICKS_PER_FRAME_25 - 1;
    signal frame_tickcnt : frame_tickcnt_t;

begin  -- architecture timer

    ---------------------------------------------------------------------------------------------------------
    -- Frame timer, which counts ticks of our system clock and updates the frame time appropriately.
    ---------------------------------------------------------------------------------------------------------
    FrameTimer : process (clk) is
    begin  -- process FrameTimer
        if rising_edge(clk) then
            if rst_l = '0' then
                frame_tickcnt <= 0;
                frame_tick    <= '0';
            else
                StrobeFrameTick : if frame_tickcnt = 1 then
                    frame_tick <= '1';
                else
                    frame_tick <= '0';
                end if StrobeFrameTick;

                FrameTimerCount : if frame_tickcnt = 0 then
                    FrameTimeRollover : case frame_rate is
                        when FR_30 =>
                            frame_tickcnt <= TICKS_PER_FRAME_30 - 1;
                        when FR_25 =>
                            frame_tickcnt <= TICKS_PER_FRAME_25 - 1;
                        when FR_24 =>
                            frame_tickcnt <= TICKS_PER_FRAME_24 - 1;
                        when others => null;
                    end case FrameTimeRollover;

                else
                    frame_tickcnt <= frame_tickcnt - 1;
                end if FrameTimerCount;

            end if;
        end if;
    end process FrameTimer;

end architecture timer;
