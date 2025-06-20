-------------------------------------------------------------------------------
-- Title      : Generate and encode time into analog LTC
-- Project    : 
-------------------------------------------------------------------------------
-- File       : tb_ltc_encoder.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-06-17
-- Last update: 2025-06-18
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-06-17  -        andy	Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ltc_mtc_pkg.all;
use work.timecode_pkg.all;

entity tb_ltc_encoder is
    generic (
        AMPLITUDE : real := 1.0);
    port (
        frame_rate : in  frame_rate_t;
        ltc_analog : out real);

end entity tb_ltc_encoder;

architecture model of tb_ltc_encoder is

    ---------------------------------------------------------------------------------------------------------
    -- For frame timing.
    -- how many bits in a frame?
    constant BITS_IN_FRAME : natural := 80;

    -- duration of a bit and half a bit. Need a non-trivial value to prevent simulation from dying.
    signal bit_time : time := 416.6667 us;
    signal half_bit_time : time := 213.3333 us;

    -- a virtual clock that runs at the bit time.
    signal bit_clk : std_logic := '1';

    -- a vritual frame clock.
    signal frame_clk : std_logic := '1';

    -- timecode from the generator.
    signal frame_time : frame_time_t;

    -- a start-up reset.
    signal rst : std_logic := '1';

    -- outoing shift register, with convenient aliases to simplify loading:
    signal prev_msb     : std_logic;            -- last bit of previous frame goes out first!
    signal sr           : std_logic_vector(79 downto 0);
    alias frame_units   : std_logic_vector(3 downto 0) is sr(3 downto 0);
    alias user_bits1    : std_logic_vector(3 downto 0) is sr(7 downto 4);
    alias frame_tens    : std_logic_vector(1 downto 0) is sr(9 downto 8);
    alias drop_frame    : std_logic is sr(10);
    alias color_frame   : std_logic is sr(11);
    alias user_bits2    : std_logic_vector(3 downto 0) is sr(15 downto 12);
    alias seconds_units : std_logic_vector(3 downto 0) is sr(19 downto 16);
    alias user_bits3    : std_logic_vector(3 downto 0) is sr(23 downto 20);
    alias seconds_tens  : std_logic_vector(2 downto 0) is sr(26 downto 24);
    alias flag1         : std_logic is sr(27);  -- BGF0 at 25 fps, even parity at others
    alias user_bits4    : std_logic_vector(3 downto 0) is sr(31 downto 28);
    alias minutes_units : std_logic_vector(3 downto 0) is sr(35 downto 32);
    alias user_bits5    : std_logic_vector(3 downto 0) is sr(39 downto 36);
    alias minutes_tens  : std_logic_vector(2 downto 0) is sr(42 downto 40);
    alias flag2         : std_logic is sr(43);  -- BGF2 at 25 fps, BGF0 at others
    alias user_bits6    : std_logic_vector(3 downto 0) is sr(47 downto 44);
    alias hours_units   : std_logic_vector(3 downto 0) is sr(51 downto 48);
    alias user_bits7    : std_logic_vector(3 downto 0) is sr(55 downto 52);
    alias hours_tens    : std_logic_vector(1 downto 0) is sr(57 downto 56);
    alias bgf1          : std_logic is sr(58);  -- 1 if synched to external clock
    alias flag3         : std_logic is sr(59);  -- even parity at 25 fps, BGF2 at others
    alias user_bits8    : std_logic_vector(3 downto 0) is sr(63 downto 60);
    alias sync_word     : std_logic_vector(15 downto 0) is sr(79 downto 64);

    -- the fixed-pattern sync word sent at the end of every frame:
    constant SYNC_WORD_PATTERN : std_logic_vector(15 downto 0) := X"BFFC";

    -- biphase-mark encoded LTC, still digital.
    signal ltc_digital : std_logic := '0';

    ---------------------------------------------------------------------------------------------------------
    -- Calculate bit time based on provided frame rate.
    ---------------------------------------------------------------------------------------------------------
    function calc_bit_time (
        constant FR : frame_rate_t)
        return time is
        variable ft : time;
        variable rv : time;
    begin  -- function calc_bit_time
        with FR select
            ft :=
            1 SEC / 24    when FR_24,
            1 SEC / 25    when FR_25,
            1 SEC / 30    when FR_30,
            1 SEC / 29.97 when FR_30DF;
        rv := ft / BITS_IN_FRAME;
        return rv;
    end function calc_bit_time;
    
begin  -- architecture model

    ---------------------------------------------------------------------------------------------------------
    -- bit time and half bit time, given frame rate.
    ---------------------------------------------------------------------------------------------------------
    bit_time <= calc_bit_time(frame_rate);
    half_bit_time <= bit_time / 2;

    -- generate the bit clock.
    bit_clk <= not bit_clk after half_bit_time;

    -- simple start-of-time reset.
    rst <= '1', '0' after 666 NS;

    ---------------------------------------------------------------------------------------------------------
    -- Generate time. Since the timer clock runs at the frame clock rate, we tie the tick true always so each
    -- frame clock advances the count.
    ---------------------------------------------------------------------------------------------------------
    ltc_enc_timecode_generator : entity work.timecode_generator
        port map (
            clk_timer  => frame_clk,
            rst_timer  => rst,
            frame_rate => frame_rate,
            frame_tick => '1',
            frame_time => frame_time);

    ---------------------------------------------------------------------------------------------------------
    -- generate a frame clock every 80 bits.
    -- frame_clk updates time above and the shifter just makes sure the correct bit goes out.
    ---------------------------------------------------------------------------------------------------------
    make_frame_clk: process (bit_clk) is
        variable v_bc : natural range 0 to BITS_IN_FRAME - 1 := 0;
    begin  -- process make_frame_clk
        if rising_edge(bit_clk) then
            if v_bc = BITS_IN_FRAME - 1 then
                frame_clk <= '1';
            else
                frame_clk <= '0';
            end if;
            
            v_bc := (v_bc + 1) mod BITS_IN_FRAME;
        end if;
    end process make_frame_clk;

    ---------------------------------------------------------------------------------------------------------
    -- The shifter.
    ---------------------------------------------------------------------------------------------------------
    the_shifter: process (bit_clk) is
    begin  -- process the_shifter
        if rising_edge(bit_clk) then 
            if rst = '1' then        
                prev_msb <= '0';
                sr <= (others => '0');
            else
                Shifter : if frame_clk then
                    -- when we see the tick, the MSb of the previous frame will be in bit 0:
                    prev_msb      <= sr(0);
                    frame_units   <= std_logic_vector(to_unsigned(frame_time.frame_cnt.lsd, frame_units'length));
                    user_bits1    <= "0000";
                    frame_tens    <= std_logic_vector(to_unsigned(frame_time.frame_cnt.msd, frame_tens'length));
                    drop_frame    <= '0';
                    color_frame   <= '0';
                    user_bits2    <= "0000";
                    seconds_units <= std_logic_vector(to_unsigned(frame_time.ft_sec.lsd, seconds_units'length));
                    user_bits3    <= "0000";
                    seconds_tens  <= std_logic_vector(to_unsigned(frame_time.ft_sec.msd, seconds_tens'length));
                    flag1         <= '0';  -- FIX THIS, depends on frame rate
                    user_bits4    <= "0000";
                    minutes_units <= std_logic_vector(to_unsigned(frame_time.ft_min.lsd, minutes_units'length));
                    user_bits5    <= "0000";
                    minutes_tens  <= std_logic_vector(to_unsigned(frame_time.ft_min.msd, minutes_tens'length));
                    flag2         <= '0';  -- FIX THIS, depends on frame rate
                    user_bits6    <= "0000";
                    hours_units   <= std_logic_vector(to_unsigned(frame_time.ft_hr.lsd, hours_units'length));
                    user_bits7    <= "0000";
                    hours_tens    <= std_logic_vector(to_unsigned(frame_time.ft_hr.msd, hours_tens'length));
                    bgf1          <= '0';  -- until we sync to external clock
                    flag3         <= '0';  -- FIX this, depends on frame rate
                    user_bits8    <= "0000";
                    sync_word     <= SYNC_WORD_PATTERN;

                else
                    prev_msb <= sr(0);  -- same as in frame_tick
                    sr       <= '0' & sr(sr'LEFT downto sr'RIGHT + 1);
                end if Shifter;

            end if;
        end if;
    end process the_shifter;

    ---------------------------------------------------------------------------------------------------------
    -- Biphase-mark encoder.
    -- Always toggle at the start of a bit time, and if the bit to send is a 1, toggle again in the middle.
    ---------------------------------------------------------------------------------------------------------
    the_encoder: process is
    begin  -- process the_encoder
        wait until rising_edge(bit_clk);
        -- invert at start of bit time.
        ltc_digital <= not ltc_digital;
        -- if sending a 1, wait for middle of bit and toggle again.
        sending_a_one: if prev_msb then
            wait for half_bit_time;
            ltc_digital <= not ltc_digital;
        end if sending_a_one;
    end process the_encoder;

    ---------------------------------------------------------------------------------------------------------
    -- Very cheezy, convert digital LTC to an analog signal. Makes no attempt to control rise and fall times
    -- or any kind of filtering.
    ---------------------------------------------------------------------------------------------------------
    ltc_analog <= AMPLITUDE when ltc_digital else -AMPLITUDE;
    
end architecture model;
