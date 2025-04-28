-------------------------------------------------------------------------------
-- Title      : Create a synchronized reset
-- Project    : 
-------------------------------------------------------------------------------
-- File       : reset_sync.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-06
-- Last update: 2025-04-27
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Create a reset whose release is synchronized with the clock.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-06  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity reset_sync is

    generic (
        ASYNC_ACTIVE : std_logic := '0';
        HOLDTIME     : natural   := 15);

    port (
        clk  : in  std_logic;           -- the clock to which we sync the reset
        arst : in  std_logic;           -- asynchronous reset to synchronize
        srst : out std_logic);          -- synchronized reset out

end entity reset_sync;

architecture synchronizer of reset_sync is

begin  -- architecture synchronizer

    ResetSynchronizer : process (clk, arst) is
        variable v_rsthold : natural range 0 to HOLDTIME;
    begin  -- process ResetSynchronizer
        if arst = ASYNC_ACTIVE then
            v_rsthold := HOLDTIME;
            srst      <= '1';
        elsif rising_edge(clk) then
            if v_rsthold > 0 then
                v_rsthold := v_rsthold - 1;
                srst      <= '1';
            else
                srst <= '0';
            end if;
        end if;
    end process ResetSynchronizer;

end architecture synchronizer;
