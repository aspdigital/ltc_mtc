-------------------------------------------------------------------------------
-- Title      : Clock multiplexor defines
-- Project    : 
-------------------------------------------------------------------------------
-- File       : clk_mux_pkg.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-16
-- Last update: 2025-04-19
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: The mmcm outputs three clocks that support the different frame rates. The clk_mux entity
-- takes a select and outputs one of the three. A reset in that output domain is also created.
--
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-16  -        andy	Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package clk_mux_pkg is

    -- MMCM output clocks are in this vector.
    type clk_bundle_index_t is (CLK_24FPS, CLK_25FPS, CLK_30FPS);
    type clk_bundle_t is array(clk_bundle_index_t) of std_logic;
    
    -- one-hot clock selects decoded from frame_rate input.
    -- bit 0 selects between 50 MHz (0) and 37.5 MHz (1).
    -- bit 1 selects between the above (0) or 33 MHz (1)
    constant CLK_SEL_37_NOT_50 : natural := 0;
    constant CLK_SEL_33_NOT_OTHERS : natural := 1;
    subtype clk_sel_t is std_logic_vector(CLK_SEL_33_NOT_OTHERS downto CLK_SEL_37_NOT_50);
    constant CLK_SEL_FR24 : clk_sel_t := "01";  -- 37.5 MHz
    constant CLK_SEL_FR25 : clk_sel_t := "00";  -- 50 MHz
    constant CLK_SEL_FR30 : clk_sel_t := "10";  -- 33 MHz

end package clk_mux_pkg;
