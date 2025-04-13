-------------------------------------------------------------------------------
-- Title      : Package that supports MIDI time code
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mtc_pkg.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-12
-- Last update: 2025-04-12
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-12  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package mtc_pkg is

    -- define a quarter-frame packet.
    subtype qframe_id_t is natural range 0 to 7;  -- which of the eight quarter frames?

    type qframe_pkt_t is record
        id   : qframe_id_t;             -- which quarter frame is this?
        tick : std_logic;               -- strobe true every quarter frame
    end record qframe_pkt_t;


end package mtc_pkg;
