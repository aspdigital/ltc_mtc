-------------------------------------------------------------------------------
-- Title      : Package that supports MIDI time code
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mtc_pkg.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-12
-- Last update: 2025-05-25
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

use work.ltc_mtc_pkg.all;

package mtc_pkg is

    -- define a quarter-frame packet.
    subtype qframe_id_t is natural range 0 to 7;  -- which of the eight quarter frames?

    type qframe_pkt_t is record
        id   : qframe_id_t;             -- which quarter frame is this?
        tick : std_logic;               -- strobe true every quarter frame
    end record qframe_pkt_t;

    -- wrap up MTC into this nice record.
    subtype frames_t is natural range 0 to 29;
    subtype seconds_t is natural range 0 to 59;
    subtype minutes_t is natural range 0 to 59;
    subtype hours_t is natural range 0 to 23;

    type mtc_pkt_t is record
        frames     : frames_t;
        seconds    : seconds_t;
        minutes    : minutes_t;
        hours      : hours_t;
        frame_rate : frame_rate_t;
    end record mtc_pkt_t;

    constant MTC_PKT_RESET : mtc_pkt_t := (
        frames     => 0,
        seconds    => 0,
        minutes    => 0,
        hours      => 0,
        frame_rate => FR_24);

end package mtc_pkg;
