-------------------------------------------------------------------------------
-- Title      : Types and constants used by the LTC/MTC conversion design
-- Project    : LTC/MTC conversion
-------------------------------------------------------------------------------
-- File       : ltc_mtc_pkg.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-08
-- Last update: 2025-04-20
-- Platform   : Xilinx Artix 7
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: This package contains a handful of types, constants and functions that are conveniences for
-- this MTC/LTC conversion design.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-08  -        andy    Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ltc_mtc_pkg is

    ---------------------------------------------------------------------------------------------------------
    -- We support three possible frame rates. 30 drop frame is included but not supported.
    ---------------------------------------------------------------------------------------------------------
    type frame_rate_t is (
        FR_24,  
        FR_25,  
        FR_30DF,
        FR_30);

    -- frame count rollover LSD is set by the frame rate above.
    constant FC_ROLLOVER_LSD_30 : natural := 9;  -- rolls over at 29 for 30 fps
    constant FC_ROLLOVER_LSD_25 : natural := 4;  -- rolls over at 24 for 25 fps
    constant FC_ROLLOVER_LSD_24 : natural := 3;  -- rolls over at 23 for 24 fps

end package ltc_mtc_pkg;

package body ltc_mtc_pkg is


end package body ltc_mtc_pkg;
