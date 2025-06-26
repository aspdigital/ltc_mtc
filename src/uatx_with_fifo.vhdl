-------------------------------------------------------------------------------
-- Title      : This combines a serial transmitter with an input FIFO.
-- Project    : 
-------------------------------------------------------------------------------
-- File       : uart_with_fifo.vhd
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-13
-- Last update: 2025-06-25
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description:
-- This entity is a Universal Asynchronous Serial Transmitter with a shallow input FIFO.
-- We allow for the data source clock to be asynchronous to the UART clock.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-13  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity uatx_with_fifo is
    generic (
        SYSCLKPER : time;                                -- system clock period, for UATX baud rate generator
        BAUD_RATE : natural);                            -- what it is
    port (
        -- write side:
        clk_src     : in  std_logic;                     -- clock for the FIFO input
        tx_data     : in  std_logic_vector(7 downto 0);  -- data to send
        tx_valid    : in  std_logic;                     -- write din to the FIFO
        -- UATX side
        clk_main    : in  std_logic;                     -- global clock which drives serializer
        rst_main    : in  std_logic;                     -- reset in that domain
        ser_tx      : out std_logic);                    -- serial data transmit line

end entity uatx_with_fifo;

architecture wrapper of uatx_with_fifo is

    -- between the FIFO and the UATX.
    signal data_f_to_uatx  : std_logic_vector(tx_data'range);  -- data from FIFO.
    signal fifo_valid      : std_logic;      -- what we read is valid
    signal fifo_empty      : std_logic;   -- there is nothing in the FIFO.
    signal fifo_rd_tx_wren : std_logic;         -- write to the serializer

    -- UATX status.
    signal busy : std_logic;            -- serialization in process

    ---------------------------------------------------------------------------------------------------------
    -- FIFO.
    ---------------------------------------------------------------------------------------------------------
    component uart_fifo
        port (
            wr_clk : in  std_logic;
            rd_clk : in  std_logic;
            din    : in  std_logic_vector(7 downto 0);
            wr_en  : in  std_logic;
            rd_en  : in  std_logic;
            dout   : out std_logic_vector(7 downto 0);
            full   : out std_logic;
            empty  : out std_logic;
            valid  : out std_logic
            );
    end component uart_fifo;


begin  -- architecture wrapper

    ---------------------------------------------------------------------------------------------------------
    -- This FIFO holds incoming message bytes. It is deep enough (16 bytes) to hold a Full Message. In
    -- general, it'll have either one or two words in at at a time.
    -- The outside world writes to this directly.
    -- Logic here handles reading the FIFO and loading the shift register.
    --
    -- FIFO is FWFT so read data are valid when the valid flag is true.
    -- Remember there is a clock of latency between the UAT write and its assertion of busy.
    ---------------------------------------------------------------------------------------------------------

    ufifo : uart_fifo
        port map (
            wr_clk => clk_src,
            rd_clk => clk_main,
            din    => tx_data,          -- we want to write this to the UATX
            wr_en  => tx_valid,         -- the above is valid
            rd_en  => fifo_rd_tx_wren,
            dout   => data_f_to_uatx,   -- give to transmitter
            full   => open,
            empty  => open,
            valid  => fifo_valid);

    pop_and_write: process (clk_main) is
    begin  -- process pop_and_write
        if rising_edge(clk_main) then
            if rst_main = '1' then
                fifo_rd_tx_wren <= '0';
            else
                popper: if fifo_valid and not busy and not fifo_rd_tx_wren then
                    fifo_rd_tx_wren <= '1';
                else
                    fifo_rd_tx_wren <= '0';
                end if popper;
                
            end if;
        end if;
    end process pop_and_write;

    ---------------------------------------------------------------------------------------------------------
    -- The serializer/transmitter
    ---------------------------------------------------------------------------------------------------------
    tx_serializer : entity work.uatx(serializer)
        generic map (
            SYSCLKPER => SYSCLKPER,     -- system clock period
            BAUD_RATE => BAUD_RATE)     -- desired baud rate
        port map (
            clk     => clk_main,        -- logic clock
            rst     => rst_main,        -- reset in that domain
            tx_data => data_f_to_uatx,  -- parallel data to transmit
            tx_wren => fifo_rd_tx_wren,
            busy    => busy,
            ser_tx  => ser_tx);         -- serial data line

end architecture wrapper;
