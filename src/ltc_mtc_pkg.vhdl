-------------------------------------------------------------------------------
-- Title      : Types and constants used by the LTC/MTC conversion design
-- Project    : LTC/MTC conversion
-------------------------------------------------------------------------------
-- File       : ltc_mtc_pkg.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-08
-- Last update: 2025-04-08
-- Platform   : Xilinx Artix 7
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: This package contains a handful of types, constants and functions that are conveniences for
-- this MTC/LTC conversion design.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-08  -        andy    Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

package ltc_mtc_pkg is

    ---------------------------------------------------------------------------------------------------------
    -- We support three possible frame rates.
    ---------------------------------------------------------------------------------------------------------
    type frame_rate_t is (
        FR_30,                          -- 30 fps
        FR_25,                          -- 25 fps
        FR_24);                         -- 24 fps

    ---------------------------------------------------------------------------------------------------------
    -- These types manage the digits for time code display.
    -- Tens and ones digits are managed separately so we don't have to do a divide.
    -- lsd: least significant digit
    -- msd: most significant digit.
    ---------------------------------------------------------------------------------------------------------
    -- the frame count can range from 0 to 29.
    -- Frame count rolls over at 3, 4 or 9, depending on selected frame rate.
    type frame_cnt_t is record
        lsd          : natural range 0 to 9;
        msd          : natural range 0 to 2;
        lsd_rollover : natural range 0 to 9;  -- set based on frame rate
    end record frame_cnt_t;

    -- seconds and minutes range from 0 to 59.
    type time_0_to_59_t is record
        lsd : natural range 0 to 9;
        msd : natural range 0 to 5;
    end record time_0_to_59_t;

    -- hours range from 0 to 23.
    type time_0_to_23_t is record
        lsd : natural range 0 to 9;
        msd : natural range 0 to 2;
    end record time_0_to_23_t;

    ---------------------------------------------------------------------------------------------------------
    -- keep track of time with this record.
    -- we keep track of the individual digits, so we don't have to divide to work them out.
    -- The selected frame rate just goes along for the ride here.
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
        -- frame rate 
        frame_rate : frame_rate_t;
    end record frame_time_t;

    -- provide a constant initializer/reset condition for the frame_time_t record, used mainly for CDC.
    constant FRAME_TIME_RESET : frame_time_t := (
        frame_cnt  => (lsd => 0, msd => 0, lsd_rollover => 0),
        ft_sec     => (lsd => 0, msd => 0),
        ft_min     => (lsd => 0, msd => 0),
        ft_hr      => (lsd => 0, msd => 0),
        frame_rate => FR_30);

    ---------------------------------------------------------------------------------------------------------
    -- Support for the 7-segment display.
    ---------------------------------------------------------------------------------------------------------
    -- a digit, after encoding into the display. This includes the decimal point in the MSb.
    subtype digit_t is std_logic_vector(7 downto 0);
    -- define the indices in that vector for the cathode it drives.
    constant CA_IDX : natural := 0;
    constant CB_IDX : natural := 1;
    constant CC_IDX : natural := 2;
    constant CD_IDX : natural := 3;
    constant CE_IDX : natural := 4;
    constant CF_IDX : natural := 5;
    constant CG_IDX : natural := 6;
    constant DP_IDX : natural := 7;

    -- all of the digits on the board.
    constant NUM_DIGITS : natural := 8;
    type digit_array_t is array (NUM_DIGITS - 1 downto 0) of digit_t;

    -- digit assignments:
    constant DIGIT_HR_MSD    : natural := 7;  -- left-most digit
    constant DIGIT_HR_LSD    : natural := 6;
    constant DIGIT_MIN_MSD   : natural := 5;
    constant DIGIT_MIN_LSD   : natural := 4;
    constant DIGIT_SEC_MSD   : natural := 3;
    constant DIGIT_SEC_LSD   : natural := 2;
    constant DIGIT_FRAME_MSD : natural := 1;
    constant DIGIT_FRAME_LSD : natural := 0;  -- right-most digit

    -- Encode a digit into a seven-segment display.
    --        A
    --      -----
    --     |     |
    --    F|     |B
    --     |  G  |
    --      -----
    --     |     |
    --    E|     |C
    --     |  D  |     DP
    --      -----      .
    --
    -- Where segment A is output bit 0, B is 1, etc, and DP is bit 7
    constant DECPT_ON  : std_logic := '0';  -- active low on
    constant DECPT_OFF : std_logic := '1';

    -- constrain the range of the DIGIT argument to the segment_driver function so synthesis doesn't complain
    -- about not testing all 2^31 possibilities.
    subtype ones_digit_t is natural range 0 to 9;

    -- The segment driver is basically a look-up table. Given a decimal digit as input, return the segments A
    -- to G to make that digit light up. Remember that segments are active LOW.
    -- The decimal point is encoded as bit 7 of the return vector.
    function segment_driver (
        constant DIGIT : ones_digit_t;  -- digit to display
        constant DECPT : std_logic)     -- set to light up decimal
        return digit_t;

end package ltc_mtc_pkg;

package body ltc_mtc_pkg is

    -- Encode a digit into a seven-segment display.
    --        A
    --      -----
    --     |     |
    --    F|     |B
    --     |  G  |
    --      -----
    --     |     |
    --    E|     |C
    --     |  D  |     DP
    --      -----      .
    --
    -- Where segment A is output bit 0, B is 1, etc, and DP is bit 7
    -- note that our cathodes are all active LOW.
    function segment_driver (
        constant DIGIT : ones_digit_t;  -- digit to display
        constant DECPT : std_logic)     -- set to light up decimal
        return digit_t is
        variable seg : std_logic_vector(6 downto 0);
    begin  -- function segment_driver
        DigitEncoder : case DIGIT is
            --                GFEDCBA 
            when 0 => seg := "1000000";
            when 1 => seg := "1111001";
            when 2 => seg := "0100100";
            when 3 => seg := "0110000";
            when 4 => seg := "0011001";
            when 5 => seg := "0010010";
            when 6 => seg := "0000010";
            when 7 => seg := "1111000";
            when 8 => seg := "0000000";
            when 9 => seg := "0011000";
        end case DigitEncoder;

        return DECPT & seg;

    end function segment_driver;

end package body ltc_mtc_pkg;
