-------------------------------------------------------------------------------
-- Title      : Specialist clock multiplexor
-- Project    : 
-------------------------------------------------------------------------------
-- File       : clk_mux.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-16
-- Last update: 2025-04-17
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Accepts two select lines and three clock inputs, and based on the select lines outputs the
-- desired clock.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-16  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

use work.clk_mux_pkg.all;

entity clk_mux is

    port (
        -- lock status and rate change are on main clock.
        clkmain      : in  std_logic;   -- domain that manages the select
        rstmain_l    : in  std_logic;   -- reset in that domain
        mmcm_locked  : in  std_logic;   -- all clocks are valid
        rate_changed : in  std_logic;   -- strobe: choose a different clock.
        -- input clocks
        clk_24fps    : in  std_logic;   -- 37.5 MHz clock for 24 fpps operation
        clk_25fps    : in  std_logic;   -- 50 MHz clock for 25 fps operation
        clk_30fps    : in  std_logic;   -- 33 MHz clock for 30 fps operation
        -- select one of those three
        clk_sel      : in  clk_sel_t;   -- select one of the above
        -- output clock and reset in its domain.
        clk_out      : out std_logic;   -- resulting clock
        rst_out_l    : out std_logic);  -- reset in that domain.

end entity clk_mux;

architecture mux of clk_mux is

    -- Assert reset in the downstream domain when the MMCM is not locked or if the frame rate has changed.
    -- This will be synced to the downstream clock to drive rst_out_l.
    signal rst_int_l : std_logic;

    -- output of selected clock 1 or 2:
    signal clk_mux_37_or_50 : std_logic;

begin  -- architecture mux

    ---------------------------------------------------------------------------------------------------------
    -- If the clock select changes or if the MMCM is unlocked, assert the reset in the muxed clock domain.
    -- This also asserts the reset when the main domain reset is asserted.
    ---------------------------------------------------------------------------------------------------------
    MakeReset: process (clkmain) is
    begin  -- process MakeReset
        if rising_edge(clkmain) then
            if rstmain_l = '0' then
                rst_int_l <= '0';
            else
                rst_int_l <= '0' when mmcm_locked = '0' or rate_changed = '1' else '1';
            end if;
        end if;
    end process MakeReset;

    reset_sync : entity work.reset_sync(synchronizer)
        port map (
            clk    => clk_out,
            arst_l => rst_int_l,
            srst_l => rst_out_l);

    ---------------------------------------------------------------------------------------------------------
    -- CLOCK MUXING, to select one of the three clocks on which the timecode generator runs, depending on the
    -- selected frame rate.
    ---------------------------------------------------------------------------------------------------------
    -- select clocks 50 MHz or 37.5 MHz
    -- select etiher 25 fps or 24 fps
    clksel_1_2_bufgmux : BUFGMUX
        port map (
            O  => clk_mux_37_or_50,
            I0 => clk_25fps,
            I1 => clk_24fps,
            S  => clk_sel(CLK_SEL_37_NOT_50));

    -- select above or 33 MHz (30 fps). This mux output is that downstream timer clock.
    clksel_12_3_bufgctrl : BUFGMUX
        port map (
            O  => clk_out,
            I0 => clk_mux_37_or_50,
            I1 => clk_30fps,
            S  => clk_sel(CLK_SEL_33_NOT_OTHERS));



end architecture mux;

