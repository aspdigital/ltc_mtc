-- generate MIDI timecode.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ltc_mtc_pkg.all;

entity tb_mtc_encoder is

    port (
        frame_rate : in  frame_rate_t;
        midi_out   : out std_logic := '1');

end entity tb_mtc_encoder;

architecture model of tb_mtc_encoder is

    constant MIDI_BAUD_RATE : natural := 31250;
    constant MIDI_BIT_TIME  : time    := 1 SEC / MIDI_BAUD_RATE;

    signal qframe_interval : time := (1 SEC / 24) / 4;
    signal qframe_cnt      : natural range 0 to 7 := 0;
    signal qframe_tick     : std_logic            := '1';

    type frame_time_t is record
        frame   : natural;
        seconds : natural;
        minutes : natural;
        hours   : natural;
        rate    : std_logic_vector(1 downto 0);
    end record frame_time_t;

    signal ft : frame_time_t := (
        frame   => 0,
        seconds => 0,
        minutes => 0,
        hours   => 0,
        rate    => "00");

    -- based on frame rate, this is the terminal count for the frame counter
    signal last_frame : natural;

    -- send the two bytes F1 followed by QN
    procedure midi_transmitter (
        constant QFRAME : in  natural;
        constant ARG    : in  frame_time_t;
        signal tx       : out std_logic) is
        variable sr   : std_logic_vector(9 downto 0);
        variable byte : std_logic_vector(7 downto 0);
    begin
        -- send F1.
        sr := '1' & X"F1" & '0';
        byte_F1 : for bc in 0 to 9 loop
            tx <= sr(bc);
            wait for MIDI_BIT_TIME;
        end loop byte_F1;
        wait for MIDI_BIT_TIME;

        which_nybble : case QFRAME is
            when 0 =>
                byte := std_logic_vector(to_unsigned(ARG.frame, 8));
                sr   := '1' & 4X"0" & byte(3 downto 0) & '0';
            when 1 =>
                byte := std_logic_vector(to_unsigned(ARG.frame, 8));
                sr   := '1' & 4X"1" & byte(7 downto 4) & '0';
            when 2 =>
                byte := std_logic_vector(to_unsigned(ARG.seconds, 8));
                sr   := '1' & 4X"2" & byte(3 downto 0) & '0';
            when 3 =>
                byte := std_logic_vector(to_unsigned(ARG.seconds, 8));
                sr   := '1' & 4X"3" & byte(7 downto 4) & '0';
            when 4 =>
                byte := std_logic_vector(to_unsigned(ARG.minutes, 8));
                sr   := '1' & 4X"4" & byte(3 downto 0) & '0';
            when 5 =>
                byte := std_logic_vector(to_unsigned(ARG.minutes, 8));
                sr   := '1' & 4X"5" & byte(7 downto 4) & '0';
            when 6 =>
                byte := std_logic_vector(to_unsigned(ARG.frame, 8));
                sr   := '1' & 4X"6" & byte(3 downto 0) & '0';
            when 7 =>
                byte := std_logic_vector(to_unsigned(ARG.frame, 8));
                sr   := '1' & 4X"7" & ARG.rate & byte(5 downto 4) & '0';
            when others =>
                null;
        end case which_nybble;

        byte_qframe : for bcc in 0 to 9 loop
            tx <= sr(bcc);
            wait for MIDI_BIT_TIME;
        end loop byte_qframe;
        wait for MIDI_BIT_TIME;

    end procedure midi_transmitter;

begin

    qframe_interval <= (1 SEC / 24) / 4 when frame_rate = FR_24 else
                       (1 SEC / 25) / 4 when frame_rate = FR_25 else
                       (1 SEC / 30) / 4 when frame_rate = FR_30;

    last_frame <= 23 when frame_rate = FR_24 else
                  24 when frame_rate = FR_25 else
                  29 when frame_rate = FR_30;

    ft.rate <= std_logic_vector(to_unsigned(frame_rate_t'pos(frame_rate), ft.rate'length));

    -- quarter-frame rate clock tick.
    qframe_tick <= not qframe_tick after qframe_interval / 2;

    tcg : process is
    begin  -- process tcg

        wait until rising_edge(qframe_tick);
        -- resynchronize on qframe = 7.
        start_of_next_frame : if qframe_cnt = 7 then

            is_eof : if ft.frame = last_frame then
                ft.frame <= 0;

                is_eos : if ft.seconds = 59 then
                    ft.seconds <= 0;

                    is_eom : if ft.minutes = 59 then
                        ft.minutes <= 0;

                        is_eoh : if ft.hours = 23 then
                            ft.hours <= 0;
                        else
                            ft.hours <= ft.hours + 1;
                        end if is_eoh;
                    else
                        ft.minutes <= ft.minutes + 1;
                    end if is_eom;
                else
                    ft.seconds <= ft.seconds + 1;
                end if is_eos;
            else
                ft.frame <= ft.frame + 1;
            end if is_eof;
        end if start_of_next_frame;

        -- send the message.
        midi_transmitter(QFRAME => qframe_cnt, ARG => ft, tx => midi_out);
        qframe_cnt <= (qframe_cnt + 1) mod 8;
    end process tcg;

end architecture model;
