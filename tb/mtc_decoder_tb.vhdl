-------------------------------------------------------------------------------
-- Title      : Testbench for design "mtc_decoder"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mtc_decoder_tb.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-20
-- Last update: 2025-06-09
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-20  -        andy    Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.ltc_mtc_pkg.all;
use work.mtc_pkg.all;
use work.timecode_pkg.all;

entity mtc_decoder_tb is

end entity mtc_decoder_tb;

architecture testbench of mtc_decoder_tb is

    constant CLK_PER    : time    := 10 NS;
    constant RESET_TIME : time    := 666 NS;
    constant BAUD_RATE  : natural := 31250;

    signal tb_arst_l : std_logic := '0';

    signal midi_rx        : std_logic;
    signal clk_main       : std_logic := '1';
    signal rst_main       : std_logic;
    signal frame_time     : mtc_pkt_t;
    signal new_frame_time : std_logic;

    -- test bench transmitter.
    constant TB_BIT_TIME : time := 1 SEC / BAUD_RATE;

    signal tb_frame_time        : frame_time_t := FRAME_TIME_RESET;
    constant TB_FRAME_RATE      : frame_rate_t := FR_30;
    constant TB_FRAME_INTERVAL  : time         := 1 SEC / 30;
    constant TB_QFRAME_INTERVAL : time         := TB_FRAME_INTERVAL / 4;

    -- toggles every frame and quarter frame, for synchronization.
    signal frame_toggle  : std_logic;   -- toggles every frame time
    signal qframe_toggle : std_logic;   -- toggles every quarter frame

    ---------------------------------------------------------------------------------------------------------
    -- procedure which sends a word.
    procedure transmit_word (
        constant NEWBYTE  : in  std_logic_vector(7 downto 0);
        constant BIT_TIME : in  time;
        signal ser_tx     : out std_logic) is
    begin  -- procedure transmit_word
        send_bits : for b in -1 to 8 loop
            which_bit : if b = -1 then
                ser_tx <= '0';
            elsif b = 8 then
                ser_tx <= '1';
            else
                ser_tx <= NEWBYTE(b);
            end if which_bit;

            wait for BIT_TIME;
        end loop send_bits;
    end procedure transmit_word;

begin  -- architecture testbench

    DUT : entity work.mtc_decoder(decoder)
        generic map (
            CLK_PER   => CLK_PER,
            BAUD_RATE => BAUD_RATE)
        port map (
            midi_rx        => midi_rx,
            clk_main       => clk_main,
            rst_main       => rst_main,
            frame_time     => frame_time,
            new_frame_time => new_frame_time);

    clk_main  <= not clk_main after CLK_PER / 2;
    tb_arst_l <= '1'          after RESET_TIME;

    main_reset_sync : entity work.reset_sync(synchronizer)
        generic map (
            ASYNC_ACTIVE => '0')
        port map (
            clk  => clk_main,
            arst => tb_arst_l,
            srst => rst_main);

    ---------------------------------------------------------------------------------------------------------
    -- send a sequence of quarter frame messages.
    -- Start of Frame is Every time the test-bench frame time updates.
    ---------------------------------------------------------------------------------------------------------
    send_test_data : process is
    begin  -- process send_test_data
        is_in_reset : if rst_main /= '0' then
            midi_rx <= '1';             -- idle high
            wait until rst_main = '0';
            wait for 100 US;
        end if is_in_reset;

        -- syncrhonize by waiting for a new frame. Then update every quarter frame.
        wait on frame_toggle;
        -- quarter frame 0:
        transmit_word(NEWBYTE => X"F1", BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        transmit_word(NEWBYTE => X"0" & BCDToSLV(tb_frame_time.frame_cnt)(3 downto 0), BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        wait on qframe_toggle;
        -- quarter frame 1:
        transmit_word(NEWBYTE => X"F1", BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        transmit_word(NEWBYTE => X"1" & "000" & BCDToSLV(tb_frame_time.frame_cnt)(4), BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        wait on qframe_toggle;
        -- quarter frame 2:
        transmit_word(NEWBYTE => X"F1", BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        transmit_word(NEWBYTE => X"2" & BCDToSLV(tb_frame_time.ft_sec)(3 downto 0), BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        wait on qframe_toggle;
        -- quarter frame 3:
        transmit_word(NEWBYTE => X"F1", BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        transmit_word(NEWBYTE => X"3" & "00" & BCDToSLV(tb_frame_time.ft_sec)(5 downto 4), BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        wait on qframe_toggle;
        -- quarter frame 4:
        transmit_word(NEWBYTE => X"F1", BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        transmit_word(NEWBYTE => X"4" & BCDToSLV(tb_frame_time.ft_min)(3 downto 0), BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        wait on qframe_toggle;
        -- quarter frame 5:
        transmit_word(NEWBYTE => X"F1", BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        transmit_word(NEWBYTE => X"5" & "00" & BCDToSLV(tb_frame_time.ft_min)(5 downto 4), BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        wait on qframe_toggle;
        -- quarter frame 6:
        transmit_word(NEWBYTE => X"F1", BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        transmit_word(NEWBYTE => X"6" & BCDToSLV(tb_frame_time.ft_hr)(3 downto 0), BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        wait on qframe_toggle;
        -- quarter frame 7, code for 30 fps frame rate
        transmit_word(NEWBYTE => X"F1", BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);
        transmit_word(NEWBYTE => X"7" & "011" & BCDToSLV(tb_frame_time.ft_hr)(4), BIT_TIME => TB_BIT_TIME, ser_tx => midi_rx);

    end process send_test_data;

    ---------------------------------------------------------------------------------------------------------
    -- Frame and quarter-frame interval timer. Generates toggles at the appropriate time.
    ---------------------------------------------------------------------------------------------------------
    frame_interval : process is
    begin  -- process frame_interval
        is_reset : if tb_arst_l = '0' then
            frame_toggle  <= '0';
            qframe_toggle <= '0';
            wait until tb_arst_l = '1';
        end if is_reset;

        quarter_timer : for q in 0 to 3 loop
            wait for TB_QFRAME_INTERVAL;
            qframe_toggle <= not qframe_toggle;
            is_frame_time : if q = 0 then
                frame_toggle <= not frame_toggle;
            end if is_frame_time;
        end loop quarter_timer;

    end process frame_interval;

    ---------------------------------------------------------------------------------------------------------
    -- Frame timer, which just runs.
    -- Asserts a quarter-frame timer strobe and a frame time strobe at the appropriate intervals.
    ---------------------------------------------------------------------------------------------------------
    frame_timer : process is
        variable v_fc  : frame_cnt_t    := FRAME_CNT_RESET;
        variable v_sec : time_0_to_59_t := MINSEC_RESET;
        variable v_min : time_0_to_59_t := MINSEC_RESET;
        variable v_hr  : time_0_to_23_t := HR_RESET;
    begin  -- process frame_timer

        wait on frame_toggle;

        -- start from frame to seconds to minutes to hours, incrementing and carrying as needed.
        v_fc := IncrementDigits(ARG => tb_frame_time.frame_cnt, TC => FC_ROLLOVER_LSD_30);

        FrameCountRollover : if v_fc.carry then
            -- frame count rolled over, increment seconds.
            v_sec := IncrementDigits(ARG => tb_frame_time.ft_sec);

            SecondsRollover : if v_sec.carry then
                -- seconds rolled over, increment minutes.
                v_min := IncrementDigits(ARG => tb_frame_time.ft_min);

                MinutesRollover : if v_min.carry then
                    -- minutes rolled over, increment hours.
                    v_hr := IncrementDigits(ARG => tb_frame_time.ft_hr);

                -- hours rolled over so now everything should be zero.
                end if MinutesRollover;

            end if SecondsRollover;

        end if FrameCountRollover;

        tb_frame_time <= (
            frame_cnt => v_fc,
            ft_sec    => v_sec,
            ft_min    => v_min,
            ft_hr     => v_hr);

    end process frame_timer;

end architecture testbench;
