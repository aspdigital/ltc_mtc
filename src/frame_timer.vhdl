-------------------------------------------------------------------------------
-- Title      : Strobe at the frame rate
-- Project    : 
-------------------------------------------------------------------------------
-- File       : frame_timer.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-06
-- Last update: 2025-04-13
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
-- MIDI time code sends two-byte messages at a Quarter Frame rate. There are actually eight quarter-frame
-- messages, so it takes a receiver two full SMPTE frames to achieve lock. To simplify the logic that sends
-- the various quarter-frame messages, in addition to the frame_tick strobe at every frame time, we output a
-- quarter-frame strobe along with an identifier indicating which of the eight quarter-frame messages should
-- be sent. The zeroth quarter frame message is driven simultaneously with the main frame_tick.
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
-- 2025-04-12           andy    add quarter-frame outputs for MTC generation.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.ltc_mtc_pkg.all;
use work.mtc_pkg.all;

entity frame_timer is
    port (
        clk        : in  std_logic;     -- our logic clock
        rst_l      : in  std_logic;     -- reset in that domain
        frame_rate : in  frame_rate_t;  -- the frame rate
        frame_tick : out std_logic;    -- strobe true at frame rate
        qframe_pkt : out qframe_pkt_t);  -- for MTC generation, the quarter frame

end entity frame_timer;

architecture timer of frame_timer is

    -- these are magic numbers, based on timer clock frequencies.
    -- for 24 fps the timer clock is 37.5 MHz.
    constant TICKS_PER_FRAME_24 : natural := 1562500;
    constant QFRAME_24 : natural := TICKS_PER_FRAME_24 / 4;
    -- for 25 fps the timer clock is 50 MHz.
    constant TICKS_PER_FRAME_25 : natural := 2000000;
    constant QFRAME_25 : natural := TICKS_PER_FRAME_25 / 4;
    -- for 30 fps the timer clock is 33 MHz.
    constant TICKS_PER_FRAME_30 : natural := 1100000;
    constant QFRAME_30 : natural := TICKS_PER_FRAME_30 / 4;

    -- counter for frame rate timer.
    subtype frame_tickcnt_t is natural range 0 to TICKS_PER_FRAME_25 - 1;
    signal frame_tickcnt : frame_tickcnt_t;
    signal frame_tick_i : std_logic;    -- the tick itself

    -- keep track of the quarter frames.
    signal qframe_id : qframe_id_t;
    -- counter for quarter frame timer.
    subtype qframe_tickcnt_t is natural range 0 to QFRAME_25 - 1;
    signal qframe_tickcnt : qframe_tickcnt_t;
    -- the tick asserted ever quarter frame.
    signal qframe_tick : std_logic;
    
begin  -- architecture timer

    ---------------------------------------------------------------------------------------------------------
    -- Frame timer, which counts ticks of our system clock and updates the frame time appropriately.
    ---------------------------------------------------------------------------------------------------------
    FrameTimer : process (clk) is
    begin  -- process FrameTimer
        if rising_edge(clk) then
            if rst_l = '0' then
                frame_tickcnt <= 1;     -- for proper initial load
                frame_tick_i    <= '0';
            else
                StrobeFrameTick : if frame_tickcnt = 1 then
                    frame_tick_i <= '1';
                else
                    frame_tick_i <= '0';
                end if StrobeFrameTick;

                -- frame_tick_i true coincides with the tick count = 0, so the timer rolls over then.
                -- Frame rate determines the reload value.
                FrameTimerCount : if frame_tick_i then
                    FrameTimeRollover : case frame_rate is
                        when FR_30 =>
                            frame_tickcnt <= TICKS_PER_FRAME_30 - 1;
                        when FR_25 =>
                            frame_tickcnt <= TICKS_PER_FRAME_25 - 1;
                        when FR_24 =>
                            frame_tickcnt <= TICKS_PER_FRAME_24 - 1;
                        when others =>
                            report "We don't support 30 FPS drop frame for FrameTimer" severity ERROR;
                    end case FrameTimeRollover;

                else
                    frame_tickcnt <= frame_tickcnt - 1;
                end if FrameTimerCount;

            end if;
        end if;
    end process FrameTimer;

    frame_tick <= frame_tick_i;

    ---------------------------------------------------------------------------------------------------------
    -- Count quarter frames. This works like the full frame timer, except that it rolls over four times
    -- during one frame. This is synchronized with the full frame tick when that counter rolls over.
    ---------------------------------------------------------------------------------------------------------
    QuarterFrameCounter: process (clk) is
    begin  -- process QuarterFrameCounter
        if rising_edge(clk) then
            if rst_l = '0' then 
                qframe_id <= 7;         -- for proper initial load
                qframe_tickcnt <= 1;    -- same
                qframe_tick <= '0';
            else

                -- the quarter-frame tick goes out on rollover. Update qframe ID here, too, so it coincides
                -- with the tick.
                StrobeQFrameTick: if qframe_tickcnt = 1 then
                    qframe_tick <= '1';
                    is_frame_tick_sync: if frame_tickcnt = 1 then
                        qframe_id <= 0;
                    else
                        qframe_id <= qframe_id + 1;
                    end if is_frame_tick_sync;
                else
                    qframe_tick <= '0';
                end if StrobeQFrameTick;

                -- qframe_tick true coincides with the tick count = 0, so the timer rolls over then.
                -- frame rate determines the reload value.
                QframeTimerCount: if qframe_tick then
                    QframeReload: case frame_rate is
                        when FR_30 =>
                            qframe_tickcnt <= QFRAME_30 - 1;
                        when FR_25 =>
                            qframe_tickcnt <= QFRAME_25 - 1;
                        when FR_24 =>
                            qframe_tickcnt <= QFRAME_24 - 1;
                        when others =>
                            report "We don't support 30 FPS drop frame for QFrameTimer" severity ERROR;
                    end case QframeReload;
                else
                    qframe_tickcnt <= qframe_tickcnt - 1;
                end if QframeTimerCount;
                
            end if;
        end if;
    end process QuarterFrameCounter;

    -- to outside world:
    qframe_pkt.id <= qframe_id;
    qframe_pkt.tick <= qframe_tick;
    
end architecture timer;
