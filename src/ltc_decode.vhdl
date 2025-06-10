-------------------------------------------------------------------------------
-- Title      : Linear Time Code Decoder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ltc_decode.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-20
-- Last update: 2025-06-02
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

entity ltc_decode is
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
end entity ltc_decode;

architecture decoder of ltc_decode is

    ---------------------------------------------------------------------------------------------------------
    -- incoming samples. We'll use left only for our decoder source.
    ---------------------------------------------------------------------------------------------------------
    signal data_valid  : std_logic;
    signal data_left   : signed(23 downto 0);
    signal data_left_d : signed(23 downto 0);  -- delay for transition detect, do we need the whole sample?

    alias this_sign : std_logic is data_left(23);
    alias prev_sign : std_logic is data_left_d(23);

    -- flag set when there is a transition between the current and previous sample.
    signal got_transition : std_logic;

    ---------------------------------------------------------------------------------------------------------
    -- Our bit-width timer counts samples (at 100 kHz sample rate), for convenience and for a smaller
    -- counter. The counter is longer than strictly necessary for the 24 fps rate, to allow for some
    -- deviation. 
    ---------------------------------------------------------------------------------------------------------
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

    constant SAMPLES_PER_30FPS : natural := CalcTicksPerBit(CLK_FREQ => 100.0e3, FRAME_RATE => 30);
    constant SAMPLES_PER_25FPS : natural := CalcTicksPerBit(CLK_FREQ => 100.0e3, FRAME_RATE => 25);
    constant SAMPLES_PER_24FPS : natural := CalcTicksPerBit(CLK_FREQ => 100.0e3, FRAME_RATE => 240);

    constant WIGGLE       : natural := 10;
    constant BITWIDTH_MAX : natural := SAMPLES_PER_24FPS + WIGGLE;
    subtype bitwidth_timer_t is natural range 0 to BITWIDTH_MAX;
    signal bitwidth_timer : bitwidth_timer_t;

    -- capture bit width times in these registers.
    signal bitwidth_base : bitwidth_timer_t;  -- initial measurement, between the first two transitions
    signal bitwidth_next : bitwidth_timer_t;  -- next measurement, between transition 2 and 3
    signal bitwidth      : bitwidth_timer_t;  -- the measured bit width (for a 0)

    ---------------------------------------------------------------------------------------------------------
    -- bits are decoded into this shift register.
    ---------------------------------------------------------------------------------------------------------
    signal sr : std_logic_vector(79 downto 0);

begin  -- architecture decoder

    ---------------------------------------------------------------------------------------------------------
    -- I2S receiver, which gives us samples.
    -- We keep 24 bits because we do not know the amplitude of the signal we'll be given, so we want the
    -- widest range possible.
    ---------------------------------------------------------------------------------------------------------
    data_receiver : entity work.i2s_rx
        port map (
            clk_audio   => clk_audio,
            rst_audio   => rst_audio,
            sclk_audio  => sclk_audio,
            lrclk_audio => lrclk_audio,
            data_audio  => data_audio,
            data_valid  => data_valid,
            data_left   => data_left,
            data_right  => open);

    ---------------------------------------------------------------------------------------------------------
    -- Look for a transition between the current sample and the previous sample. A transition is when the
    -- polarity of the current and previous samples differs.
    ---------------------------------------------------------------------------------------------------------
    look_for_transition : process (clk_audio) is
    begin  -- process look_for_transition
        if rising_edge(clk_audio) then
            if rst_audio = '1' then
                data_left_d    <= (others => '0');
                got_transition <= '0';
            else
                got_new_sample : if data_valid then
                    data_left_d    <= data_left;
                    got_transition <= this_sign xor prev_sign;
                end if got_new_sample;
            end if;
        end if;
    end process look_for_transition;

    ---------------------------------------------------------------------------------------------------------
    -- Determine the width of a bit.
    ---------------------------------------------------------------------------------------------------------
    find_bit_width: process (clk_audio) is
    begin  -- process find_bit_width
        if rising_edge(clk_audio) then
            if rst_audio = '1' then
                bitwidth_timer <= 0;
                bitwidth_base <= 0;
                bitwidth   <= 0;
                got_bitwidth <= '0';
                bw_state <= BW_START;
            else

                -- the timer, reset by machine.
                the_timer: if bitwidth_timer < BITWIDTH_MAX then
                    bitwidth_timer <= bitwidth_timer + 1;
                end if the_timer;

                -- machine to determine the width of a bit.
                Decoder: case bw_state is
                    when BW_START =>
                        -- synchronize by waiting for a transition.
                        start_of_bit: if got_transition then
                            bitwidth_timer <= 0;
                            bw_state <= BW_FIRST_TRANSITION;
                        end if start_of_bit;
                        
                    when BW_FIRST_TRANSITION =>
                        initial_width_capture: if got_transition then
                            bitwidth_base <= bitwidth_timer;
                            bitwidth_timer <= 0;
                            bw_state <= BW_SECOND_TRANSITION;
                        end if initial_width_capture;

                    when BW_SECOND_TRANSITION =>
                        next_edge: if got_transition then
                            bw_state <= BW_WIDTH_KNOWN;
                            compare_times: if bitwidth_timer > bitwidth_base then
                                -- current time is longer, so this must be the true bit width.
                                bitwidth <= bitwidth_timer;
                            elsif bitwidth_timer < bitwidth_base then
                                -- current time is shorter, so it's the half-bit time.
                                bitwidth <= bitwidth_base;
                            else
                                bw_state <= BW_SECOND_TRANSITION;
                            end if compare_times;
                        end if next_edge;

                    when BW_WIDTH_KNOWN =>
                        -- now that we know the bit width, the shifting can commence. We need to keep
                        -- monitoring transitions to see if the bit width, hence the frame time, has changed.
                        got_bitwidth <= '1';

                        
                        
                end case Decoder;
                
            end if;
        end if;
    end process find_bit_width;


end architecture decoder;



