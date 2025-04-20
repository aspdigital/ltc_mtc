-------------------------------------------------------------------------------
-- Title      : Generate linear time code at a given frame rate
-- Project    : LTC/MTC converter
-------------------------------------------------------------------------------
-- File       : timecode_generator.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-09
-- Last update: 2025-04-20
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Generate linear time code at the given frame rate.
--
-- This runs freely. The only restart is if the frame rate changes; that causes the assertion of rst_timer_l.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-09  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

use work.ltc_mtc_pkg.all;
use work.timecode_pkg.all;

entity timecode_generator is

    port (
        clk_timer   : in  std_logic;      -- clock at the proper timer rate for evenly-divisible timer tick
        rst_timer_l : in  std_logic;      -- reset in that domain
        frame_rate  : in  frame_rate_t;   -- selected frame rate, should match clk_timer frequency.
        frame_tick  : in  std_logic;      -- strobe at the selected frame rate
        frame_time  : out frame_time_t);  -- the generated time code

end entity timecode_generator;

architecture timers of timecode_generator is

    -- the counter.
    signal ft : frame_time_t;

    -- frame count rollover is based on the frame rate.
    signal fc_rollover : natural range 0 to 9;

begin  -- architecture timers

    ---------------------------------------------------------------------------------------------------------
    -- Look up the frame count LSD for rollover.
    ---------------------------------------------------------------------------------------------------------
    RolloverLookup : process (clk_timer) is
    begin  -- process RolloverLookup
        if rising_edge(clk_timer) then
            Selector : case frame_rate is
                when FR_30  => fc_rollover <= FC_ROLLOVER_LSD_30;
                when FR_25  => fc_rollover <= FC_ROLLOVER_LSD_25;
                when FR_24  => fc_rollover <= FC_ROLLOVER_LSD_24;
                when others => report "30 FPS drop frame not supported (timecode generator)" severity ERROR;
            end case Selector;
        end if;
    end process RolloverLookup;

    ---------------------------------------------------------------------------------------------------------
    -- Time code counter.
    -- On every frame tick, increment the frame counter LSD.
    -- When frame counter LSD rolls over, increment the frame counter MSD.
    -- When frame counter MSD rolls over, increment the seconds counter LSD.
    -- And so forth.
    --
    -- Frame counter rollover is a bit of a special case because it will roll over after 23, 24 or 29 counts.
    ---------------------------------------------------------------------------------------------------------
    TimeCodeGenerator : process (clk_timer) is
        variable v_fc  : frame_cnt_t;
        variable v_sec : time_0_to_59_t;
        variable v_min : time_0_to_59_t;
        variable v_hr  : time_0_to_23_t;
    begin  -- process TimeCodeGenerator
        if rising_edge(clk_timer) then
            if rst_timer_l = '0' then
                v_fc  := FRAME_CNT_RESET;
                v_sec := MINSEC_RESET;
                v_min := MINSEC_RESET;
                v_hr  := HR_RESET;

                ft <= (
                    frame_cnt => v_fc,
                    ft_sec    => v_sec,
                    ft_min    => v_min,
                    ft_hr     => v_hr);

            else
                -- Update the counter every frame.
                OnTheTick : if frame_tick then

                    -- start from frame to seconds to minutes to hours, incrementing and carrying as needed.
                    v_fc := IncrementDigits(ARG => ft.frame_cnt, TC => fc_rollover);

                    FrameCountRollover : if v_fc.carry then
                        -- frame count rolled over, increment seconds.
                        v_sec := IncrementDigits(ARG => ft.ft_sec);

                        SecondsRollover : if v_sec.carry then
                            -- seconds rolled over, increment minutes.
                            v_min := IncrementDigits(ARG => ft.ft_min);

                            MinutesRollover : if v_min.carry then
                                -- minutes rolled over, increment hours.
                                v_hr := IncrementDigits(ARG => ft.ft_hr);

                            -- hours rolled over so now everything should be zero.
                            end if MinutesRollover;

                        end if SecondsRollover;

                    end if FrameCountRollover;

                    ft <= (
                        frame_cnt => v_fc,
                        ft_sec    => v_sec,
                        ft_min    => v_min,
                        ft_hr     => v_hr);

                end if OnTheTick;

            end if;
        end if;
    end process TimeCodeGenerator;

    -- to outside world.
    frame_time <= ft;

end architecture timers;

