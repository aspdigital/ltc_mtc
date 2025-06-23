-------------------------------------------------------------------------------
-- Title      : Linear Time Code Decoder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ltc_decoder.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-20
-- Last update: 2025-06-22
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Decode the incoming time code.
-- 
-- The time code comes in using a channel of the PMOD I2S2 ADC.
--
-- Assume AC coupling, so we'll look for zero crossings as our bit transitions.
--
-- Recall coding:
--    0 has a transition only at the start of a bit.
--    1 has a transition at the start and at the center of a bit.
--
-- A transition is the current sample of opposite polarity from the previous.
--
-- Recall 16-bit sync pattern at the end of each 80-bit frame:
--  0011_1111_1111_1101
--
-- Our decoder works as follows.
-- 
-- 1. Estimate bit width.
--    a. Look for a transition. Clear the bit-width counter.
--    b. Look for the next transition. Capture the bit-width counter and clear it. 
--    c. Look for a third transition. Capture the bit-width counter and clear it.
--       Transition 3 can be either the same width as the previous, or longer, or shorter.
--       If shorter than the time for transition 2, the transition 2's time is the bit time.
--       If longer than the time for transition 2, this transition's (3's) time is the bit time.
--       If the same, capture a fourth transition and try again.
-- 2. Once we know the bit time, we know the frame rate (use a lookup table to get it).
-- 3. Find a zero bit as first-order synchronization.
--    a. Wait for a transition. Clear the timer.
--    b. Wait for a second transition. Capture the timer and clear it.
--    c. If the time between the two indicates a 1 (half bit time), we still don't know the bit boundary.
--       Repeat b.
--       If the time between the two indicates a 0 (full bit time), we know our bit boundary.
-- 4. Now that we know the bit boundary, we can start decoding and shifting.
-- 5. From our starting point, start a timer and look for a transition.
--    a. If the next transition is at the half bit position, shift in a 1 and wait for the next transition
--       which must be at the bit boundary.
--    b. If the next transition is at the full bit position, shift in a 0. No need to wait for the next
--       transition as we are at the boundary.
--    c. Repeat a. forever.
-- 6. As we are shifting bits in, look for the sync word in bit locations 64 through 79. When we see that,
--    latch the timecode from the other bits in the shift register. Assert got-new frame time. The first time
--    we output a frame time, assert the locked flag.
--
-- What about a change in the frame rate? This can happen at any time.
-- Once we've established the frame rate (see 2 above), continue monitoring the bit time using the bit width
-- estimator logic from above. Transitions should be at either the previously-determined half-bit-time count
-- or full-bit-time count. If they are not, then the frame rate has changed and we need to re-sync.
--
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-20  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ltc_mtc_pkg.all;
use work.timecode_pkg.all;

library asp_utils;
use asp_utils.vector_array_types_pkg.all;

entity ltc_decoder is
    port (
        clk_audio           : in  std_logic;  -- modulator clock
        rst_audio           : in  std_logic;  -- reset in that domain
        sclk_audio          : in  std_logic;  -- shift register clock
        lrclk_audio         : in  std_logic;  -- L/R clock
        data_audio          : in  std_logic;  -- serial ADC data
        ltcd_frame_rate     : out frame_rate_t;
        ltcd_frame_time     : out frame_time_t;
        ltcd_new_frame_time : out std_logic;
        ltcd_locked         : out std_logic);
end entity ltc_decoder;

architecture decoder of ltc_decoder is

    ---------------------------------------------------------------------------------------------------------
    -- incoming samples. We'll use left only for our decoder source.
    ---------------------------------------------------------------------------------------------------------
    signal data_valid  : std_logic;
    signal data_left   : slv_array_t(0 to 0)(23 downto 0);
    signal data_right   : slv_array_t(0 to 0)(23 downto 0);
    signal data_left_d : std_logic_vector(23 downto 0);  -- delay for transition detect, do we need the whole sample?

    alias this_sign : std_logic is data_left(0)(23);
    alias prev_sign : std_logic is data_left_d(23);

    -- flag set when we know the width (in clocks) of each bit.
    signal got_bitwidth : std_logic;

    -- flag set when there is a transition between the current and previous sample. Since got_transition is
    -- true for an entire sample time, we need only its leading edge to advance the determine-bitwidth machine.
    signal got_transition   : std_logic;
    signal got_transition_d : std_logic;

    ---------------------------------------------------------------------------------------------------------
    -- Our bit-width timer counts samples (at 100 kHz sample rate), for convenience and for a smaller
    -- counter. The counter is longer than strictly necessary for the 24 fps rate, to allow for some
    -- deviation. 
    ---------------------------------------------------------------------------------------------------------
    -- how many bits in a frame?
    constant BITS_IN_FRAME : natural := 80;

    function CalcTicksPerBit (
        constant CLK_FREQ   : real;     -- frequency of clock that drives the logic
        constant FRAME_RATE : natural)  -- 
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

    -- how many samples are in a full bit width for a given frame rate. The clock frequency here is the sample
    -- rate.
    constant BITWIDTH_30FPS : natural := CalcTicksPerBit(CLK_FREQ => 100.0e3, FRAME_RATE => 30) - 1;
    constant HALFBIT_30FPS  : natural := BITWIDTH_30FPS / 2;
    constant BITWIDTH_25FPS : natural := CalcTicksPerBit(CLK_FREQ => 100.0e3, FRAME_RATE => 25) - 1;
    constant HALFBIT_25FPS  : natural := BITWIDTH_25FPS / 2;
    constant BITWIDTH_24FPS : natural := CalcTicksPerBit(CLK_FREQ => 100.0e3, FRAME_RATE => 24) - 1;
    constant HALFBIT_24FPS  : natural := BITWIDTH_24FPS / 2;

    constant WIGGLE       : natural := 10;
    constant BITWIDTH_MAX : natural := BITWIDTH_24FPS + WIGGLE;
    subtype bitwidth_timer_t is natural range 0 to BITWIDTH_MAX;
    signal bitwidth_timer : bitwidth_timer_t;

    -- capture bit width times in these registers.
    signal bitwidth_base : bitwidth_timer_t;  -- initial measurement, between the first two transitions
    signal bitwidth      : bitwidth_timer_t;  -- the measured bit width (for a 0)
    signal bitwidthdiv2  : bitwidth_timer_t;  -- half a bit period
    signal bitwidth3p4   : bitwidth_timer_t;  -- 3/4 a bit time (longer is 0, shorter is 1)

    ---------------------------------------------------------------------------------------------------------
    -- State machines.
    ---------------------------------------------------------------------------------------------------------
    type bw_state_t is (BW_START, BW_FIRST_TRANSITION, BW_COMPARE, BW_SUCCESS);
    signal bw_state : bw_state_t;

    type ds_state_t is (DS_BEGIN, DS_START, DS_FIND_SECOND_TRANSITION, DS_DECODE_START, DS_WAIT_END_OF_ONE);
    signal ds_state : ds_state_t;

    signal bittime      : bitwidth_timer_t;
    ---------------------------------------------------------------------------------------------------------
    -- bits are decoded into this shift register.
    ---------------------------------------------------------------------------------------------------------
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

begin  -- architecture decoder

    ---------------------------------------------------------------------------------------------------------
    -- I2S receiver, which gives us samples.
    -- We keep 24 bits because we do not know the amplitude of the signal we'll be given, so we want the
    -- widest range possible.
    ---------------------------------------------------------------------------------------------------------
    data_receiver : entity work.i2s_rx
        generic map (
            NUM_PAIRS => 1,
            SWIDTH    => 24)
        port map (
            mclk     => clk_audio,
            bclk     => sclk_audio,
            lrclk    => lrclk_audio,
            sdin(0)  => data_audio,
            sd_left  => data_left,
            sd_right => data_right,
            sd_valid => data_valid);

    ---------------------------------------------------------------------------------------------------------
    -- Look for a transition between the current sample and the previous sample. A transition is when the
    -- polarity of the current and previous samples differs.
    -- The transition lasts for an entire sample time, and we need only its edge.
    ---------------------------------------------------------------------------------------------------------
    look_for_transition : process (clk_audio) is
    begin  -- process look_for_transition
        if rising_edge(clk_audio) then
            if rst_audio = '1' then
                data_left_d      <= (others => '0');
                got_transition   <= '0';
                got_transition_d <= '0';
            else
                got_new_sample : if data_valid then
                    data_left_d      <= data_left(0);
                    got_transition   <= this_sign xor prev_sign;
                end if got_new_sample;

                -- edge is one-clock strobe.
                got_transition_d <= got_transition;
            end if;
        end if;
    end process look_for_transition;

    ---------------------------------------------------------------------------------------------------------
    -- Determine the width of a bit.
    -- 1. Wait for a transition and clear a bit timer.
    -- 2. Wait for a second transition. Now we have a duration that's either the long or the short. Since we
    --    know the durations of bits for our three frame rates, we can determine which by comparing.
    ---------------------------------------------------------------------------------------------------------
    find_bit_width : process (clk_audio) is
    begin  -- process find_bit_width
        if rising_edge(clk_audio) then
            if rst_audio = '1' then
                bitwidth_timer <= 0;
                bitwidth_base  <= 0;
                bitwidth       <= 0;
                bitwidthdiv2   <= 0;
                bitwidth3p4    <= 0;
                got_bitwidth   <= '0';
                ltcd_frame_rate <= FR_30;
                bw_state       <= BW_START;
            else

                -- the timer, reset by machine.
                the_timer : if (bitwidth_timer < BITWIDTH_MAX) and (data_valid = '1') then
                    bitwidth_timer <= bitwidth_timer + 1;
                end if the_timer;

                -- work out 3/4 the bit time.
                bitwidth3p4 <= bitwidthdiv2 + (bitwidthdiv2 / 2);

                -- machine to determine the width of a bit.
                Decoder : case bw_state is
                    when BW_START =>
                        -- start timer.
                        bitwidth_timer <= 0;
                        -- synchronize by waiting for a transition.
                        start_of_bit : if got_transition = '1' and got_transition_d = '0' then
                            bw_state <= BW_FIRST_TRANSITION;
                        end if start_of_bit;

                    when BW_FIRST_TRANSITION =>
                        -- capture the timer value on a transition so we can start the width compares.
                        initial_width_capture : if got_transition = '1' and got_transition_d = '0' then
                            bitwidth_base  <= bitwidth_timer;
                            bw_state       <= BW_COMPARE;
                        end if initial_width_capture;

                    when BW_COMPARE =>
                        -- assume success
                        bw_state <= BW_SUCCESS;
                        tree : if bitwidth_base >= HALFBIT_24FPS then
                            bitwidth        <= BITWIDTH_24FPS;
                            bitwidthdiv2    <= HALFBIT_24FPS;
                            ltcd_frame_rate <= FR_24;
                        elsif bitwidth_base >= HALFBIT_25FPS then
                            bitwidth        <= BITWIDTH_25FPS;
                            bitwidthdiv2    <= HALFBIT_25FPS;
                            ltcd_frame_rate <= FR_25;
                        elsif bitwidth_base >= HALFBIT_30FPS then
                            bitwidth        <= BITWIDTH_30FPS;
                            bitwidthdiv2    <= HALFBIT_30FPS;
                            ltcd_frame_rate <= FR_30;
                        elsif bitwidth_base >= BITWIDTH_24FPS then
                            bitwidth        <= BITWIDTH_24FPS;
                            bitwidthdiv2    <= HALFBIT_24FPS;
                            ltcd_frame_rate <= FR_24;
                        elsif bitwidth_base >= BITWIDTH_25FPS then
                            bitwidth        <= BITWIDTH_25FPS;
                            bitwidthdiv2    <= HALFBIT_25FPS;
                            ltcd_frame_rate <= FR_25;
                        elsif bitwidth_base >= BITWIDTH_30FPS then
                            bitwidth        <= BITWIDTH_30FPS;
                            bitwidthdiv2    <= HALFBIT_30FPS;
                            ltcd_frame_rate <= FR_30;
                        else
                            -- no transitions fast enough
                            bw_state <= BW_START;
                        end if tree;

                  when BW_SUCCESS =>
                        got_bitwidth <= '1';
                        
              end case Decoder;

            end if;
        end if;
    end process find_bit_width;

    ---------------------------------------------------------------------------------------------------------
    -- Decode and shift bits in.
    -- 
    -- After we find the width of a bit, synchronize by finding a '0' bit: Look for a transition, mark when
    -- it occurred, then look for the next transition. If the next transition is more than half a bit time
    -- from the first, we know where bits starts. If the next transition is half a bit time away, reset and
    -- try again.
    --
    -- Now we have our bit boundary. Restart the bit width timer. Look for the next transition. If it
    -- occurred before the end of the bit time, it must've been in the middle of the bit time, so that's a
    -- '1'. Shift it in. Continue waiting until the end of the bit time to start on the next boundary. If
    -- that transition happened at the end of the bit time, the previous bit was a '0'. Shift it in.
    --
    -- Once we know the start of a bit, we need to know whether the next transition is a '1' or a '0'. Set
    -- the timer to the 3/4 bit count. If the count is zero on the next transition, there was no mid-bit
    -- transition so our bit is a '0'. Otherwise, it's a '1'.
    --
    -- At every bit boundary, check the sync word positions. If we see the sync word, we can latch the time
    -- code. 
    ---------------------------------------------------------------------------------------------------------
    decode_and_shift : process (clk_audio) is
    begin  -- process decode_and_shift
        if rising_edge(clk_audio) then
            if rst_audio = '1' then
                bittime  <= 0;
                ds_state <= DS_BEGIN;
                sr       <= (others => '0');
            else

                -- the bit timer.
                bit_timer : if (bittime > 0) and (data_valid = '1') then
                    bittime <= bittime - 1;
                end if bit_timer;

                ds_decoder : case ds_state is
                    when DS_BEGIN =>
                        -- wait for signal from bitwidth detector before starting to look for bit edges.
                        wait_for_bit_sizes: if got_bitwidth then
                            ds_state <= DS_START;
                        end if wait_for_bit_sizes;
                        
                    when DS_START =>
                        -- look for the first transition, which will be the possible start of a bit
                        find_first_edge : if got_transition and not got_transition_d then
                            bittime  <= bitwidth3p4;
                            ds_state <= DS_FIND_SECOND_TRANSITION;
                        end if find_first_edge;

                    when DS_FIND_SECOND_TRANSITION =>
                        -- look for the second transition. If the bit timer went to zero, we've found the
                        -- long 0 width. If it didn't, we know the middle of the bit, so resync and start again.
                        find_second_edge : if got_transition and not got_transition_d then
                            -- restart timer.
                            bittime <= bitwidth3p4;
                            -- test
                            is_full_width : if bittime = 0 then
                                ds_state <= DS_DECODE_START;
                            end if is_full_width;
                        end if find_second_edge;

                    when DS_DECODE_START =>
                        -- we are at the start of a bit. Again we look for a transition, note whether it was
                        -- at half or a full bit time.
                        got_another_transition : if got_transition and not got_transition_d then

                            -- most of the shift, we'll do the incoming below.
                            sr(sr'LEFT - 1 downto sr'right) <= sr(sr'LEFT downto sr'RIGHT + 1);

                            is_also_full_width : if bittime = 0 then
                                -- this transition was at the start of the bit. preload the timer to look for
                                -- the next '0'.
                                bittime     <= bitwidth3p4;
                                sr(sr'left) <= '0';
                            else
                                -- we're in the middle of the bit time. Wait for the next transition (which
                                -- is at the start of the next bit) and then shift in the 1.
                                ds_state <= DS_WAIT_END_OF_ONE;
                            end if is_also_full_width;
                        end if got_another_transition;

                    when DS_WAIT_END_OF_ONE =>
                        got_end_of_one : if got_transition and not got_transition_d then
                            -- we're at the start of a new bit. Save our '1' and then set up the bit timer to
                            -- tell us whether the _next_ transition was at the half-way or full bit.
                            sr(sr'LEFT) <= '1';
                            bittime <= bitwidth3p4;
                            ds_state <= DS_DECODE_START;
                        end if got_end_of_one;

                end case ds_decoder;

            end if;
        end if;
    end process decode_and_shift;

    ---------------------------------------------------------------------------------------------------------
    -- When we have the sync bits, we have the entire timecode frame.
    ---------------------------------------------------------------------------------------------------------
    latch_time_packet : process (clk_audio) is
    begin  -- process latch_time_packet
        if rising_edge(clk_audio) then
            if rst_audio = '1' then
                ltcd_frame_time     <= FRAME_TIME_RESET;
                ltcd_new_frame_time <= '0';
            else

                ltcd_new_frame_time <= '0';

                compare : if sync_word = SYNC_WORD_PATTERN then
                    ltcd_new_frame_time <= '1';

                    ltcd_frame_time <= (
                        frame_cnt => (
                            lsd   => to_integer(unsigned(frame_units)),
                            msd   => to_integer(unsigned(frame_tens)),
                            carry => '0'),
                        ft_sec    => (
                            lsd   => to_integer(unsigned(seconds_units)),
                            msd   => to_integer(unsigned(seconds_tens)),
                            carry => '0'),
                        ft_min    => (
                            lsd   => to_integer(unsigned(minutes_units)),
                            msd   => to_integer(unsigned(minutes_tens)),
                            carry => '0'),
                        ft_hr     => (
                            lsd   => to_integer(unsigned(hours_units)),
                            msd   => to_integer(unsigned(hours_tens)),
                            carry => '0'));
                end if compare;
            end if;
        end if;
    end process latch_time_packet;

end architecture decoder;

