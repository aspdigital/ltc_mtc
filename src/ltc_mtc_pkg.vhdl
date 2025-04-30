-------------------------------------------------------------------------------
-- Title      : Types and constants used by the LTC/MTC conversion design
-- Project    : LTC/MTC conversion
-------------------------------------------------------------------------------
-- File       : ltc_mtc_pkg.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-08
-- Last update: 2025-04-28
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

    ---------------------------------------------------------------------------------------------------------
    -- Convert the MTC frame rate field (from the hours most-significant nybble) to the frame rate type.
    ---------------------------------------------------------------------------------------------------------
    function mtc_fr_to_frame_rate_t (
        constant ARG : std_logic_vector(1 downto 0))
        return frame_rate_t;

    ---------------------------------------------------------------------------------------------------------
    -- overload the modulo operator using frame_rate_t as a divisor
    ---------------------------------------------------------------------------------------------------------
    function "mod" (
        constant DIVIDEND : natural;
        constant DIVISOR  : frame_rate_t)
        return natural;

    ---------------------------------------------------------------------------------------------------------
    -- Overload the / operator using frame_rate_t as a divisor
    ---------------------------------------------------------------------------------------------------------
    function "/" (
        constant DIVIDEND : natural;
        constant DIVISOR : frame_rate_t)
        return natural;

end package ltc_mtc_pkg;

package body ltc_mtc_pkg is

    ---------------------------------------------------------------------------------------------------------
    -- Convert the MTC frame rate field (from the hours most-significant nybble) to the frame rate type.
    ---------------------------------------------------------------------------------------------------------
    function mtc_fr_to_frame_rate_t (
        constant ARG : std_logic_vector(1 downto 0))
        return frame_rate_t is
    begin
        return frame_rate_t'val(to_integer(unsigned(ARG)));
    end function mtc_fr_to_frame_rate_t;

    ---------------------------------------------------------------------------------------------------------
    -- overload the modulo function using frame_rate_t as a divisor
    ---------------------------------------------------------------------------------------------------------
    function "mod" (
        constant DIVIDEND : natural;
        constant DIVISOR  : frame_rate_t)
        return natural is
    begin
        divide_by: case DIVISOR is
            when FR_24 =>
                return DIVIDEND mod 24;
            when FR_25 =>
                return DIVIDEND mod 25;
            when FR_30 =>
                return DIVIDEND mod 30;
            when others =>
                report "Invalid divisor in overloaded mod" severity ERROR;
        end case divide_by;
    end function "mod";

    ---------------------------------------------------------------------------------------------------------
    -- Overload the / operator using frame_rate_t as a divisor
    ---------------------------------------------------------------------------------------------------------
    function "/" (
        constant DIVIDEND : natural;
        constant DIVISOR : frame_rate_t)
        return natural is
    begin
        divide_by: case DIVISOR is
            when FR_24 =>
                return DIVIDEND / 24;
            when FR_25 =>
                return DIVIDEND / 25;
            when FR_30 =>
                return DIVIDEND / 30;
            when others =>
                report "Invalid divisor in overloaded div" severity ERROR;
        end case divide_by;
    end function "/";

end package body ltc_mtc_pkg;
