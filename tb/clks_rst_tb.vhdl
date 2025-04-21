-------------------------------------------------------------------------------
-- Title      : Testbench for design "clks_rst"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : clks_rst_tb.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-17
-- Last update: 2025-04-20
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
    signal clk_ref     : std_logic    := '1';
    signal arst_l      : std_logic    := '0';
    signal frame_rate  : frame_rate_t := FR_30;
    signal clk_bundle  : clk_bundle_t;
    signal mmcm_locked : std_logic;
    signal clk_timer   : std_logic;
    signal rst_timer_l : std_logic;
    signal clk_main    : std_logic;
    signal rst_main_l  : std_logic;

begin  -- architecture testbench

    -- component instantiation
    DUT : entity work.clks_rst(clkgen)
        port map (
            clk_ref     => clk_ref,
            arst_l      => arst_l,
            frame_rate  => frame_rate,
            clk_bundle  => clk_bundle,
            mmcm_locked => mmcm_locked,
            clk_timer   => clk_timer,
            rst_timer_l => rst_timer_l,
            clk_main    => clk_main,
            rst_main_l  => rst_main_l);

    -- clock and reset
    clk_ref <= not clk_ref after CLKPER / 2;
    arst_l  <= '1'         after RESETTIME;

    -- waveform generation
    WaveGen_Proc : process
    begin
        wait for 500 US;
        wait until rising_edge(clk_main);
        frame_rate <= FR_24;
        wait for 500 US;
        wait until rising_edge(clk_main);
        frame_rate <= FR_25;
        wait for 500 US;
        wait until rising_edge(clk_main);
        frame_rate <= FR_30;
    end process WaveGen_Proc;



end architecture testbench;
