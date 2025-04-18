-------------------------------------------------------------------------------
-- Title      : MIDI Time Code Decoder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mtc_decoder.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-14
-- Last update: 2025-04-14
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: This entity implements a MIDI Time Code Receiver/Decoder.
--
-- We capture incoming time code message bytes and keep track of them. When an entire time code is received,
-- it is made available to the display.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-14  -        andy	Created
-------------------------------------------------------------------------------

