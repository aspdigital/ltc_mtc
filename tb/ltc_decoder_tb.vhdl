-------------------------------------------------------------------------------
-- Title      : Testbench for design "ltc_decoder"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ltc_decoder_tb.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-06-18
-- Last update: 2025-06-21
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-06-18  -        andy    Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.ltc_mtc_pkg.all;
use work.timecode_pkg.all;

-------------------------------------------------------------------------------------------------------------

entity ltc_decoder_tb is
    generic (
        AMPLITUDE : real := 1.0;
        DEBUG : natural := 1);
end entity ltc_decoder_tb;

-------------------------------------------------------------------------------------------------------------

architecture testbench of ltc_decoder_tb is

    constant CLKREFPER : time      := 10 NS;
    signal clk_ref     : std_logic := '1';
    signal arst_l      : std_logic := '0';

    signal ltc_analog : real;
    signal ltc_gen_frame_rate : frame_rate_t := FR_24;

    -- component ports
    signal clk_audio           : std_logic;
    signal rst_audio           : std_logic;
    signal sclk_audio          : std_logic;
    signal lrclk_audio         : std_logic;
    signal data_audio          : std_logic;
    signal ltcd_frame_rate     : frame_rate_t;
    signal ltcd_frame_time     : frame_time_t;
    signal ltcd_new_frame_time : std_logic;
    signal ltcd_locked         : std_logic;

begin  -- architecture testbench

    clk_ref <= not clk_ref after CLKREFPER / 2;
    arst_l  <= '1'         after 666 NS;

    -- generate I2S clocks.
    clks_rst_1 : entity work.clks_rst
        port map (
            clk_ref     => clk_ref,
            arst_l      => arst_l,
            clk_bundle  => open,
            mmcm_locked => open,
            clk_main    => open,
            rst_main    => open,
            rst_audio   => rst_audio,
            clk_audio   => clk_audio,
            sclk_audio  => sclk_audio,
            lrclk_audio => lrclk_audio);

    -- generated coded analog LTC.
    tb_ltc_encoder_1 : entity work.tb_ltc_encoder
        generic map (
            AMPLITUDE => AMPLITUDE)
        port map (
            frame_rate => ltc_gen_frame_rate,
            ltc_analog => ltc_analog);

    -- convert to digital.
    cs5343_1 : entity work.cs5343
        generic map (
            DEBUG             => DEBUG,
            ADC_IS_I2S_MASTER => 0,
            TESTMODE          => 0)
        port map (
            vref  => 3.3,
            mclk  => clk_audio,
            sclk  => sclk_audio,
            lrclk => lrclk_audio,
            ain_l => ltc_analog,
            ain_r => ltc_analog,
            sdout => data_audio);

    -- component instantiation
    DUT : entity work.ltc_decoder
        port map (
            clk_audio           => clk_audio,
            rst_audio           => rst_audio,
            sclk_audio          => sclk_audio,
            lrclk_audio         => lrclk_audio,
            data_audio          => data_audio,
            ltcd_frame_rate     => ltcd_frame_rate,
            ltcd_frame_time     => ltcd_frame_time,
            ltcd_new_frame_time => ltcd_new_frame_time,
            ltcd_locked         => ltcd_locked);

end architecture testbench;
