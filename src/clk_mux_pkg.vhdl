-------------------------------------------------------------------------------
-- Title      : Clock multiplexor defines
-- Project    : 
-------------------------------------------------------------------------------
-- File       : clk_mux_pkg.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-16
-- Last update: 2025-05-13
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
    
end package clk_mux_pkg;
