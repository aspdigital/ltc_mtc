-------------------------------------------------------------------------------
-- Title      : Testbench for design "mtc_encoder"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mtc_encoder_tb.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-27
-- Last update: 2025-04-27
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-27  -        andy	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.ltc_mtc_pkg.all;
use work.timecode_pkg.all;
use work.mtc_pkg.all;

-------------------------------------------------------------------------------------------------------------

entity mtc_encoder_tb is
    generic (
        RESET_TIME : time := 666 ns;
        TIMER_FREQ : real := 33.000e6);
end entity mtc_encoder_tb;

-------------------------------------------------------------------------------------------------------------

architecture testbench of mtc_encoder_tb is

    constant TIMER_CLK_PER : time := 1 SEC / TIMER_FREQ;
    signal tb_arst_l : std_logic := '0';

    -- component ports
    signal clk_timer     : std_logic := '1';
    signal rst_timer     : std_logic;
    signal frame_rate    : frame_rate_t := FR_30;
    signal frame_tick    : std_logic;
    signal frame_time    : frame_time_t;
    signal qframe_pkt    : qframe_pkt_t;
    signal do_full_frame : std_logic := '0';
    -- encoder output
    signal msg_data      : std_logic_vector(7 downto 0);
    signal msg_valid     : std_logic;

    -- uatx serializer
    signal clk_main : std_logic := '1';
    signal rst_main : std_logic;
    signal rd_rdy : std_logic;
    signal tx_busy : std_logic;         -- inverted ready

    signal midi_tx : std_logic;

begin  -- architecture testbench

    -- frame timer.
    tb_frame_timer : entity work.frame_timer(timer)
        port map (
            clk        => clk_timer,
            rst        => rst_timer,
            frame_rate => frame_rate,
            frame_tick => frame_tick,
            qframe_pkt => qframe_pkt);
    
    tb_timecode_generator : entity work.timecode_generator(timers)
        port map (
            clk_timer  => clk_timer,
            rst_timer  => rst_timer,
            frame_rate => frame_rate,
            frame_tick => frame_tick,
            frame_time => frame_time);

    -- component instantiation
    DUT: entity work.mtc_encoder(coder)
        port map (
            clk_timer     => clk_timer,
            rst_timer     => rst_timer,
            frame_rate    => frame_rate,
            frame_tick    => frame_tick,
            frame_time    => frame_time,
            qframe_pkt    => qframe_pkt,
            do_full_frame => do_full_frame,
            msg_data      => msg_data,
            msg_valid     => msg_valid);

    -- shim between encoder and UATX.
    rw_shim : entity work.tb_shim(simple)
        port map (
            clk_wr   => clk_timer,
            rst_wr   => rst_timer,
            wr_data  => msg_data,
            wr_valid => msg_valid,
            clk_rd   => clk_main,
            rst_rd   => rst_main,
            rd_rdy   => rd_rdy,
            rd_valid => rd_valid,
            rd_data  => rd_data);

    tb_uatx : entity work.uatx(serializer)
        generic map (
            SYSCLKPER => SYSCLKPER,
            BAUD_RATE => BAUD_RATE)
        port map (
            clk     => clk_main,
            rst     => rst_main,
            tx_data => rd_data,
            tx_wren => rd_valid,
            busy    => tx_busy,
            ser_tx  => midi_tx);

    rd_rdy <= not tx_busy;

    -- decode what was sent.
    tb_mtc_decoder_1: entity work.tb_mtc_decoder
        port map (
            midi_in => midi_tx);
    
    -- clock generation
    clk_timer <= not clk_timer after TIMER_CLK_PER / 2;
    tb_arst_l <= '1' after RESET_TIME;

    clk_main <= not clk_main after MAIN_CLK_PER / 2;

    timer_reset_sync : entity work.reset_sync(synchronizer)
        generic map (
            ASYNC_ACTIVE => '0')
        port map (
            clk  => clk_timer,
            arst => tb_arst_l,
            srst => rst_timer);
    
    main_reset_sync : entity work.reset_sync(synchronizer)
        generic map (
            ASYNC_ACTIVE => '0')
        port map (
            clk  => clk_main,
            arst => tb_arst_l,
            srst => rst_main);
    
end architecture testbench;
