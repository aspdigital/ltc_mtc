-------------------------------------------------------------------------------
-- Title      : Serialize and transmit a provided timecode
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ltc_encoder.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-07
-- Last update: 2025-04-27
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Given a time reference tick and a time code packet, serialize that packet into the standard
-- 80-bit frame.
--
-- Bits are coded with biphase mark:
-- 0 = single transition at the start of the bit period
-- 1 = two transitions in a bit period, one at the start, the other half-way through.
--
-- The frame rate is provided, and that determines the bit period. The clock input is compatible with the
-- frame rate, that is, the clock rate is evenly divisible by the frame rate.
-------------------------------------------------------------------------------
-- Refer to https://en.wikipedia.org/wiki/Linear_timecode#Longitudinal_timecode_data_format for the
-- description of the format.
--
-- On the incoming frame_tick, which is at the frame rate, the current frame_time is captured into a
-- large-ish shift register and encoding starts.
--
-- That shift register is 81 bits. At the time of loading, the LSb will hold the MSb of the previous frame,
-- so we can properly continue the coding. Biphase mark has transitions at the start of a bit and if the bit
-- is a 1, there is a second transition in the middle, so we need the previous bit to know how to toggle.
--
-- The bit times are obviously 1/80 of the frame time. The frame_rate input is used to select one of three
-- timer reload values for the bit time. If there is a change in the frame rate, the reset is asserted, so we
-- can be sure we don't have cruft.
--
-- TO DO: bring in clock periods, etc as generics rather than setting them as constants here.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-07  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ltc_mtc_pkg.all;
use work.timecode_pkg.all;

entity ltc_encoder is

    port (
        clk_timer  : in  std_logic;     -- clock at the proper timer rate for evenly-divisible tick
        rst_timer  : in  std_logic;     -- reset in that domain
        frame_rate : in  frame_rate_t;  -- frames per second, 24, 25 or 30
        frame_tick : in  std_logic;     -- synchronizing strobe at the frame rate
        frame_time : in  frame_time_t;  -- current frame time, valid on the tick
        ltc        : out std_logic);    -- current time encoded in the serial time code

end entity ltc_encoder;

architecture coder of ltc_encoder is

    -- how many bits in a frame?
    constant BITS_IN_FRAME : natural := 80;

    function CalcTicksPerBit (
        constant CLK_FREQ   : real;     -- frequency of clock that drives the logic
        constant FRAME_RATE : natural)  -- frames per second
        return natural is
        variable v_frame_time : time;
        variable v_bit_time   : time;
        variable v_clk_period : time;
        variable v_rv         : natural;
    begin  -- function CalcTicksPerBit
        v_frame_time := 1 SEC / FRAME_RATE;
        v_bit_time   := v_frame_time / BITS_IN_FRAME;
        v_clk_period := 1 SEC / CLK_FREQ;
        v_rv         := integer(v_bit_time / v_clk_period);
        return v_rv;
    end function CalcTicksPerBit;

    -- the frame rate selects one of these three reload values for the bit timer.
    -- 30 fps uses a 33 MHz clock.
    constant CLK_FREQ_30FPS : real := 33.0e6;
    constant TICKS_PER_BIT_30FPS : natural := CalcTicksPerBit (
        CLK_FREQ   => CLK_FREQ_30FPS,
        FRAME_RATE => 30);

    constant CLK_FREQ_25FPS : real := 50.0e6;
    constant TICKS_PER_BIT_25FPS : natural := CalcTicksPerBit (
        CLK_FREQ   => CLK_FREQ_25FPS,
        FRAME_RATE => 25);

    constant CLK_FREQ_24FPS : real := 37.50e6;
    constant TICKS_PER_BIT_24FPS : natural := CalcTicksPerBit (
        CLK_FREQ   => CLK_FREQ_24FPS,
        FRAME_RATE => 24);

    -- size of the bit timer is set by the fastest clock frequency.
    subtype bit_timer_t is natural range 0 to TICKS_PER_BIT_25FPS - 1;
    signal bit_timer          : bit_timer_t;
    -- strobe true at the start of a bit time
    constant START_OF_BIT_CNT : bit_timer_t := 1;
    signal start_of_bit       : std_logic;
    -- strobe true in the middle of a bit time.
    signal middle_of_bit_cnt  : bit_timer_t;
    signal middle_of_bit      : std_logic;
    -- reload value for bit bit period timer
    signal bit_timer_reload   : bit_timer_t;

    ---------------------------------------------------------------------------------------------------------
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

begin  -- architecture coder

    -- Bit duration timer.
    -- Always count.
    -- Assert a strobe at the start of the bit and another at the middle of the bit.
    BitTimer : process (clk_timer) is
    begin  -- process BitTimer
        if rising_edge(clk_timer) then
            if rst_timer = '1' then
                bit_timer         <= 0;
                start_of_bit      <= '0';
                middle_of_bit     <= '0';
                middle_of_bit_cnt <= TICKS_PER_BIT_25FPS / 2;  -- don't init to zero, bad things happen
                bit_timer_reload  <= TICKS_PER_BIT_25FPS - 1;
            else
                -- count for the middle of the bit and the reload depends on the frame rate.
                WhatFrameRate : case frame_rate is
                    when FR_30 =>
                        middle_of_bit_cnt <= TICKS_PER_BIT_30FPS / 2;
                        bit_timer_reload  <= TICKS_PER_BIT_30FPS - 1;
                    when FR_25 =>
                        middle_of_bit_cnt <= TICKS_PER_BIT_25FPS / 2;
                        bit_timer_reload  <= TICKS_PER_BIT_25FPS - 1;
                    when FR_24 =>
                        middle_of_bit_cnt <= TICKS_PER_BIT_24FPS / 2;
                        bit_timer_reload  <= TICKS_PER_BIT_24FPS - 1;
                    when others =>
                        -- because of non-support of drop frame
                        report "Invalid Frame Rate in BitTimer!" severity ERROR;
                end case WhatFrameRate;

                -- synchronize with the frame tick and count
                NewFrame : if (frame_tick = '1') or (bit_timer = 0) then
                    bit_timer <= bit_timer_reload;
                elsif bit_timer > 0 then
                    bit_timer <= bit_timer - 1;
                end if NewFrame;

                -- strobes that indicate the start and the middle of the bit time which is when we toggle and
                -- potentially toggle the output.
                start_of_bit  <= '1' when bit_timer = 1                 else '0';
                middle_of_bit <= '1' when bit_timer = middle_of_bit_cnt else '0';

            end if;
        end if;
    end process BitTimer;

    -- Load and shift.
    ShiftIt : process (clk_timer) is
    begin  -- process EncodeIt
        if rising_edge(clk_timer) then
            if rst_timer = '1' then
                prev_msb <= '0';
                sr       <= (others => '0');
            else
                Shifter : if frame_tick then
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

                elsif start_of_bit then
                    prev_msb <= sr(0);  -- same as in frame_tick
                    sr       <= '0' & sr(sr'LEFT downto sr'RIGHT + 1);
                end if Shifter;
            end if;
        end if;
    end process ShiftIt;

    -- biphase mark encode.
    -- always toggle at the start of a bit time, and if the bit to send is a 1, toggle again in the middle.
    EncodeIt : process (clk_timer) is
    begin  -- process EncodeIt
        if rising_edge(clk_timer) then
            if rst_timer = '1' then
                ltc <= '0';
            else
                ToggleNextBit : if start_of_bit or (middle_of_bit and prev_msb) then
                    ltc <= not ltc;
                end if ToggleNextBit;

            end if;
        end if;
    end process EncodeIt;

end architecture coder;

