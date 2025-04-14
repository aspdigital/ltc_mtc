-------------------------------------------------------------------------------
-- Title      : Testbench for design "ltc_mtc"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ltc_mtc_tb.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-06
-- Last update: 2025-04-13
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-06  -        andy    Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------------------------------------

entity ltc_mtc_tb is

end entity ltc_mtc_tb;

-------------------------------------------------------------------------------------------------------------

architecture testbench of ltc_mtc_tb is

    -- component generics
    constant CLKPER : time := 10 NS;

    -- component ports
    signal CLK100MHZ  : std_logic                    := '1';
    signal CPU_RESETN : std_logic                    := '0';
    signal SW         : std_logic_vector(1 downto 0) := "00";
    signal BTND       : std_logic := '0';
    signal LED : std_logic_vector(15 downto 0);
    signal CA         : std_logic;
    signal CB         : std_logic;
    signal CC         : std_logic;
    signal CD         : std_logic;
    signal CE         : std_logic;
    signal CF         : std_logic;
    signal CG         : std_logic;
    signal DP         : std_logic;
    signal AN         : std_logic_vector(7 downto 0);
    signal JA         : std_logic_vector(2 downto 1);
    signal AUD_PWM    : std_logic;
    signal AUD_SD     : std_logic;

begin  -- architecture testbench

    -- component instantiation
    DUT : entity work.ltc_mtc
        generic map (
            CLKPER => CLKPER)
        port map (
            CLK100MHZ  => CLK100MHZ,
            CPU_RESETN => CPU_RESETN,
            BTND       => BTND,
            LED        => LED,
            SW         => SW,
            CA         => CA,
            CB         => CB,
            CC         => CC,
            CD         => CD,
            CE         => CE,
            CF         => CF,
            CG         => CG,
            DP         => DP,
            AN         => AN,
            JA         => JA,
            AUD_PWM    => AUD_PWM,
            AUD_SD     => AUD_SD);

    -- clock generation
    CLK100MHZ  <= not CLK100MHZ after 10 NS;
    CPU_RESETN <= '1'           after 666 NS;

    -- change clock frequency.
    ChangeClockFreq : process is
    begin  -- process ChangeClockFreq
        SW <= "00";
        wait for 5000 MS;
        SW <= "01";
        wait for 5000 MS;
        SW <= "10";
        wait for 5000 MS;
    end process ChangeClockFreq;

end architecture testbench;

