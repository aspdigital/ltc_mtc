-------------------------------------------------------------------------------
-- Title      : Support for driving seven-segment displays.
-- Project    : 
-------------------------------------------------------------------------------
-- File       : seven_segment_display_pkg.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-20
-- Last update: 2025-04-20
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-20  -        andy	Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package seven_segment_display_pkg is

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

end package seven_segment_display_pkg;

package body seven_segment_display_pkg is

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
   
end package body seven_segment_display_pkg;

