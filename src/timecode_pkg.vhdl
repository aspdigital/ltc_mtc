-------------------------------------------------------------------------------
-- Title      : Support for time code
-- Project    : 
-------------------------------------------------------------------------------
-- File       : timecode_pkg.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-20
-- Last update: 2025-05-25
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: this package contains definitions and functions related to time code.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-20  -        andy	Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mtc_pkg.all;

package timecode_pkg is

    ---------------------------------------------------------------------------------------------------------
    -- These records hold the BCD representation of a time code frame.
    --
    -- The frame is:
    --
    -- HR:MIN:SEC:FRAME
    --
    -- Maintaining the frame as BCD helps with display so we don't have to divide a 16-bit binary value by
    -- ten to get the contents of a digit. Also linear time code uses BCD for the time fields.
    ---------------------------------------------------------------------------------------------------------
    
    -- the frame count can range from 0 to 29.
    -- Frame count rolls over at 3, 4 or 9, depending on selected frame rate.
    type frame_cnt_t is record
        lsd          : natural range 0 to 9;
        msd          : natural range 0 to 2;
        carry        : std_logic;       -- true on rollover
    end record frame_cnt_t;

    constant FRAME_CNT_RESET : frame_cnt_t := (lsd => 0, msd => 0, carry => '0');

    -- seconds and minutes range from 0 to 59.
    type time_0_to_59_t is record
        lsd : natural range 0 to 9;
        msd : natural range 0 to 5;
        carry : std_logic;              -- true on rollover
    end record time_0_to_59_t;

    constant MINSEC_RESET : time_0_to_59_t := (lsd => 0, msd => 0, carry => '0');

    -- hours range from 0 to 23.
    type time_0_to_23_t is record
        lsd : natural range 0 to 9;
        msd : natural range 0 to 2;
        carry : std_logic;              -- true on rollover
    end record time_0_to_23_t;

    constant HR_RESET : time_0_to_23_t := (lsd => 0, msd => 0, carry => '0');
    
    -- helper functions.
    -- increment the frame count, and indicate rollover with carry.
    function IncrementDigits (
        constant ARG : frame_cnt_t;
        constant TC  : natural range 0 to 9)
        return frame_cnt_t;

    -- increment the second or minute count, and indicate rollover with carry.
    function IncrementDigits (
        constant ARG : time_0_to_59_t)
        return time_0_to_59_t;

    -- increment the hour  count, and indicate rollover with carry.
    function IncrementDigits (
        constant ARG : time_0_to_23_t)
        return time_0_to_23_t;

    -- convert two BCDs to a standard natural, in SLV notion.
    -- there is a version of this for all three BCD types.
    function BCDToSLV (
        constant ARG : frame_cnt_t)
        return std_logic_vector;
    
    function BCDToSLV (
        constant ARG : time_0_to_23_t)
        return std_logic_vector;
    
    function BCDToSLV (
        constant ARG : time_0_to_59_t)
        return std_logic_vector;

    ---------------------------------------------------------------------------------------------------------
    -- Convert straight binary to two BCDs.
    ---------------------------------------------------------------------------------------------------------
    function FramesNatToBCD (
        constant ARG : frames_t)
        return frame_cnt_t;

    function SecondsNatToBCD (
        constant ARG : seconds_t)
        return time_0_to_59_t;

    function MinutesNatToBCD (
        constant ARG : minutes_t)
        return time_0_to_59_t;

    function HoursNatToBCD (
        constant ARG : hours_t)
        return time_0_to_23_t;
    
    ---------------------------------------------------------------------------------------------------------
    -- keep track of time with this record.
    -- we keep track of the individual digits, so we don't have to divide to work them out.
    ---------------------------------------------------------------------------------------------------------
    type frame_time_t is record
        -- frame range is max 29
        frame_cnt  : frame_cnt_t;
        -- seconds range from 0 to 59
        ft_sec     : time_0_to_59_t;
        -- minutes range from 0 to 59
        ft_min     : time_0_to_59_t;
        -- hours range from 0 to 23
        ft_hr      : time_0_to_23_t;
    end record frame_time_t;

    -- provide a constant initializer/reset condition for the frame_time_t record, used mainly for CDC.
    constant FRAME_TIME_RESET : frame_time_t := (
        frame_cnt  => FRAME_CNT_RESET,
        ft_sec     => MINSEC_RESET,
        ft_min     => MINSEC_RESET,
        ft_hr      => HR_RESET);

end package timecode_pkg;

package body timecode_pkg is
    
    ---------------------------------------------------------------------------------------------------------
    -- helper functions.
    ---------------------------------------------------------------------------------------------------------
    -- increment the frame count, and indicate rollover with carry.
    -- There's a complication with the MSD of the count, which can terminate at 3, 4 or 9 depending on the
    -- frame rate.
    -- Carry is asserted only on terminal count (frame count rolls over from 23 or 24 or 29 to 0).
    function IncrementDigits (
        constant ARG : frame_cnt_t;
        constant TC  : natural range 0 to 9)
        return frame_cnt_t is
        variable rv : frame_cnt_t;
    begin  -- function IncrementFrame
        FrameCount : if ((ARG.msd = 2) and (ARG.lsd = TC)) then
            -- last frame in this second.
            rv.lsd   := 0;
            rv.msd   := 0;
            rv.carry := '1';
        elsif ARG.lsd = 9 then
            -- LSD of count is 9 or 19, simply roll over.
            rv.lsd   := 0;
            -- and increment MSD of count.
            rv.msd   := ARG.msd + 1;
            rv.carry := '0';
        else
            rv.lsd   := ARG.lsd + 1;
            rv.msd   := ARG.msd;
            rv.carry := '0';
        end if FrameCount;

        return rv;

    end function IncrementDigits;

    -- increment the second or minute count, and indicate rollover with carry.
    function IncrementDigits (
        constant ARG : time_0_to_59_t)
        return time_0_to_59_t is
        variable rv : time_0_to_59_t;
    begin
        MinSecCount: if ((ARG.msd = 5) and (ARG.lsd = 9)) then
            -- count rolls over from 59 to 0
            rv.lsd   := 0;
            rv.msd   := 0;
            rv.carry := '1';
        elsif ARG.lsd = 9 then
            -- ones digit rolls over, so increment 10s.
            rv.lsd := 0;
            rv.msd := ARG.msd + 1;
            rv.carry := '0';
        else
            rv.lsd   := ARG.lsd + 1;
            rv.msd   := ARG.msd;
            rv.carry := '0';
        end if MinSecCount;

        return rv;
        
    end function IncrementDigits;

    -- increment the hour  count, and indicate rollover with carry.
    function IncrementDigits (
        constant ARG : time_0_to_23_t)
        return time_0_to_23_t is
        variable rv : time_0_to_23_t;
    begin 
        HrCount: if ((ARG.msd = 2) and (ARG.lsd = 3)) then
            -- count rolls over from 23 to 0
            rv.lsd   := 0;
            rv.msd   := 0;
            rv.carry := '1';
        elsif ARG.lsd = 9 then
            -- ones digit rolls over, so increment 10s.
            rv.lsd := 0;
            rv.msd := ARG.msd + 1;
            rv.carry := '0';
        else
            rv.lsd   := ARG.lsd + 1;
            rv.msd   := ARG.msd;
            rv.carry := '0';
        end if HrCount;

        return rv;
        
    end function IncrementDigits;

    -- convert two BCDs to a standard natural, in SLV notion.
    -- there is a version of this for all BCD types.
    -- note that hours returns only 6 bits because the message has the frame rate in the 2 MSbs.

    -- for frame count
    function BCDToSLV (
        constant ARG : frame_cnt_t)
        return std_logic_vector is
        variable rv : std_logic_vector(7 downto 0);
    begin
        rv := std_logic_vector(to_unsigned(ARG.msd * 10 + ARG.lsd, rv'length));
        return rv;
    end function BCDToSLV;

    -- for hours count.
    function BCDToSLV (
        constant ARG : time_0_to_23_t)
        return std_logic_vector is
        variable rv : std_logic_vector(5 downto 0);
    begin
        rv := std_logic_vector(to_unsigned(ARG.msd * 10 + ARG.lsd, rv'length));
        return rv;
    end function BCDToSLV;

    -- for minutes and seconds count
    function BCDToSLV (
        constant ARG : time_0_to_59_t)
        return std_logic_vector is
        variable rv : std_logic_vector(7 downto 0);
    begin
        rv := std_logic_vector(to_unsigned(ARG.msd * 10 + ARG.lsd, rv'length));
        return rv;
    end function BCDToSLV;

    ---------------------------------------------------------------------------------------------------------
    -- convert binary byte to two BCD digits.
    ---------------------------------------------------------------------------------------------------------
    function FramesNatToBCD (
        constant ARG : frames_t)
        return frame_cnt_t is
        variable rv : frame_cnt_t;
    begin
        rv.lsd := ARG mod 10;
        rv.msd := ARG / 10;
        rv.carry := '0';
    end function FramesNatToBCD;

    function SecondsNatToBCD (
        constant ARG : seconds_t)
        return time_0_to_59_t is
        variable rv : time_0_to_59_t;
    begin
        rv.lsd := ARG mod 10;
        rv.msd := ARG / 10;
        rv.carry := '0';
    end function SecondsNatToBCD;

    function MinutesNatToBCD (
        constant ARG : minutes_t)
        return time_0_to_59_t is
        variable rv : time_0_to_59_t;
    begin
        rv.lsd := ARG mod 10;
        rv.msd := ARG / 10;
        rv.carry := '0';
    end function MinutesNatToBCD;

    function HoursNatToBCD (
        constant ARG : hours_t)
        return time_0_to_23_t is
        variable rv : time_0_to_59_t;
    begin
        rv.lsd := ARG mod 10;
        rv.msd := ARG / 10;
        rv.carry := '0';
    end function HoursNatToBCD;

end package body timecode_pkg;

