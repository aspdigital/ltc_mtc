-------------------------------------------------------------------------------
-- Title      : MIDI Time Code Decoder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mtc_decoder.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-14
-- Last update: 2025-04-20
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

entity mtc_decoder is
    generic (
         CLK_PER  : time;               -- period of clk_main
        BAUD_RATE : natural := 31250);  -- MIDI baud rate
    port (
        -- MIDI in.
        midi_rx        : in std_logic;
        -- MIDI receiver is on global clock.
        -- So is the frame rate.
        clk_main       : in  std_logic;
        rst_main_l     : in  std_logic;
        -- frame rate is sent as part of the hours count MSN.
        frame_rate     : out frame_rate_t;
        -- frame time updates
        frame_time     : out frame_time_t;
        new_frame_time : out std_logic);
end entity mtc_decoder;

architecture decoder of mtc_decoder is

    -- uarx provides a receive byte and a valid strobe.
    signal rx_valid : std_logic;
    signal rx_data  : std_logic_vector(7 downto 0);
    
    -- MS nybble of the receive data could be the quarter frame identifier. (If it is F then we should have
    -- the system common status byte).
    alias qf_id     : std_logic_vector(3 downto 0) is rx_data(7 downto 4);
    -- LS nybble is part of the time.
    alias qf_data   : std_logic_vector(3 downto 0) is rx_data(3 downto 0);

    -- the Quarter Frame System Common Status Byte.
    constant QFSCS_BYTE : std_logic_vector(7 downto 0) := X"F1";

    -- indicate that we've received the Quarter Frame System Common Status byte. The byte received after that
    -- status byte is the time code data. That is, if we don't see the QFSCS byte, whatever comes in is
    -- ignored.
    signal got_qfscs : std_logic;

    -- an internal copy of the frame time. We keep this because we must apply the two-frame offset to the
    -- outgoing frame time, and applying that offset could cause some or all of the fields in the frame time
    -- to roll over.
    signal ft : frame_time_t;

    -- frame rate is encoded in the hours MSN.
    function DecodeFrameRate (
        constant ARG : std_logic_vector(1 downto 0))
        return frame_rate_t is
        variable rv : frame_rate_t;
    begin
        rv := frame_rate_t'val(to_integer(unsigned(ARG)));
        return rv;
    end function DecodeFrameRate;

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
            rst_l    => rst_main_l,
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
    ---------------------------------------------------------------------------------------------------------
    receive_timecode : process (clk_main) is
    begin  -- process receive_timecode
        if rising_edge(clk_main) then
            if rst_main_l = '0' then
                got_qfscs      <= '0';
                frame_rate     <= FR_30;
                ft             <= FRAME_TIME_RESET;
                new_frame_time <= '0';
            else

                -- clear one-shot.
                new_frame_time <= '0';

                got_new_byte : if rx_valid then

                    -- if received byte is the correct status byte, flag it so we know the next byte will be
                    -- a time code quarter frame. Always clear the flag if it's not that byte.
                    got_qfscs <= '1' when rx_data = QFSCS_BYTE else '0';

                    -- parse the byte after the QFSCS.
                    is_qfmsg : if got_qfscs then
                        which_msg : case qf_id is
                            when X"0" =>
                                -- frame lSN.
                                ft.frame_cnt.lsd <= to_integer(unsigned(qf_data));
                                new_frame_time   <= '1';
                            when X"1" =>
                                -- frame MSN.
                                ft.frame_cnt.msd <= to_integer(unsigned(qf_data));
                            when X"2" =>
                                -- seconds lSN.
                                ft.ft_sec.lsd <= to_integer(unsigned(qf_data));
                            when X"3" =>
                                -- seconds MSN.
                                ft.ft_sec.msd <= to_integer(unsigned(qf_data));
                            when X"4" =>
                                -- minutes lSN.
                                ft.ft_min.lsd  <= to_integer(unsigned(qf_data));
                                new_frame_time <= '1';
                            when X"5" =>
                                -- minutes MSN.
                                ft.ft_min.msd <= to_integer(unsigned(qf_data));
                            when X"6" =>
                                -- hours lSN.
                                ft.ft_hr.lsd <= to_integer(unsigned(qf_data));
                            when X"7" =>
                                -- hours MSN and frame rate.
                                ft.ft_hr.msd <= to_integer(unsigned(qf_data(0 downto 0)));
                                frame_rate   <= DecodeFrameRate(ARG => qf_data(2 downto 1));
                            when others =>
                                -- others could be 8 to F, which are to be ignored.
                                null;
                        end case which_msg;
                    end if is_qfmsg;
                end if got_new_byte;
            end if;
        end if;
    end process receive_timecode;

    frame_time <= ft;

end architecture decoder;
