-------------------------------------------------------------------------------------------------------------
-- Given the anodes and cathodes, show what we should see on the eight displays.
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
-------------------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity tb_timecode_display is

    port (
        CA  : in std_logic;                      -- common "A" segment
        CB  : in std_logic;
        CC  : in std_logic;
        CD  : in std_logic;
        CE  : in std_logic;
        CF  : in std_logic;
        CG  : in std_logic;
        CDP : in std_logic;
        AN  : in std_logic_vector(7 downto 0));  -- all anodes

end entity tb_timecode_display;

architecture display of tb_timecode_display is

    subtype seven_segment_digit_t is integer range -1 to 9;
    type ssd_array_t is array (natural range <>) of seven_segment_digit_t;
    signal digits : ssd_array_t(AN'range);
    subtype decimal_points_t is std_logic_vector(AN'range);
    signal dps    : decimal_points_t;

begin  -- architecture display

    MakeDigits : for dig in AN'range generate
        this_tb_digit : entity work.tb_digit
            port map (
                CA    => CA,
                CB    => CB,
                CC    => CC,
                CD    => CD,
                CE    => CE,
                CF    => CF,
                CG    => CG,
                CDP   => CDP,
                AN    => AN(dig),
                digit => digits(dig),
                dp    => dps(dig));
    end generate MakeDigits;

end architecture display;
