-------------------------------------------------------------------------------
-- Title      : Serialize and transmit a provided timecode
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ltc_encoder.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-07
-- Last update: 2025-04-07
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Given a time reference tick and a time code packet, serialize that packet into the standard
-- 80-bit frame.
--
-- Bits are coded with biphase mark:
-- 0 = single transition at the start of the bit period
-- 1 = two transitions in a bit period, one at the start, the other half-way through.
--
-- The frame rate is provided, and that determines the bit period.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-07  -        andy	Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;





