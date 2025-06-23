-------------------------------------------------------------------------------
-- Title      : I2S data receiver
-- Project    : General-use module
-------------------------------------------------------------------------------
-- File       : i2s_rx.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2023-04-03
-- Last update: 2023-04-24
-- Platform   : Any FPGA, really
-- Standard   : VHDL'08
-------------------------------------------------------------------------------
-- Description:
-- 
-- This is a standard I2S receiver. It takes in the two clocks (LRCLK and BCLK) and the serial data stream
-- and presents the two samples (left and right) along with a data-valid strobe.
--
-- I2S supports any word size up to 32 bits. We configure the word size with a generic.
--
-- A system may operate in either master or slave mode.
-- 
-- In master mode, the system generates the I2S BCLK and LRCLK and presents them to the converter.
-- In slave mode, the converter provides the two clocks along with the data bit.
--
-- In either case, the clocks and data bit are synchronous to the MCLK modulator clock, which operates at a
-- known multiple of the sample rate. The data bit coming in from the converter into this entity is assumed
-- already synchronized to the mclk.
--
-- For purposes of capturing the samples from the converters, this entity operates on the modulator clock and
-- is not concerned about whether the converter or this FPGA is the master.
-- 
-- The bit clock is a strobe that occurs when the incoming data bit should be shifted in. This means
-- higher-up logic handles that generation. The LRCLK determines whether the bits on the wire are for the
-- left channel (LRCLK low) or the right channel (LRCLK high).
--
-------------------------------------------------------------------------------
-- Copyright (c) 2023 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2023-04-03           andy    Created
-- 2023-04-13           andy    this actually works
-- 2023-04-18           andy    Support multiple converters all running in parallel.
--                              Code for Xilinx (no async reset)
--                              sd_valid is a toggle for easier use in other clock domains.
-- 2023-04-24           andy    Fix sd_valid driver.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library asp_utils;
use asp_utils.vector_array_types_pkg.all;

entity i2s_rx is

    generic (
        NUM_PAIRS : positive;           -- number of converter chips, which gives pairs of channels
        SWIDTH    : positive);          -- width of the samples,  in bits

    port (
        mclk     : in  std_logic;       -- modulator clock, operates at a standard multiple of sample rate
        bclk     : in  std_logic;       -- a strobe true when we should shift in sample bits
        lrclk    : in  std_logic;       -- a flag set when right channel on the wire, else cleared when left
        sdin     : in  std_logic_vector(0 to NUM_PAIRS - 1);  -- the serial data input from the convert
        sd_left  : out slv_array_t(0 to NUM_PAIRS - 1)(SWIDTH - 1 downto 0);  -- left channel sample word
        sd_right : out slv_array_t(0 to NUM_PAIRS - 1)(SWIDTH - 1 downto 0);  -- right channel sample word
        sd_valid : out std_logic);      -- strobe true when all left and right are ready

end entity i2s_rx;

architecture i2s_shift_in of i2s_rx is

    -- there are 32 bit times for each sample.
    constant BITS : positive := 32;

    -- delay the BCLK for edge detect. The rising edge is when we shift in the bits.
    signal bclk_d : std_logic;

    -- delay the LRCLK for edge detect. This is used to reset the bit counter.
    signal lrclk_d  : std_logic;
    signal lrclk_dd : std_logic;

begin  -- architecture i2s_shift_in

    -- these are use for all channels.
    Controls : process (mclk) is
    begin  -- process Controls
        if rising_edge(mclk) then
            bclk_d   <= bclk;           -- delay for edge detect

            -- clear one-shot
            sd_valid <= '0';
            -- LRCLK asserted on falling edge of bclk, so look for a change in it on the bclk rising edge.
            -- we delay it wtice to ensure we capture received words correctly.
            bclk_edge : if bclk = '1' and bclk_d = '0' then
                lrclk_d  <= lrclk;
                lrclk_dd <= lrclk_d;

                -- if we just toggled to left, we've captured left and right, so indicate such.
                GotBothSamples : if lrclk_d = '0' and lrclk_dd = '1' then
                    sd_valid <= '1';
                end if GotBothSamples;
            end if bclk_edge;
        end if;
    end process Controls;

    -- purpose: Shift sample dataa bits in when the BCLK strobe is asserted
    -- type   : sequential
    -- inputs : mclk, mrst_l, sdin
    -- outputs: sd_left, sd_right
    Channels : for chan in 0 to NUM_PAIRS - 1 generate
        -- one shift register per both channel pair.
        signal sr : std_logic_vector(BITS - 1 downto 0);

        alias this_sample : std_logic_vector(SWIDTH - 1 downto 0) is sr(sr'LEFT downto sr'LEFT - SWIDTH + 1);

        -- because we capture the left channel before the right, save it so after we get the right channel
        -- data we latch both for any downstream thing.
        signal this_left : std_logic_vector(SWIDTH - 1 downto 0);
        
    begin

        Shifter : process (mclk) is
        begin  -- process Shifter
            if rising_edge(mclk) then

                -- Everything happens on the bit clock's rising edge.
                BitClock : if bclk = '1' and bclk_d = '0' then
                    -- shift register always shifts in MSb first
                    sr <= sr(sr'LEFT - 1 downto 0) & sdin(chan);

                    -- Bit counter is reset when LRCLK toggles.
                    -- The bit counter will also roll over normally at the same time as that toggle, but this
                    -- ensures the counter synchronizes if there is any change in whatever drives the I2S 
                    -- clocks and data.
                    LRClkToggle : if lrclk_d xor lrclk_dd then
                        LatchSamples : if lrclk_d = '1' then
                            -- we just toggled to right, so capture left.
                            this_left <= this_sample;
                        else
                            -- we just toggled to left, so capture right and align the previously-captured
                            -- left with it.
                            sd_left(chan) <= this_left;
                            sd_right(chan) <= this_sample;
                        end if LatchSamples;
                    end if LRClkToggle;

                end if BitClock;
            end if;
        end process Shifter;
    end generate Channels;

end architecture i2s_shift_in;
