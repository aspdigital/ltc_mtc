library ieee;
use ieee.std_logic_1164.all;

package ltc_mtc_pkg is

    -- possible frame rates.
    type frame_rate_t is (FR_30, FR_25, FR_24);
    
    -- the frame count can range from 0 to 29
    type frame_cnt_t is record
        lsd : natural range 0 to 9;
        msd : natural range 0 to 2;
        lsd_rollover : natural range 0 to 9;  -- set based on frame rate
    end record frame_cnt_t;

    -- seconds and minutes range from 0 to 59, so we have a type for that.
    type time_0_to_59_t is record
        lsd : natural range 0 to 9;
        msd : natural range 0 to 5;
    end record time_0_to_59_t;

    -- hours range from 0 to 23.
    type time_0_to_23_t is record
        lsd : natural range 0 to 9;
        msd : natural range 0 to 2;
    end record time_0_to_23_t;

    -- keep track of time with this record.
    -- we keep track of the individual digits, so we don't have to divide to work them out.
    type frame_time_t is record
        -- frame range is max 29
        frame_cnt  : frame_cnt_t;
        -- seconds range from 0 to 59
        ft_sec : time_0_to_59_t;
        -- minutes range from 0 to 59
        ft_min : time_0_to_59_t;
        -- hours range from 0 to 23
        ft_hr : time_0_to_23_t;
        -- frame rate 
        frame_rate : frame_rate_t;
    end record frame_time_t;

    -- convenience functions for comparison.
    function isLastFrame (
        constant F : frame_cnt_t;
        constant FR  : frame_rate_t)
        return boolean;

    function isLast_0_to_59 (
        constant T : time_0_to_59_t)
        return boolean;

    function isLast_0_to_23 (
        constant T : time_0_to_23_t)
        return boolean;

    -- a digit, after encoding into the display. This includes the decimal point in the MSb.
    subtype digit_t is std_logic_vector(7 downto 0);

    -- all of the digits on the board.
    constant NUM_DIGITS : natural := 8;
    type digit_array_t is array (NUM_DIGITS - 1 downto 0) of digit_t;

    -- digit assignments:
    constant DIGIT_HR_MSD : natural := 7;
    constant DIGIT_HR_LSD : natural := 6;
    constant DIGIT_MIN_MSD : natural := 5;
    constant DIGIT_MIN_LSD : natural := 4;
    constant DIGIT_SEC_MSD : natural := 3;
    constant DIGIT_SEC_LSD : natural := 2;
    constant DIGIT_FRAME_MSD : natural := 1;
    constant DIGIT_FRAME_LSD : natural := 0;

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
    constant DECPT_ON : std_logic := '0';  -- active low on
    constant DECPT_OFF : std_logic := '1';
    
    function segment_driver (
        constant DIGIT : natural range 0 to 9;  -- digit to display
        constant DECPT : std_logic)             -- set to light up decimal
        return digit_t;

end package ltc_mtc_pkg;

package body ltc_mtc_pkg is

    -- convenience functions.

    --
    -- Return true if the given frame count is the last (29)
    function isLastFrame (
        constant F  : frame_cnt_t;
        constant FR : frame_rate_t)
        return boolean is
        variable lsd : natural range 0 to 9;
    begin  -- function isLastFrame

        GetEndLsd: case FR is
            when FR_30 => lsd := 9;
            when FR_25 => lsd := 4;
            when FR_24 => lsd := 3;
        end case GetEndLsd;
        
        if F.msd = 2 and F.lsd = lsd then
            return TRUE;
        end if;
        return FALSE;
    end function isLastFrame;

    -- return true if the seconds count is 59 so it'll roll over to zero.
    function isLast_0_to_59 (
        constant T : time_0_to_59_t)
        return boolean is
    begin  -- function isLast_0_to_59
        if T.msd = 5 and T.lsd = 9 then
            return TRUE;
        end if;
        return FALSE;
    end function isLast_0_to_59;
   
    -- return true if the hour count is 23 so it'll roll over to zero.
    function isLast_0_to_23 (
        constant T : time_0_to_23_t)
        return boolean is
    begin  -- function isLast_0_to_23
        if T.msd = 2 and T.lsd = 3 then
            return TRUE;
        end if;
        return FALSE;
    end function isLast_0_to_23;
    
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
        constant DIGIT : natural range 0 to 9;  -- digit to display
        constant DECPT : std_logic)             -- set to light up decimal
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
