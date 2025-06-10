-------------------------------------------------------------------------------
-- Title      : Testbench for design "clks_rst"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : clks_rst_tb.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-17
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
-- 2025-04-17  -        andy    Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.ltc_mtc_pkg.all;
use work.clk_mux_pkg.all;

-------------------------------------------------------------------------------------------------------------

entity clks_rst_tb is
    generic (
        CLKPER    : time := 10 NS;
        RESETTIME : time := 666 NS);
end entity clks_rst_tb;

-------------------------------------------------------------------------------------------------------------

architecture testbench of clks_rst_tb is

    -- component ports
    signal clk_ref     : std_logic := '1';
    signal arst_l      : std_logic := '0';
    signal clk_bundle  : clk_bundle_t;
    signal mmcm_locked : std_logic;
    signal clk_main    : std_logic;
    signal rst_main    : std_logic;
    signal rst_audio   : std_logic;
    signal clk_audio   : std_logic;
    signal sclk_audio  : std_logic;
    signal lrclk_audio : std_logic;

begin  -- architecture testbench

    -- component instantiation
    DUT : entity work.clks_rst(clkgen)
        port map (
            clk_ref     => clk_ref,
            arst_l      => arst_l,
            clk_bundle  => clk_bundle,
            mmcm_locked => mmcm_locked,
            clk_main    => clk_main,
            rst_main    => rst_main,
            rst_audio   => rst_audio,
            clk_audio   => clk_audio,
            sclk_audio  => sclk_audio,
            lrclk_audio => lrclk_audio);

    -- clock and reset
    clk_ref <= not clk_ref after CLKPER / 2;
    arst_l  <= '1'         after RESETTIME;

    ---------------------------------------------------------------------------------------------------------
    -- Report the clocks' frequencies.
    ---------------------------------------------------------------------------------------------------------
    freq_calc_ref : entity work.freq_calc
        generic map (
            SIGNAL_NAME => "Reference clock")
        port map (
            mysig => clk_ref);

    freq_calc_main : entity work.freq_calc
        generic map (
            SIGNAL_NAME => "Main clock")
        port map (
            mysig => clk_main);

    freq_calc_24fps : entity work.freq_calc
        generic map (
            SIGNAL_NAME => "24 fps clock")
        port map (
            mysig => clk_bundle(CLK_24FPS));

    freq_calc_25fps : entity work.freq_calc
        generic map (
            SIGNAL_NAME => "25 fps clock")
        port map (
            mysig => clk_bundle(CLK_25FPS));

    freq_calc_30fps : entity work.freq_calc
        generic map (
            SIGNAL_NAME => "30 fps clock")
        port map (
            mysig => clk_bundle(CLK_30FPS));

    freq_calc_mclk : entity work.freq_calc
        generic map (
            SIGNAL_NAME => "I2S mclk")
        port map (
            mysig => clk_audio);

    freq_calc_sclk : entity work.freq_calc
        generic map (
            SIGNAL_NAME => "I2S sclk")
        port map (
            mysig => sclk_audio);

    freq_calc_lrclk : entity work.freq_calc
        generic map (
            SIGNAL_NAME => "I2S lrclk")
        port map (
            mysig => lrclk_audio);

end architecture testbench;
