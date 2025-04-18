-------------------------------------------------------------------------------
-- Title      : Clock multiplexor defines
-- Project    : 
-------------------------------------------------------------------------------
-- File       : clk_mux_pkg.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-16
-- Last update: 2025-04-16
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
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
