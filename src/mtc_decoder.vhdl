-------------------------------------------------------------------------------
-- Title      : MIDI Time Code Decoder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mtc_decoder.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-14
-- Last update: 2025-05-28
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: This entity implements a MIDI Time Code Receiver/Decoder.
--
-- We capture incoming time code message bytes and keep track of them. When the entire time code is received,
-- it is made available to the display. Part of the received time code is the frame rate, which will be
-- provided to outside logic. All of this runs on the "main" clock; it is up to the destination to
-- synchronize to the correct frame-rate clock.
--
-- The output frame rate is accompanied by a valid strobe indicating that is is new.
--
-- TO DO: handle Full Frame Message.
--
-------------------------------------------------------------------------------
-- Theory of Operation.
--
-- MIDI time code is sent every quarter frame. The interval is set by the frame rate. The time code is sent
-- one nybble at a time, in the following order:
-- 0: frame number LSN
-- 1: frame number MSN
-- 2: seconds LSN
-- 3: seconds MSN
-- 4: minutes LSN
-- 5: minutes MSN
-- 6: hours LSN
-- 7: hours MSN plus frame rate.
--
-- Note that unlike SMPTE time code, the data are straight binary, not BCD.
--
-- Because it takes two full frames to receive the entire time code, the received code will always be two
-- full frames behind the actual time.
--
-- As messages are received, the pieces of the time code are captured into the input buffer.
-- 
-- The arrival of quarter frame messages 0 and 4 indicate where a SMPTE frame occurs.
-- When we see qf message 0, we copy the entire input buffer to the output buffer. As noted, this will have a
-- delay of two frames from actual frame time. When we see qf message 4, we increment the output frame count
-- by one, and if this causes a carry, we update the other parts of the packet as needed.
-- 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-14  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ltc_mtc_pkg.all;
use work.timecode_pkg.all;
use work.mtc_pkg.all;

entity mtc_decoder is
    generic (
        CLK_PER   : time;               -- period of clk_main
        BAUD_RATE : natural := 31250);  -- MIDI baud rate
    port (
        -- MIDI in.
        midi_rx        : in  std_logic;
        -- MIDI receiver is on global clock.
        -- So is the frame rate.
        clk_main       : in  std_logic;
        rst_main       : in  std_logic;
        -- frame time updates
        frame_time     : out mtc_pkt_t;
        new_frame_time : out std_logic);
end entity mtc_decoder;

architecture decoder of mtc_decoder is

    attribute MARK_DEBUG : string;
    
    -- uarx provides a receive byte and a valid strobe.
    signal rx_valid : std_logic;
    signal rx_data  : std_logic_vector(7 downto 0);
    attribute MARK_DEBUG of rx_valid : signal is "TRUE";
    attribute MARK_DEBUG of rx_data : signal is "TRUE";

    -- MS nybble of the receive data could be the quarter frame identifier. (If it is F then we should have
    -- the system common status byte).
    alias qf_id   : std_logic_vector(3 downto 0) is rx_data(7 downto 4);
    -- LS nybble is part of the time.
    alias qf_data : std_logic_vector(3 downto 0) is rx_data(3 downto 0);

    -- the Quarter Frame System Common Status Byte.
    constant QFSCS_BYTE : std_logic_vector(7 downto 0) := X"F1";

    -- indicate that we've received the Quarter Frame System Common Status byte. The byte received after that
    -- status byte is the time code data. That is, if we don't see the QFSCS byte, whatever comes in is
    -- ignored. This is a flag that should toggle every byte.
    signal got_qfscs : std_logic;
    attribute MARK_DEBUG of got_qfscs : signal is "TRUE";

    -- indicate that the 0th and 4th QF messages were received.
    signal got_qf_0 : std_logic;
    signal got_qf_4 : std_logic;
    attribute MARK_DEBUG of got_qf_0 : signal is "TRUE";
    attribute MARK_DEBUG of got_qf_4 : signal is "TRUE";

    -- As qf messages are received, collect them into this record.
    signal ft_rx_in : mtc_pkt_t;
    attribute MARK_DEBUG of ft_rx_in : signal is "TRUE";
    -- This is completely copied to the output on quarter frame 0, and the frame count in this is incremented
    -- on quarter frame 4. If that increment rolls over, all of the other parts of the packet are incremented
    -- as necessary.
    signal ft_rx_out : mtc_pkt_t;
    attribute MARK_DEBUG of ft_rx_out : signal is "TRUE";

    -- We receive nybbles, so this combines the previously-received nybble with the newest.
    function CombineNybbles (
        constant LSN : natural;        -- previously nybble (to LSN)
        constant MSN : natural)        -- new nybble (to MSN)
        return natural is
        variable rv : natural;
        variable v_lsn : std_logic_vector(3 downto 0);
        variable v_msn : std_logic_vector(3 downto 0);
    begin  -- function CombineNybbles
        v_lsn := std_logic_vector(to_unsigned(LSN, v_lsn'length));
        v_msn := std_logic_vector(to_unsigned(MSN, v_msn'length));
        rv := to_integer(unsigned(v_msn & v_lsn));
        return rv;
    end function CombineNybbles;

    -- frame rate is encoded in the hours MSN.
    function DecodeFrameRate (
        constant ARG : std_logic_vector(1 downto 0))
        return frame_rate_t is
        variable rv : frame_rate_t;
    begin
        rv := frame_rate_t'val(to_integer(unsigned(ARG)));
        return rv;
    end function DecodeFrameRate;

    -- increment the frame count, handling rollover.
    function IncrementFrameCount (
        constant ARG : mtc_pkt_t)
        return mtc_pkt_t is
        variable rv : mtc_pkt_t;
        variable last_frame : frames_t;
    begin  -- function IncrementFrameCount

        frame_rate_rollover: case ARG.frame_rate is
            when FR_24 => last_frame := 23;
            when FR_25 => last_frame := 24;
            when FR_30 => last_frame := 29;
            when others => null;
        end case frame_rate_rollover;
        
        UpdateFrame: if ARG.frames = last_frame then
            rv.frames := 0;

            UpdateSeconds: if ARG.seconds = 59 then
                rv.seconds := 0;

                UpdateMinutes: if ARG.minutes = 59 then
                    rv.minutes := 0;

                    UpdateHours: if ARG.hours = 23 then
                        rv.hours := 0;

                    else
                        rv.hours := ARG.hours + 1;
                    end if UpdateHours;

                else
                    rv.minutes := ARG.minutes + 1;
                end if UpdateMinutes;
                
            else
                rv.seconds := ARG.seconds + 1;
            end if UpdateSeconds;

        else
            rv.frames := ARG.frames + 1;
        end if UpdateFrame;

        return rv;
    end function IncrementFrameCount;

begin  -- architecture decoder

    ---------------------------------------------------------------------------------------------------------
    -- serial receiver.
    ---------------------------------------------------------------------------------------------------------
    midi_uarx : entity work.uarx(deserializer)
        generic map (
            CLK_PER   => CLK_PER,
            BAUD_RATE => BAUD_RATE)
        port map (
            clk      => clk_main,
            rst      => rst_main,
            ser_rx   => midi_rx,
            rx_data  => rx_data,
            rx_valid => rx_valid);

    ---------------------------------------------------------------------------------------------------------
    -- As quarter-frame messages come in, decode them and store in the internal frame rate buffer.
    -- The messages come in this order: frames, seconds, minutes, hours.
    --
    -- It takes two frames to receive the entire time. This means we keep an internal offset of +2 frames.
    --
    -- MTC spec says that the frame count least-significan nybble is sent on a frame boundary. This implies
    -- that another frame boundary occurs with the minute count LSN. Thus we'll strobe new_frame_rate on both
    -- of those events.
    --
    -- TO DO: support that +2 frame offset.
    --
    -- Remember that the frame time record wants BCD. We need both the LSN and the MSN to assemble the BCDs.
    -- This assembly will be handled in the assemble_timecode process below.
    ---------------------------------------------------------------------------------------------------------
    receive_timecode : process (clk_main) is
    begin  -- process receive_timecode
        if rising_edge(clk_main) then
            if rst_main = '1' then
                got_qfscs      <= '0';
                ft_rx_in       <= MTC_PKT_RESET;
                ft_rx_out      <= MTC_PKT_RESET;
                got_qf_0       <= '0';
                got_qf_4       <= '0';
            else

                -- clear one-shots.
                got_qf_0 <= '0';
                got_qf_4 <= '0';

                -- look only when a new byte has arrived.
                got_new_byte : if rx_valid then

                    -- if received byte is the correct status byte, flag it so we know the next byte will be
                    -- a time code quarter frame. Always clear the flag if it's not that byte.
                    got_qfscs <= '1' when rx_data = QFSCS_BYTE else '0';

                    -- parse the byte after the QFSCS.
                    -- Remember that each qframe gives a binary nybble, but our display wants BCD.
                    is_qfmsg : if got_qfscs then
                        which_msg : case qf_id is
                            when X"0" =>
                                -- frame lSN.
                                ft_rx_in.frames <= to_integer(unsigned(qf_data));
                                -- save previous frame for output.
                                ft_rx_out <= ft_rx_in;
                                -- this will force the new frame to go out.
                                got_qf_0 <= '1';
                            when X"1" =>
                                -- frame MSN.
                                ft_rx_in.frames <= CombineNybbles(
                                    LSN => ft_rx_in.frames,
                                    MSN => to_integer(unsigned(qf_data)));
                            when X"2" =>
                                -- seconds lSN.
                                ft_rx_in.seconds <= to_integer(unsigned(qf_data));
                            when X"3" =>
                                -- seconds MSN.
                                ft_rx_in.seconds <= CombineNybbles(
                                    LSN => ft_rx_in.seconds,
                                    MSN => to_integer(unsigned(qf_data)));
                            when X"4" =>
                                -- minutes lSN.
                                ft_rx_in.minutes  <= to_integer(unsigned(qf_data));
                                got_qf_4 <= '1';
                            when X"5" =>
                                -- minutes MSN.
                                ft_rx_in.minutes <= CombineNybbles(
                                    LSN => ft_rx_in.minutes,
                                    MSN => to_integer(unsigned(qf_data)));
                            when X"6" =>
                                -- hours lSN.
                                ft_rx_in.hours <= to_integer(unsigned(qf_data));
                            when X"7" =>
                                -- hours MSN and frame rate.
                                ft_rx_in.hours <= CombineNybbles(
                                    LSN => ft_rx_in.hours,
                                    MSN => to_integer(unsigned(qf_data(0 downto 0))));
                                ft_rx_in.frame_rate <= DecodeFrameRate(ARG => qf_data(2 downto 1));
                            when others =>
                                -- others could be 8 to F, which are to be ignored.
                                null;
                        end case which_msg;
                    end if is_qfmsg;
                end if got_new_byte;
            end if;
        end if;
    end process receive_timecode;

    ---------------------------------------------------------------------------------------------------------
    -- Update the output received frame time.
    ---------------------------------------------------------------------------------------------------------
    assemble_timecode: process (clk_main) is
    begin  -- process assemble_timecode
        if rising_edge(clk_main) then
            if rst_main = '1' then
                new_frame_time <= '0';
                frame_time <= MTC_PKT_RESET;
                
            else
                new_frame_time <= '0';

                -- we have an entire frame, so kick it out, while preparing for the next frame (between full
                -- MTC frames).
                is_qf : if got_qf_0 then
                    frame_time <= ft_rx_out;
                    new_frame_time <= '1';

                elsif got_qf_4 then
                    -- a new frame in between the MTC frame.
                    frame_time <= IncrementFrameCount(ft_rx_out);
                    new_frame_time <= '1';
                end if is_qf;
                
            end if;
        end if;
    end process assemble_timecode;

end architecture decoder;
