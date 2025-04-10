-------------------------------------------------------------------------------
-- Title      : Generate linear time code at a given frame rate
-- Project    : LTC/MTC converter
-------------------------------------------------------------------------------
-- File       : timecode_generator.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-09
-- Last update: 2025-04-09
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Generate linear time code at the given frame rate.
--
-- This runs freely. The only restart is if the frame rate changes; that causes the assertion of rsttimer_l.
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

entity timecode_generator is
    
    port (
        clktimer   : in std_logic;      -- clock at the proper timer rate for evenly-divisible timer tick
        rsttimer_l : in std_logic;      -- reset in that domain
        frame_rate : in frame_rate_t;   -- selected frame rate, should match clktimer frequency.
        frame_tick : in std_logic;      -- strobe at the selected frame rate
        frame_time : out frame_time_t);  -- the generated time code

end entity timecode_generator;

architecture timers of timecode_generator is

    -- the counter.
    signal ft : frame_time_t;

begin  -- architecture timers

    ---------------------------------------------------------------------------------------------------------
    -- Look up the frame count LSD for rollover.
    ---------------------------------------------------------------------------------------------------------
    RolloverLookup: process (clktimer) is
    begin  -- process RolloverLookup
        if rising_edge(clktimer) then
            Selector: case frame_rate is
                when FR_30 => ft.frame_cnt.lsd_rollover <= FC_ROLLOVER_LSD_30;
                when FR_25 => ft.frame_cnt.lsd_rollover <= FC_ROLLOVER_LSD_25;
                when FR_24 => ft.frame_cnt.lsd_rollover <= FC_ROLLOVER_LSD_24;
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
    TimeCodeGenerator : process (clktimer) is
    begin  -- process TimeCodeGenerator
        if rising_edge(clktimer) then
            if rsttimer_l = '0' then
                ft.frame_cnt.lsd <= 0;
                ft.frame_cnt.msd <= 0;
                ft.ft_sec.lsd    <= 0;
                ft.ft_sec.msd    <= 0;
                ft.ft_min.lsd    <= 0;
                ft.ft_min.msd    <= 0;
                ft.ft_hr.lsd     <= 0;
                ft.ft_hr.msd     <= 0;
            else
                OnTheTick: if frame_tick then

                    isLastFrameCnt : if ( (ft.frame_cnt.lsd = ft.frame_cnt.lsd_rollover) and
                                           (ft.frame_cnt.msd = 2) ) then
                        ft.frame_cnt.lsd <= 0;
                        ft.frame_cnt.msd <= 0;

                        isLastSec: if ft.ft_sec.lsd = 9 then
                            ft.ft_sec.lsd <= 0;
                            
                            isSecRollover: if ft.ft_sec.msd = 5 then
                                ft.ft_sec.msd <= 0;

                                isLastMin : if ft.ft_min.lsd = 9 then
                                    ft.ft_min.lsd <= 0;

                                    isMinRollover: if ft.ft_min.msd = 5 then
                                        ft.ft_min.msd <= 0;

                                        isLastHr: if ft.ft_hr.msd = 2 then
                                            
                                            isHrRollover: if ft.ft_hr.lsd = 3 then
                                                -- this is the end when everything rolls over to 0
                                                ft.ft_hr.msd <= 0;
                                                ft.ft_hr.lsd <= 0;
                                            elsif ft.ft_hr.lsd = 9 then
                                                ft.ft_hr.lsd <= 0;
                                                ft.ft_hr.msd <= ft.ft_hr.msd + 1;
                                            end if isHrRollover;
                                        else
                                            isAlsoHrRollover: if ft.ft_hr.lsd = 9 then
                                                ft.ft_hr.lsd <= 0;
                                                ft.ft_hr.msd <= ft.ft_hr.msd + 1;
                                            else
                                                ft.ft_hr.lsd <= ft.ft_hr.lsd + 1;
                                            end if isAlsoHrRollover;
                                        end if isLastHr;
                                    else
                                        ft.ft_min.msd <= ft.ft_min.msd + 1;
                                    end if isMinRollover;
                                    
                                else
                                    ft.ft_min.lsd <= ft.ft_min.lsd + 1;
                                end if isLastMin;

                            else
                                ft.ft_sec.msd <= ft.ft_sec.msd + 1;
                            end if isSecRollover;
                        else
                            ft.ft_sec.lsd <= ft.ft_sec.lsd + 1;
                        end if isLastSec;
                        
                    else

                        UpdateFrameCnt: if ft.frame_cnt.lsd = 9 then
                            ft.frame_cnt.lsd <= 0;
                            ft.frame_cnt.msd <= ft.frame_cnt.msd + 1;
                        else
                            ft.frame_cnt.lsd <= ft.frame_cnt.lsd + 1;
                        end if UpdateFrameCnt;
                        
                    end if isLastFrameCnt;

                end if OnTheTick;

            end if;
        end if;
    end process TimeCodeGenerator;

    -- to outside world.
    frame_time <= ft;

end architecture timers;

