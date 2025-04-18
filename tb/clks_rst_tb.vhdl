-------------------------------------------------------------------------------
-- Title      : Testbench for design "clks_rst"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : clks_rst_tb.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-17
-- Last update: 2025-04-17
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

-------------------------------------------------------------------------------------------------------------

entity clks_rst_tb is
    generic (
        CLKPER    : time := 10 NS;
        RESETTIME : time := 666 NS);
end entity clks_rst_tb;

-------------------------------------------------------------------------------------------------------------

architecture testbench of clks_rst_tb is

    -- component ports
    signal clkref     : std_logic    := '1';
    signal arst_l     : std_logic    := '0';
    signal frame_rate : frame_rate_t := FR_30;
    signal clktimer   : std_logic;
    signal rsttimer_l : std_logic;
    signal clkmain    : std_logic;
    signal rstmain_l  : std_logic;

begin  -- architecture testbench

    -- component instantiation
    DUT : entity work.clks_rst
        port map (
            clkref     => clkref,
            arst_l     => arst_l,
            frame_rate => frame_rate,
            clktimer   => clktimer,
            rsttimer_l => rsttimer_l,
            clkmain    => clkmain,
            rstmain_l  => rstmain_l);

    -- clock and reset
    clkref <= not clkref after CLKPER / 2;
    arst_l <= '1' after RESETTIME;

    -- waveform generation
    WaveGen_Proc : process
    begin
        wait for 500 US;
        wait until rising_edge(clkmain);
        frame_rate <= FR_24;
        wait for 500 US;
        wait until rising_edge(clkmain);
        frame_rate <= FR_25;
        wait for 500 US;
        wait until rising_edge(clkmain);
        frame_rate <= FR_30;
    end process WaveGen_Proc;



end architecture testbench;
