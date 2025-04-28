-------------------------------------------------------------------------------
-- Title      : Simulation model of MIDI time code receiver.
-- Project    : 
-------------------------------------------------------------------------------
-- File       : tb_mtc_decoder.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-27
-- Last update: 2025-04-27
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Receive and decode MIDI timecode packets.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-27  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

use work.mtc_pkg.all;
use work.timecode_pkg.all;

entity tb_mtc_decoder is

    port (
        midi_in : in std_logic);        -- serial MIDI in

end entity tb_mtc_decoder;

architecture model of tb_mtc_decoder is

    constant MIDI_BAUD_RATE : natural := 31250;
    constant MIDI_BIT_TIME  : time    := 1 SEC / MIDI_BAUD_RATE;

    signal rx_word : std_logic_vector(7 downto 0);
    alias qframe   : std_logic_vector(3 downto 0) is rx_word(7 downto 4);
    alias nybble   : std_logic_vector(3 downto 0) is rx_word(3 downto 0);

    signal got_f1 : boolean := FALSE;

    signal frames     : natural;
    signal seconds    : natural;
    signal minutes    : natural;
    signal hours      : natural;
    signal frame_rate : std_logic_vector(1 downto 0);

    signal frame_time : frame_time_t;
    ---------------------------------------------------------------------------------------------------------
    -- the serial receiver.
    ---------------------------------------------------------------------------------------------------------
    procedure midi_receiver (
        signal midi_rx : in  std_logic;
        signal midi_data : out std_logic_vector(7 downto 0)) is
    begin  -- procedure midi_receiver
        -- look for start bit
        wait until falling_edge(midi_in);
        report "got start bit" severity NOTE;
        -- go to middle of bit time.
        wait for MIDI_BIT_TIME / 2;
        get_bits : for bc in 0 to 7 loop
            wait for MIDI_BIT_TIME;
            midi_data(bc) <= midi_in;
        end loop get_bits;
        -- wait for stop bit
        wait for MIDI_BIT_TIME / 2;
    end procedure midi_receiver;

begin  -- architecture model

    midi_time_code_decoder : process is
    begin  -- process midi_time_code_decoder

        -- wait for something to come in.
        midi_receiver(midi_rx => midi_in, midi_data => rx_word);

        -- parse it.
        -- F1 preceeds all time code bytes.
        is_f1 : if rx_word = X"F1" then
            got_f1 <= TRUE;
        else
            got_f1 <= FALSE;
            
            -- should be a time code byte, but make sure we saw F1 first.
            is_data : if got_f1 then
                which_qframe : case qframe is
                    when X"0" =>
                        frames <= to_integer(unsigned(nybble));
                    when X"1" =>
                        frames <= frames + (16 * to_integer(unsigned(nybble)));
                    when X"2" =>
                        seconds <= to_integer(unsigned(nybble));
                    when X"3" =>
                        seconds <= seconds + (16 * to_integer(unsigned(nybble)));
                    when X"4" =>
                        minutes <= to_integer(unsigned(nybble));
                    when X"5" =>
                        minutes <= minutes + (16 * to_integer(unsigned(nybble)));
                    when X"6" =>
                        hours <= to_integer(unsigned(nybble));
                    when X"7" =>
                        hours      <= hours + (16 * to_integer(unsigned(nybble(0 downto 0))));
                        frame_rate <= nybble(2 downto 1);
                    when others => null;
                end case which_qframe;
            end if is_data;
        end if is_f1;

    end process midi_time_code_decoder;

    report_timecode: process (all) is
    begin  -- process report_timecode
        got_it_all: if frame_rate'event then
            report "frame rate: " & to_string(frame_rate) & ", " & to_string(hours) & ":" & to_string(minutes) & ":" & to_string(hours)
                severity NOTE;
        end if got_it_all;
    end process report_timecode;

end architecture model;
