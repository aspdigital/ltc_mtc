-------------------------------------------------------------------------------
-- Title      : Sync to the provided clock
-- Project    : 
-------------------------------------------------------------------------------
-- File       : cdc_sync.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-06
-- Last update: 2025-04-06
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-06  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity cdc_sync is

    generic (
        SYNC_FLOPS : natural := 3);     -- number of synchronization stages

    port (
        clk   : in  std_logic;          -- clock to which we sync
        rst_l : in  std_logic;          -- reset in that domain
        d     : in  std_logic;          -- the signal to sync
        q     : out std_logic);         -- synchronized signal

end entity cdc_sync;

architecture synchronizer of cdc_sync is

    signal d_s : std_logic;                                  -- first stage synchronizer
    signal sr  : std_logic_vector(SYNC_FLOPS - 2 downto 0);  -- remaining synchronzier

begin  -- architecture synchronizer

    SyncIt: process (clk) is
    begin  -- process SyncIt
        if rising_edge(clk) then        -- rising clock edge
            if rst_l = '0' then         -- synchronous reset (active low)
                d_s <= '0';
                sr <= (others => '0');
            else
                d_s <= d;
                sr <= sr(sr'LEFT - 1 downto 0) & d_s;
            end if;
        end if;
    end process SyncIt;

    q <= sr(sr'left);

end architecture synchronizer;
