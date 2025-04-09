-------------------------------------------------------------------------------
-- Title      : Sync to the provided clock
-- Project    : 
-------------------------------------------------------------------------------
-- File       : cdc_sync.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-06
-- Last update: 2025-04-08
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
        type t;                         -- the thing we are synchronizing
        RESET_STATE : t;                -- what we reset t to
        SYNC_FLOPS : natural := 3);     -- number of synchronization stages

    port (
        clk   : in  std_logic;          -- clock to which we sync
        rst_l : in  std_logic;          -- reset in that domain
        d     : in  t;          -- the signal to sync
        q     : out t);         -- synchronized signal

end entity cdc_sync;

architecture synchronizer of cdc_sync is
    attribute ASYNC_REG : string;
    signal d_s : t;                                  -- first stage synchronizer
    attribute ASYNC_REG of d_s : signal is "TRUE";
    type sr_t is array (SYNC_FLOPS - 1 downto 0) of t;
    signal sr  : sr_t;  -- remaining synchronzier

begin  -- architecture synchronizer

    SyncIt: process (clk) is
    begin  -- process SyncIt
        if rising_edge(clk) then
            if rst_l = '0' then
                d_s <= RESET_STATE;
                sr <= (sr'range => RESET_STATE);
            else
                d_s <= d;
                sr <= sr(sr'LEFT - 1 downto 0) & d_s;
            end if;
        end if;
    end process SyncIt;

    q <= sr(sr'left);

end architecture synchronizer;
