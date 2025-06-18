-------------------------------------------------------------------------------
-- Title      : Generate and encode time into analog LTC
-- Project    : 
-------------------------------------------------------------------------------
-- File       : tb_ltc_encoder.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-06-17
-- Last update: 2025-06-17
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-06-17  -        andy	Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

use work.ltc_mtc_pkg.all;

entity tb_ltc_encoder is
    generic (
        AMPLITUDE : real := 1.0);
    port (
        frame_rate : in  frame_rate_t;
        ltc_analog : out real);

end entity tb_ltc_encoder;

architecture model of tb_ltc_encoder is

    ---------------------------------------------------------------------------------------------------------
    -- For frame timing.
    -- how many bits in a frame?
    constant BITS_IN_FRAME : natural := 80;

    signal bit_time : time;
    signal half_bit_time : time;

    -- a virtual clock that runs at the bit time.
    signal bit_clk : std_logic := '1';

    -- a vritual frame clock.
    signal frame_clk : std_logic := '1';

    -- timecode from the generator.
    signal frame_time : frame_time_t;

    -- a start-up reset.
    signal rst : std_logic := '1';

    ---------------------------------------------------------------------------------------------------------
    -- Calculate bit time based on provided frame rate.
    ---------------------------------------------------------------------------------------------------------
    function calc_bit_time (
        constant FR : frame_rate_t)
        return time is
        variable ft : time;
        variable rv : time;
    begin  -- function calc_bit_time
        with FR select
            ft :=
            1 SEC / 24    when FR_24,
            1 SEC / 25    when FR_25,
            1 SEC / 30    when FR_30,
            1 SEC / 29.97 when FR_30DF;
        rv := ft / BITS_IN_FRAME;
        return rv;
    end function calc_bit_time;
    
begin  -- architecture model

    ---------------------------------------------------------------------------------------------------------
    -- bit time and half bit time, given frame rate.
    ---------------------------------------------------------------------------------------------------------
    bit_time <= calc_bit_time(frame_rate);
    half_bit_time <= bit_time / 2;

    -- generate the bit clock.
    bit_clk <= not bit_clk after half_bit_time;

    -- generate a frame clock every 80 bits.
    make_frame_clk: process (bit_clk) is
        variable v_bc : natural range to BITS_IN_FRAME - 1 := 0;
    begin  -- process make_frame_clk
        if rising_edge(bit_clk) then
            if v_bc = BITS_IN_FRAME then
                frame_clk <= '1';
            else
                frame_clk <= '0';
            end if;
            
            v_bc := (v_bc + 1) mod BITS_IN_FRAME;
        end if;
    end process make_frame_clk;

    rst <= '1', '0' after 666 NS;

    ---------------------------------------------------------------------------------------------------------
    -- Generate time.
    ---------------------------------------------------------------------------------------------------------
    ltc_enc_timecode_generator : entity work.timecode_generator
        port map (
            clk_timer  => frame_clk,
            rst_timer  => rst,
            frame_rate => frame_rate,
            frame_tick => '1',
            frame_time => frame_time);

    ---------------------------------------------------------------------------------------------------------
    -- Encode time
    ---------------------------------------------------------------------------------------------------------
    
    

    
end architecture model;
