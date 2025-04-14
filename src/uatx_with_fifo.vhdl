-------------------------------------------------------------------------------
-- Title      : This combines a serial transmitter with an input FIFO.
-- Project    : 
-------------------------------------------------------------------------------
-- File       : uart_with_fifo.vhd
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-13
-- Last update: 2025-04-13
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
-- 2025-04-13  -        andy	Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity uatx_with_fifo is
    generic (
        SYSCLKPER : time;               -- system clock period, for UATX baud rate generator
        BAUD_RATE : natural);           -- what it is
    port (
        -- write side:
        clksrc      : in  std_logic;                     -- clock for the FIFO input
        rstsrc_l    : in  std_logic;                     -- reset in that domain
        tx_data     : in  std_logic_vector(7 downto 0);  -- data to send
        tx_valid    : in  std_logic;                     -- write din to the FIFO
        full        : out std_logic;                     -- indicate FIFO is full
        almost_full : out std_logic;                     -- indicate FIFO has one more word left
        -- UATX side
        clkmain     : in  std_logic;                     -- global clock which drives serializer
        rstmain_l   : in  std_logic;                     -- reset in that domain
        ser_tx      : out std_logic);                    -- serial data transmit line

end entity uatx_with_fifo;

architecture wrapper of uatx_with_fifo is

    -- between the FIFO and the UATX.
    signal data_f_to_uatx : std_logic_vector(tx_data'range);  -- data from FIFO.
    signal fifo_rddata_valid : std_logic;  -- there is something in the FIFO.
    signal pop_and_write : std_logic;   -- pop the FIFO and push its read data to the serializer

    -- UATX status.
    signal busy : std_logic;            -- serialization in process

    -- fifo wants active-high reset.
    signal fiforst : std_logic;
    
    
    ---------------------------------------------------------------------------------------------------------
    -- FIFO.
    ---------------------------------------------------------------------------------------------------------
    component uart_fifo
        port (
            rst          : in  std_logic;
            wr_clk       : in  std_logic;
            rd_clk       : in  std_logic;
            din          : in  std_logic_vector(7 downto 0);
            wr_en        : in  std_logic;
            rd_en        : in  std_logic;
            dout         : out std_logic_vector(7 downto 0);
            full         : out std_logic;
            almost_full  : out std_logic;
            wr_ack       : out std_logic;
            overflow     : out std_logic;
            empty        : out std_logic;
            almost_empty : out std_logic;
            valid        : out std_logic;
            underflow    : out std_logic
            );
    end component uart_fifo;


begin  -- architecture wrapper

    ---------------------------------------------------------------------------------------------------------
    -- This FIFO holds incoming message bytes. It is deep enough (16 bytes) to hold a Full Message. In
    -- general, it'll have either one or two words in at at a time.
    -- The outside world writes to this directly.
    -- Logic here handles reading the FIFO and loading the shift register.
    --
    -- This only has one reset. Drive that with the source reset, as if the source clock changes, the FIFO
    -- will be properly reset. Note that the FIFO requires an active-high reset.
    --
    -- FIFO is FWFT so read data are valid when the valid flag is true. We never do continuous FIFO pops, so
    -- we don't hold the read enable true all the time.
    ---------------------------------------------------------------------------------------------------------
    fiforst <= not rstsrc_l;
    
    ufifo : uart_fifo
        port map (
            rst          => fiforst,
            wr_clk       => clksrc,
            rd_clk       => clkmain,
            din          => tx_data,    -- we want to write this to the UATX
            wr_en        => tx_valid,   -- the above is valid
            rd_en        => pop_and_write,  -- advance FIFO read pointer
            dout         => data_f_to_uatx,  -- give to transmitter
            full         => open,
            almost_full  => open,
            wr_ack       => open,
            overflow     => open,
            empty        => open,
            almost_empty => open,
            valid        => fifo_rddata_valid,
            underflow    => open);

    -- Control writing to the transmitter.
    -- Write when the serializer is not busy and when the FIFO has something in it.
    fifo_rd_tx_wr : process (clkmain) is
    begin  -- process transmitter
        if rising_edge(clkmain) then
            if rstmain_l = '0' then
                pop_and_write <= '0';
            else
                if busy = '0' and fifo_rddata_valid = '1' then
                    pop_and_write <= '1';
                else
                    pop_and_write <= '0';
                end if;
            end if;
        end if;
    end process fifo_rd_tx_wr;

    ---------------------------------------------------------------------------------------------------------
    -- The serializer/transmitter
    ---------------------------------------------------------------------------------------------------------
    tx_serializer : entity work.uatx(serializer)
        generic map (
            SYSCLKPER => SYSCLKPER,     -- system clock period
            BAUD_RATE => BAUD_RATE)     -- desired baud rate
        port map (
            clk      => clkmain,            -- logic clock
            rst_l    => rstmain_l,          -- reset in that domain
            tx_data  => data_f_to_uatx,        -- parallel data to transmit
            tx_wren  => pop_and_write,       -- transmit data write enable
            busy     => busy,
            ser_tx   => ser_tx);        -- serial data line

end architecture wrapper;
