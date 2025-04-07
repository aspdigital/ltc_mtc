-------------------------------------------------------------------------------
-- Title      : Strobe at the frame rate
-- Project    : 
-------------------------------------------------------------------------------
-- File       : frame_timer.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-06
-- Last update: 2025-04-06
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
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

    generic (
        CLKPER : time);                 -- logic clock period

    port (
        clk        : in  std_logic;     -- our logic clock
        rst_l      : in  std_logic;     -- reset in that domain
        frame_rate : in  frame_rate_t;  -- the frame rate
        frame_tick : out std_logic);    -- strobe true at frame rate

end entity frame_timer;

architecture timer of frame_timer is

    -- Frame rate timer. The number of ticks in a frame is a maximum with the longest frame time (lowest
    -- frame rate).
    constant FRAMES_PER_SECOND_MIN : natural := 24;  -- minimum frame rate we support
    -- get frame time.
    constant FRAME_TIME_24         : time    := 1 SEC / FRAMES_PER_SECOND_MIN;
    -- get the number of ticks in the longst frame time.
    constant TICKS_PER_FRAME_24    : natural := integer(FRAME_TIME_24 / CLKPER);
    -- support other frame rates.
    constant FRAME_TIME_25         : time    := 1 SEC / 25;
    constant FRAME_TIME_30         : time    := 1 SEC / 30;
    constant TICKS_PER_FRAME_25    : natural := integer(FRAME_TIME_25 / CLKPER) -  1;
    constant TICKS_PER_FRAME_30    : natural := integer(FRAME_TIME_30 / CLKPER) -  1;

    subtype frame_tickcnt_t is natural range 0 to TICKS_PER_FRAME_24 - 1;
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
