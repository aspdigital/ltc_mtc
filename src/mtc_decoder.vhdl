-------------------------------------------------------------------------------
-- Title      : MIDI Time Code Decoder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mtc_decoder.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-14
-- Last update: 2025-04-20
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: This entity implements a MIDI Time Code Receiver/Decoder.
--
-- We capture incoming time code message bytes and keep track of them. When the entire time code is received,
-- it is made available to the display.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-14  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

use work.ltc_mtc_pkg.all;
use work.clk_mux_pkg.all;

entity mtc_decoder is

    port (
        -- MIDI receiver is on global clock.
        -- So is the frame rate.
        clk_main     : in  std_logic;
        rst_main_l   : in  std_logic;
        -- eventually frame rate will be determined from received MIDI time code, for now just accept it.
        frame_rate  : in  frame_rate_t;
        -- MMCM outputs the three clocks that work in the frame rate domains.
        clk_bundle  : in  clk_bundle_t;
        mmcm_locked : in  std_logic;
        -- enable an LED.
        led         : out std_logic);

end entity mtc_decoder;

architecture decoder of mtc_decoder is

    -- clock and reset in selected domain.
    signal clk : std_logic;
    signal rst_l : std_logic;

begin  -- architecture decoder

    ---------------------------------------------------------------------------------------------------------
    -- serial receiver.
    ---------------------------------------------------------------------------------------------------------

    ---------------------------------------------------------------------------------------------------------
    -- 
    ---------------------------------------------------------------------------------------------------------
    
    select_timer_clk : entity work.clk_mux(mux)
        port map (
            -- lock status and frme rate are on main clock
            clk_main      => clk_main,
            rst_main_l    => rst_main_l,
            mmcm_locked  => mmcm_locked,
            frame_rate   => frame_rate,
            -- input clocks from MMCM
            clk_bundle   => clk_bundle,
            clk_out      => clk,
            rst_out_l    => rst_l);

    -- drive LED on muxed clock.
    rgb_led_driver : entity work.rgb_led(led_driver)
        port map (
            clk   => clk,
            rst_l => rst_l,
            led   => led);

end architecture decoder;
