-------------------------------------------------------------------------------
-- Title      : encode and serialize the midi time code.
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mtc_tx.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-05-13
-- Last update: 2025-05-13
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-05-13  -        andy	Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

use work.ltc_mtc_pkg.all;
use work.mtc_pkg.all;
use work.timecode_pkg.all;

entity mtc_tx is
    generic (
        CLK_MAIN_PER   : time;
        MIDI_BAUD_RATE : natural := 31250);
    port (
        clk_timer     : in  std_logic;     -- timer clock for the MTC coder
        rst_timer     : in  std_logic;     -- reset in that domain
        frame_rate    : in  frame_rate_t;  -- the active frame rate
        frame_tick    : in  std_logic;     -- tick at the frame rate
        frame_time    : in  frame_time_t;  -- the current frame time
        qframe_pkt    : in  qframe_pkt_t;  -- quarter-frame tick and ID
        do_full_frame : in  std_logic;     -- send the Full Frame Message
        clk_main      : in  std_logic;     -- main clock for the serializer
        rst_main      : in  std_logic;     -- reset in that domain
        midi_ser_tx   : out std_logic);    -- serial MIDI data out

end entity mtc_tx;

architecture mtc_driver of mtc_tx is

    ---------------------------------------------------------------------------------------------------------
    -- MIDI message from encoder to serial transmit
    ---------------------------------------------------------------------------------------------------------
    signal midi_msg_data  : std_logic_vector(7 downto 0);
    signal midi_msg_valid : std_logic;


begin  -- architecture mtc_driver

    ---------------------------------------------------------------------------------------------------------
    -- create MIDI time code packets and feed to serial transmitter.
    -- The serial transmitter is not embedded in this encoder because if the encoder is used in a design
    -- where other MIDI data (note, controller, etc) are transmitted, the muxing and serial TX loader have to
    -- be designed.
    ---------------------------------------------------------------------------------------------------------
    mtc_enc : entity work.mtc_encoder(coder)
        port map (
            clk_timer     => clk_timer,
            rst_timer     => rst_timer,
            frame_rate    => frame_rate,
            frame_tick    => frame_tick,
            frame_time    => frame_time,
            qframe_pkt    => qframe_pkt,
            do_full_frame => do_full_frame,
            msg_data      => midi_msg_data,
            msg_valid     => midi_msg_valid);

    ---------------------------------------------------------------------------------------------------------
    -- Take coded MIDI TC messages and push them out the serial port.
    ---------------------------------------------------------------------------------------------------------
    serial_transmitter : entity work.uatx_with_fifo(wrapper)
        generic map (
            SYSCLKPER => CLK_MAIN_PER,      -- system clock period, for UATX baud rate generator
            BAUD_RATE => MIDI_BAUD_RATE)    -- what it is
        port map (
            clk_src     => clk_timer,       -- clock for the FIFO input
            rst_src     => rst_timer,       -- reset in that domain
            tx_data     => midi_msg_data,   -- data to send
            tx_valid    => midi_msg_valid,  -- write din to the FIFO
            full        => open,
            almost_full => open,
            clk_main    => clk_main,        -- global clock which drives serializer
            rst_main    => rst_main,        -- reset in that domain
            ser_tx      => midi_ser_tx);    -- serial data transmit line



end architecture mtc_driver;
