-------------------------------------------------------------------------------
-- Title      : Shim, to cross clock domains.
-- Project    : 
-------------------------------------------------------------------------------
-- File       : tb_shim.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-27
-- Last update: 2025-04-27
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: A simulation "shim" between two clock domain.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-27  -        andy	Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity tb_shim is
    
    port (
        -- push side
        clk_wr   : in std_logic;        -- clock for push data
        rst_wr   : in std_logic;        -- reset in that domain
        wr_data  : in std_logic_vector(7 downto 0);  -- what to push
        wr_valid : in std_logic;        -- strobe to push
        -- pull side
        clk_rd   : in std_logic;        -- clock for pull data
        rst_rd   : in std_logic;        -- reset in that domain
        rd_rdy   : in std_logic;        -- destination can accept
        rd_valid : out std_logic;       -- writes to destination
        rd_data : out std_logic_vector(7 downto 0));  -- what to pull

end entity tb_shim;

architecture simple of tb_shim is

    constant STACK_SIZE : natural := 4;
    subtype stack_ptr_t is natural range 0 to STACK_SIZE - 1;
    type stack_t is array (stack_ptr_t) of std_logic_vector(wr_data'range);
    signal stack : stack_t;

    signal wptr : stack_ptr_t;
    signal rptr : stack_ptr_t;

begin  -- architecture simple

    -- write side push.
    push: process (clk_wr) is
    begin  -- process push
        if rising_edge(clk_wr) then
            if rst_wr = '1' then   
                wptr <= 0;
                stack <= (others => (others => '0'));
            else
                writer: if wr_valid then
                    stack(wptr) <= wr_data;
                    wptr <= (wptr + 1) mod STACK_SIZE;
                end if writer;
            end if;
        end if;
    end process push;

    -- read side pull
    pull: process (clk_rd) is
    begin  -- process pull
        if rising_edge(clk_rd) then 
            if rst_rd = '1' then 
                rptr <= 0;
                rd_valid <= '0';
            else
                reader: if (rd_rdy = '1') and (wptr /= rptr) then
                    rd_valid <= '1';
                    rptr <= (rptr + 1) mod STACK_SIZE;
                end if reader;
            end if;
        end if;
    end process pull;

    -- first word flow through.
    rd_data <= stack(rptr);

end architecture simple;
