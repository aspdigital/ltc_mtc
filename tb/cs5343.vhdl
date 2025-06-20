-------------------------------------------------------------------------------
-- Title      : Bus-functional model of Cirrus CS5343 audio ADC
-- Project    : General use simulation model
-------------------------------------------------------------------------------
-- File       : cs5343.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2023-04-12
-- Last update: 2023-04-13
-- Platform   : simulation model
-- Standard   : VHDL'08
-------------------------------------------------------------------------------
-- Description: This a bus-functional model of the Cirrus 5343 audio ADC with I2S serial output.
--
-- The chip can act as the I2S bus master (sclk and lrclk as outputs, derived from MCLK) or as a slave (sclk
-- and lrclk are inputs). The real chip requires pull-up or pull-down on SDOUT to select the mode. It also
-- detects the oversampling ratio and single/double-speed mode by looking at SCLK and LRCLK at startup.
--
-- Rather than bother with that, we have a generic MASTER.
--
-- When MASTER is 0, the model acts as I2S bus slave and expects an external master to provide LRCLK and
-- SCLK.
--
-- When MASTER is non-zero, the model acts as I2S bus master and will drive LRCLK and SCLK to an external
-- device. The LRCLK and SCLK frequencies are determined by the value of MASTER. See discussion in the code
-- below for details.
--
-- As a slave, it auto-detects single- or double-speed mode based on MCLK/LRCLK and SCLK/LRCLK ratios, though
-- for practical modeling purposes the mode doesn't matter: sample data are serialized according to the
-- provided SCLK and LRCLK.
-------------------------------------------------------------------------------
-- Copyright (c) 2023 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2023-04-12           andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

entity cs5343 is

    generic (
        DEBUG             : natural := 0;   -- set non-zero for simulation messages
        ADC_IS_I2S_MASTER : natural := 0;   -- set non-zero for master mode (clocks are outputs)
        TESTMODE          : natural := 0);  -- set non-zero for simulated pattern (not live data)

    port (
        vref  : in    real;             -- reference voltage (VA on device)
        mclk  : in    std_logic;        -- modulator clock
        sclk  : inout std_logic;        -- serial bit clock
        lrclk : inout std_logic;        -- frame clock
        ain_l : in    real;             -- analog input left channel
        ain_r : in    real;             -- analog input right channel
        sdout : out   std_logic);       -- serial data out

end entity cs5343;

architecture model of cs5343 is

    signal i_lrclk : std_logic := '0';  -- internal LRCLK, actually runs the converter
    signal i_sclk  : std_logic := '0';  -- internal SCLK, actually runs the converter

    -- input channels as an array.
    signal ain : real_vector(0 to 1);

    -- conversion results
    type conv_result_array_t is array (0 to 1) of std_logic_vector(23 downto 0);
    signal conv_results : conv_result_array_t;

    -- for shift register loading, capture the state of LRCLK and look for its falling edge.
    signal i_lrclk_d : std_logic;

    -- outgoing shift register.
    signal sr : std_logic_vector(63 downto 0);

    -- counters for test patterns, if TESTMODE is set.
    subtype tp_t is integer range -(2 ** 23) to (2 ** 23) - 1;
    signal tp_left  : tp_t := -1;
    signal tp_right : tp_t := +1;

    -- do the conversion. We get a two's complement result.
    -- NB: if in software mode, prior to configuration the reference will be
    -- zero. That will result in a divide-by-zero error. We'll trap that case.
    function adc (
        volts_in  : real;                  -- what we're converting
        reference : real                   -- ADC reference
        )
        return std_logic_vector is
        variable volts            : real;  -- to handle input overrange
        variable converted_real   : real;
        variable converted_int    : integer;
        variable converted_signed : signed(23 downto 0);
    begin  -- function adc

        DealWithZeroReference : if reference = 0.0 then
            return (24d"0");
        end if DealWithZeroReference;

        -- handle overrange.
        Overrange : if volts_in > reference then
            volts := reference;
        elsif volts_in < -reference then
            volts := -reference;
        else
            volts := volts_in;
        end if Overrange;

        converted_real   := (volts * real(2**23)) / reference;
        assert DEBUG = 0 report "converted real: " & to_string(converted_real) severity NOTE;
        converted_int    := integer(converted_real);
        assert DEBUG = 0 report "converted int: " & to_string(converted_int) severity NOTE;
        converted_signed := to_signed(converted_int, 24);
        assert DEBUG = 0 report "converted signed: " & to_string(converted_signed) severity NOTE;
        return std_logic_vector(converted_signed);
    end function adc;

begin  -- architecture model

    -- put analog inputs into the vector for convenience.
    ain(0) <= ain_l;
    ain(1) <= ain_r;

    ---------------------------------------------------------------------------------------------------------
    -- If in master mode, divide the modulator clock to get the bit clock and the sample-rate L/R clock.
    -- Otherwise, clock inputs drive the converter.
    ---------------------------------------------------------------------------------------------------------
    MasterSlaveSelect : if ADC_IS_I2S_MASTER = 0 generate
        -- This is slave mode, conversion driven by the external clocks.
        lrclk   <= 'Z';
        sclk    <= 'Z';
        i_lrclk <= lrclk;
        i_sclk  <= sclk;
    else generate
        -- this is master mode, so we create the conversion clocks here, and then drive them to the outside
        -- world.
        -- The value of ADC_IS_I2S_MASTER is the oversampling ratio, so if it is 512 then for 24.576 MHz the sample rate
        -- is 48 kHz.
        -- In all definitions of I2S, the MCLK is not synchronous to the LRCLK and SCLK as such, in that
        -- there can be phase (timing) offset from MCLK to the other two. So those two clocks generated here
        -- will be offset in delta time from MCLK.
        -- The SCLK to LRCLK ratio is always 64 as there are 64 bits in a frame.
        -- We toggle at half the period, hence the /2.
        constant SCLK_DIVIDER  : positive                             := (ADC_IS_I2S_MASTER / 64) / 2;
        signal sclk_div_cnt    : natural range 0 to SCLK_DIVIDER - 1  := 0;
        constant LRCLK_DIVIDER : positive                             := ADC_IS_I2S_MASTER / 2;
        signal lrclk_div_cnt   : natural range 0 to LRCLK_DIVIDER - 1 := 0;
    begin
        -- the two dividers.
        DivideToSClk : process (mclk) is
        begin  -- process DivideToSClk
            if rising_edge(mclk) then
                sclk_div_cnt <= (sclk_div_cnt + 1) mod SCLK_DIVIDER;
                if sclk_div_cnt = (SCLK_DIVIDER - 1) then
                    i_sclk <= not i_sclk;
                end if;
            end if;
        end process DivideToSClk;

        -- LRCLK should change with falling SCLK.
        DivideToLRCLK : process (mclk) is
        begin  -- process DivideToLRCLK
            if rising_edge(mclk) then
                lrclk_div_cnt <= (lrclk_div_cnt + 1) mod LRCLK_DIVIDER;
                if lrclk_div_cnt = (LRCLK_DIVIDER - 1) then
                    i_lrclk <= not i_lrclk;
                end if;
            end if;
        end process DivideToLRCLK;

        -- to the outside world.
        lrclk <= i_lrclk;
        sclk  <= i_sclk;
    end generate MasterSlaveSelect;

    ---------------------------------------------------------------------------------------------------------
    -- Conversion occurs on falling edge of LRCLK, and is ready time time to shift out starting with the
    -- second rising edge after a change in LRCLK.
    -- Samples are 2's complement.
    --
    -- ADU = 2^bits * Vin / Vref
    ---------------------------------------------------------------------------------------------------------
    Converters : for chan in 0 to 1 generate
    begin
        Conversion : process (i_lrclk) is
        begin  -- process Conversion
            if falling_edge(i_lrclk) then
                conv_results(chan) <= adc(ain(chan), vref);
            end if;
        end process Conversion;

    end generate Converters;

    ---------------------------------------------------------------------------------------------------------
    -- Output shifter in I2S format.
    -- LRCLK changes simultaneously with the falling edge of SCLK.
    -- Bits shift out MSb first, on the first falling edge of SCLK after LRCLK changes.
    -- To ensure we load correctly: capture the state of LRCLK on the rising edge of SCLK. If it has changed,
    -- and it was the falling edge (start of a frame) we load the shift register.
    ---------------------------------------------------------------------------------------------------------
    Shifter : process (i_sclk) is
        variable v_sr_loadval : std_logic_vector(63 downto 0);
    begin  -- process Shifter
        if rising_edge(i_sclk) then
            i_lrclk_d <= i_lrclk;       -- for edge detect.

            if i_lrclk = '0' and i_lrclk_d = '1' then
                TestPattern : if TESTMODE /= 0 then
                    -- for next sample
                    tp_left      <= (tp_left - 1);
                    tp_right     <= (tp_right + 1);
                    v_sr_loadval := std_logic_vector(to_signed(tp_left, 24)) & "00000000" &
                                    std_logic_vector(to_signed(tp_right, 24)) & "00000000";  -- this sample
                    sr <= v_sr_loadval;

                else
                    sr <= conv_results(0) & "00000000" & conv_results(1) & "00000000";
                end if TestPattern;
            else
                sr <= sr(sr'LEFT - 1 downto 0) & '0';
            end if;
        end if;

        if falling_edge(i_sclk) then
            sdout <= sr(sr'LEFT);
        end if;
    end process Shifter;

end architecture model;
