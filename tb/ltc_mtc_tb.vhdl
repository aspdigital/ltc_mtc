-------------------------------------------------------------------------------
-- Title      : Testbench for design "ltc_mtc"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ltc_mtc_tb.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-06
-- Last update: 2025-05-28
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Exercise and validate the linear time code generator and receivers.
--
-- DISPLAY_SOURCE generic sets what drives the 7-segment displays:
--      "INTERNAL" means the internal generator drives
--      "MTC_IN"   means the MTC decoder drives from external MTC input.
--      "LTC_IN"   means the LTC decoder drives from external LTC input.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-06  -        andy    Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

use work.ltc_mtc_pkg.all;

-------------------------------------------------------------------------------------------------------------

entity ltc_mtc_tb is
    generic (
        DISPLAY_SOURCE : string;
        TX_FRAME_RATE  : natural);
end entity ltc_mtc_tb;

-------------------------------------------------------------------------------------------------------------

architecture testbench of ltc_mtc_tb is

    constant TB_MIDI_FRAME_RATE : frame_rate_t := FR_24;

    constant FRAME_RATE_STR : string := frame_rate_t'image(frame_rate_t'val(TX_FRAME_RATE));

    -- component generics
    constant CLKPER : time := 10 NS;

    -- component ports
    signal CLK100MHZ  : std_logic := '1';
    signal CPU_RESETN : std_logic := '0';
    signal SW         : std_logic_vector(3 downto 0);
    signal BTND       : std_logic := '0';
    signal LED16_B    : std_logic;
    signal LED        : std_logic_vector(15 downto 0);
    signal CA         : std_logic;
    signal CB         : std_logic;
    signal CC         : std_logic;
    signal CD         : std_logic;
    signal CE         : std_logic;
    signal CF         : std_logic;
    signal CG         : std_logic;
    signal DP         : std_logic;
    signal AN         : std_logic_vector(7 downto 0);
    signal JA1        : std_logic;
    signal JA2        : std_logic;
    signal JA3        : std_logic;
    signal AUD_PWM    : std_logic;
    signal AUD_SD     : std_logic;

    -- "digits" to "display"
    

begin  -- architecture testbench

    -- determine generator frame rate.
    SW(1 downto 0) <= std_logic_vector(to_unsigned(TX_FRAME_RATE, 2));

    -- determine display driver.
    SetSourceSwitches : process (all) is
    begin  -- process SetSourceSwitches
        DecodeGeneric : case DISPLAY_SOURCE is
            when "INT"  => SW(3 downto 2) <= "00";
            when "MTC"  => SW(3 downto 2) <= "01";
            when "LTC"  => SW(3 downto 2) <= "11";
            when others => report "Invalid DISPLAY_SOURCE" severity FAILURE;
        end case DecodeGeneric;
    end process SetSourceSwitches;

    -- component instantiation
    DUT : entity work.ltc_mtc(toplevel)
        generic map (
            CLKPER => CLKPER)
        port map (
            CLK100MHZ  => CLK100MHZ,
            CPU_RESETN => CPU_RESETN,
            BTND       => BTND,
            LED        => LED,
            SW         => SW,
            LED16_B    => LED16_B,
            CA         => CA,
            CB         => CB,
            CC         => CC,
            CD         => CD,
            CE         => CE,
            CF         => CF,
            CG         => CG,
            DP         => DP,
            AN         => AN,
            JA1        => JA1,
            JA2        => JA2,
            JA3        => JA3,
            AUD_PWM    => AUD_PWM,
            AUD_SD     => AUD_SD);

    -- clock generation
    CLK100MHZ  <= not CLK100MHZ after CLKPER / 2;
    CPU_RESETN <= '1'           after 666 NS;

    assert FALSE report "frame rate =  " & FRAME_RATE_STR severity NOTE;

    -- Decode the incoming MIDI time code.
    tb_mtc_decoder_1 : entity work.tb_mtc_decoder(model)
        port map (
            midi_in => JA2);

    -- generate MIDI time code to feed to our decoder
    tb_mtc_encoder_1 : entity work.tb_mtc_encoder(model)
        port map (
            frame_rate => TB_MIDI_FRAME_RATE,
            midi_out   => JA1);

    -- What was displayed?
    tb_timecode_display_1: entity work.tb_timecode_display
        port map (
            CA  => CA,
            CB  => CB,
            CC  => CC,
            CD  => CD,
            CE  => CE,
            CF  => CF,
            CG  => CG,
            CDP => DP,
            AN  => AN);
end architecture testbench;

