-------------------------------------------------------------------------------
-- Title      : Types and constants used by the LTC/MTC conversion design
-- Project    : LTC/MTC conversion
-------------------------------------------------------------------------------
-- File       : ltc_mtc_pkg.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-08
-- Last update: 2025-04-11
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

    -- frame count rollover LSD is set by the frame rate above.
    constant FC_ROLLOVER_LSD_30 : natural := 9;  -- rolls over at 29 for 30 fps
    constant FC_ROLLOVER_LSD_25 : natural := 4;  -- rolls over at 24 for 25 fps
    constant FC_ROLLOVER_LSD_24 : natural := 3;  -- rolls over at 23 for 24 fps

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

    -- this record includes all anodes and the common cathodes for the display.
    -- member names match schematic net names.
    type display_t is record
        AN : std_logic_vector(7 downto 0);  -- all anodes, driven one-hot
        CA : std_logic;                 -- segment A cathode
        CB : std_logic;                 -- segment B
        CC : std_logic;                 -- segment C
        CD : std_logic;                 -- segment D
        CE : std_logic;                 -- segment E
        CF : std_logic;                 -- segment F
        CG : std_logic;                 -- segment G
        DP : std_logic;                 -- segment DP
    end record display_t;

    constant DISPLAY_TYPE_RESET : display_t := (
        AN => (0 => '0', others => '1'),
        CA => '1', 
        CB => '1', 
        CC => '1', 
        CD => '1', 
        CE => '1', 
        CF => '1', 
        CG => '1', 
        DP => '1'); 
        

end package ltc_mtc_pkg;

package body ltc_mtc_pkg is

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

    ---------------------------------------------------------------------------------------------------------
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
