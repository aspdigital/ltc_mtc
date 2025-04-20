-------------------------------------------------------------------------------
-- Title      : MIDI Timecode Encoder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mtc_encoder.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-13
-- Last update: 2025-04-20
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Accept an incoming time code packet and a quarter-frame marker packet, and writes the correct
-- two-byte MIDI Quarter Frame message to the serial transmitter.
--
-- We also support sending the Full Message. The full_frame input is latched, and on the next frame tick, the
-- ten-byte Full Message is pushed to the serial transmitter.
--
-- The MIDI Time Code spec (v 4.2.1) states on page 3, "The quarter frame message F1 0X (Frame Count LS
-- nibble) must be sent on a frame boundary." This presents a bit of a conundrum. Most systems with a UART
-- have a shallow FIFO in front of the serial transmitter. This allows for queuing bytes in a burst so a
-- processor doesn't have to spin on waiting for the transmitter to be ready to accept the next byte. A
-- second consideration is that the UART may operate on a different clock domain from the data source or sink
-- and that clock domain crossing must be managed in the usual way.
--
-- In our case, the logic in this MIDI timecode encoder runs on the same clock as the generator, and this
-- clock varies with frame rate. Rather than changing baud rate timers and the like so the serial transmitter
-- can handle changing main clock frequencies, we put a shallow FIFO in front of transmitter load port.
-- 
-- Thus, we push our messages to a shallow FIFO. As our push rate (quarter frame worst case is 120 messages
-- per second for 30 fps) is much slower than the MIDI serial rate 31.25 kbps, there is no danger of
-- overrunning that FIFO. If this module is used along with something that generates MIDI note or control
-- data, the priority of that control data vs time code must be managed. That is outside of the scope of this
-- design.
--
-- The latency between the quarter-frame tick to when the start bit of the serial MIDI message should be very
-- low, a few ticks of the system clock. There is the FIFO load, then the recognition of the not-empty
-- condition, the FIFO read and load into the transmitter, and finally the start bit shift out. A latency of
-- maybe 100 ns should not be noticeable, and this does not account for latency on the receiving end to
-- capture the incoming bytes and process them!
--
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-13  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ltc_mtc_pkg.all;
use work.mtc_pkg.all;
use work.timecode_pkg.all;

entity mtc_encoder is

    port (
        -- Clock and reset
        clk_timer     : in  std_logic;                     -- clock synchronous with our logic
        rst_timer_l   : in  std_logic;                     -- reset in that domain
        -- current info
        frame_rate    : in  frame_rate_t;                  -- frame rate
        frame_tick    : in  std_logic;                     -- tick at frame rate
        frame_time    : in  frame_time_t;                  -- the current time.
        qframe_pkt    : in  qframe_pkt_t;                  -- quarter-tick frame ID and strobe
        -- should we send Full Frame message next time?
        do_full_frame : in  std_logic;                     -- do a Full Frame message on next frame tick
        -- the next MIDI message word to send.
        msg_data      : out std_logic_vector(7 downto 0);  -- MIDI message byte to serial port
        msg_valid     : out std_logic);                    -- indicate the above is valid (FIFO write enable)

end entity mtc_encoder;

architecture coder of mtc_encoder is

    -- As the full-frame flag can be asserted at any time, and we will send it only on a frame tick, we latch
    -- it until we send the full frame message.
    signal full_frame_latch : std_logic;

    -- keep track of the bytes sent in the Full Frame message.
    signal ff_byte_cnt : natural range 0 to 9;

    -- convenience for building the individual qframe messages.
    alias msg_data_msn : std_logic_vector(3 downto 0) is msg_data(7 downto 4);
    alias msg_data_lsn : std_logic_vector(3 downto 0) is msg_data(3 downto 0);

    -- state machine support.
    type sender_state_t is (
        SEND_IDLE,                      -- waiting for a tick.
        SEND_FULL,                      -- send the Full Frame messge
        SEND_QFRAME_SYSCOM,             -- for this quarter frame, send the System Common status byte
        SEND_QFRAME_NYBBLE);            -- send the next timecode nybble
    signal sender_state : sender_state_t;

    -- Full Message hours byte includes two bits that indicate the frame rate. This function does that encoding.
    function EncodeFrameRate (
        constant FR : frame_rate_t)
        return std_logic_vector is
        variable rv : std_logic_vector(1 downto 0);
    begin  -- function EncodeFrameRate

        rv := std_logic_vector(to_unsigned(frame_rate_t'pos(FR), rv'length));
        return rv;
    end function EncodeFrameRate;

begin  -- architecture coder

    Encoder : process (clk_timer) is
    begin  -- process Encoder
        if rising_edge(clk_timer) then
            if rst_timer_l = '0' then
                full_frame_latch <= '0';
                ff_byte_cnt      <= 0;
                msg_data         <= (others => '0');
                msg_valid        <= '0';
            else

                -- not really a one-shot, but set by machine as needed.
                msg_valid <= '0';

                -- capture the full frame flag. After processing below it will be cleared.
                latch_full_frame : if do_full_frame then
                    full_frame_latch <= '1';
                end if latch_full_frame;

                Sender : case sender_state is

                    when SEND_IDLE =>
                        -- look for either full frame flag or a quarter-frame tick.
                        test_full_frame : if frame_tick and full_frame_latch then
                            full_frame_latch <= '0';
                            ff_byte_cnt      <= 0;
                            sender_state     <= SEND_FULL;
                        elsif qframe_pkt.tick then
                            sender_state <= SEND_QFRAME_SYSCOM;
                        end if test_full_frame;

                    when SEND_FULL =>
                        msg_valid <= '1';

                        FullFrameByteSelect : case ff_byte_cnt is
                            when 0 =>
                                msg_data <= X"F0";  -- SYSEX header byte 0
                            when 1 =>
                                msg_data <= X"7F";  -- SYSEX header byte 1
                            when 2 =>
                                msg_data <= X"7F";  -- device ID, for all devices in system
                            when 3 =>
                                msg_data <= X"01";  -- sub-ID, "MIDI Time Code"
                            when 4 =>
                                msg_data <= X"01";  -- sub-ID, "Full Time Code Message"
                            when 5 =>
                                msg_data <= EncodeFrameRate(frame_rate) & BCDToSLV(frame_time.ft_hr);
                            when 6 =>
                                msg_data <= BCDToSLV(frame_time.ft_min);
                            when 7 =>
                                msg_data <= BCDToSLV(frame_time.ft_sec);
                            when 8 =>
                                msg_data <= BCDToSLV(frame_time.frame_cnt);
                            when 9 =>
                                msg_data <= X"F7";  -- EOX
                            when others =>
                                null;
                        end case FullFrameByteSelect;

                        -- keep track of the byte to send.
                        count_ff_bytes : if ff_byte_cnt < 9 then
                            ff_byte_cnt <= ff_byte_cnt + 1;
                        else
                            sender_state <= SEND_IDLE;
                        end if count_ff_bytes;

                    when SEND_QFRAME_SYSCOM =>
                        -- all qframe messages have the system common status byte first.
                        msg_valid    <= '1';
                        msg_data     <= X"F1";
                        sender_state <= SEND_QFRAME_NYBBLE;

                    when SEND_QFRAME_NYBBLE =>
                        msg_valid <= '1';

                        -- the MSN is always the message ID (qframe ID). Only 8 message types are defined so
                        -- the conversion from integer packs the MSb with the expected 0.
                        msg_data_msn <= std_logic_vector(to_unsigned(qframe_pkt.id, msg_data_msn'length));

                        -- the LSN is a nybble. Since we store the timecode as BCD, we must convert the
                        -- various pieces from two digit BCD to an unsigned byte.
                        QFrameSelect : case qframe_pkt.id is
                            when 0      => msg_data_lsn <= BCDToSLV(frame_time.frame_cnt)(3 downto 0);
                            when 1      => msg_data_lsn <= "000" & BCDToSLV(frame_time.frame_cnt)(4 downto 4);
                            when 2      => msg_data_lsn <= BCDToSLV(frame_time.ft_sec)(3 downto 0);
                            when 3      => msg_data_lsn <= "00" & BCDToSLV(frame_time.ft_sec)(5 downto 4);
                            when 4      => msg_data_lsn <= BCDToSLV(frame_time.ft_min)(3 downto 0);
                            when 5      => msg_data_lsn <= "00" & BCDToSLV(frame_time.ft_min)(5 downto 4);
                            when 6      => msg_data_lsn <= BCDToSLV(frame_time.ft_hr)(3 downto 0);
                            when 7      => msg_data_lsn <= "0" & EncodeFrameRate(frame_rate) & BCDToSLV(frame_time.ft_hr)(4 downto 4);
                            when others => null;
                        end case QFrameSelect;

                        sender_state <= SEND_IDLE;

                end case Sender;

            end if;
        end if;
    end process Encoder;

end architecture coder;
