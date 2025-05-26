--
-- The segment assigments are:
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

library ieee;
use ieee.std_logic_1164.all;
library std;
use std.textio.all;

entity tb_digit is

    port (
        CA    : in  std_logic;
        CB    : in  std_logic;
        CC    : in  std_logic;
        CD    : in  std_logic;
        CE    : in  std_logic;
        CF    : in  std_logic;
        CG    : in  std_logic;
        CDP   : in  std_logic;
        AN    : in  std_logic;
        digit : out integer range -1 to 9;
        dp    : out std_logic);

end entity tb_digit;

architecture digit_decode of tb_digit is

    signal cathodes : std_logic_vector(6 downto 0);

begin  -- architecture digit_decode

    -- put all of the individual cathodes into a vector for easy decoding.
    cathodes <= CG & CF & CE & CD & CC & CB & CA;

    -- The anode acts as a transparent latch enable.
    -- When it goes away (to '1') the digit is held.
    DigitDecode : process (all) is
    begin  -- process DigitDecode
        latch : if an = '0' then
            dp <= CDP;

            Decode : case cathodes is
                --    GFEDCBA
                when "1000000" => digit <= 0;
                when "1111001" => digit <= 1;
                when "0100100" => digit <= 2;
                when "0110000" => digit <= 3;
                when "0011001" => digit <= 4;
                when "0010010" => digit <= 5;
                when "0000010" => digit <= 6;
                when "1111000" => digit <= 7;
                when "0000000" => digit <= 8;
                when "0011000" => digit <= 8;
                when others =>
                    digit <= -1;
                    report "These cathodes don't make a digit: " & to_string(cathodes) severity WARNING;
            end case Decode;
        end if latch;

    end process DigitDecode;

end architecture digit_decode;
