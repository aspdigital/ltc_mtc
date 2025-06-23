-------------------------------------------------------------------------------
-- Title      : Define a few useful array types, to extend what VHDL-2008 supports.
-- Project    : General-use package
-------------------------------------------------------------------------------
-- File       : vector_array_types_pkg.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2023-04-18
-- Last update: 2023-04-18
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: VHDL-2008 added a handful of array types:
-- 
-- type boolean_vector is array (natural range <>) of boolean
-- type integer_vector is array (natural range <>) of integer
-- type real_vector is array (natural range <>) of real
-- type time_vector is array (natural range <>) of time
--
-- These are useful indeed, but there are occasions when arrays of the usual vector types would be very
-- handy. This package defines a few such types.
-------------------------------------------------------------------------------
-- Copyright (c) 2023 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2023-04-18  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package vector_array_types_pkg is

    type slv_array_t is array (natural range <>) of std_logic_vector;
    type sulv_array_t is array (natural range <>) of std_ulogic_vector;
    type unsigned_array_y is array (natural range <>) of unsigned;
    type signed_array_t is array (natural range <>) of signed;

end package vector_array_types_pkg;
