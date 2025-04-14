-------------------------------------------------------------------------------
-- Title      : Testbench for design "uatx_with_fifo"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : uatx_with_fifo_tb.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-13
-- Last update: 2025-04-13
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-13  -        andy	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------------------------------------

entity uatx_with_fifo_tb is

end entity uatx_with_fifo_tb;

-------------------------------------------------------------------------------------------------------------

architecture testbench of uatx_with_fifo_tb is

    -- component generics
    constant SYSCLKPER : time := 10 ns;          -- system clock period, for UATX baud rate generator
    constant BAUD_RATE : natural := 31250;       -- what it is
    constant SRCCLKPER : time := 1 SEC / 33.0e6;  -- 33 MHz

    signal arst_l : std_logic := '0';
    
    -- component ports
    signal clksrc      : std_logic := '1';                     -- clock for the FIFO input
    signal rstsrc_l    : std_logic;                     -- reset in that domain
    signal tx_data     : std_logic_vector(7 downto 0);  -- data to send
    signal tx_valid    : std_logic;                     -- write din to the FIFO
    signal full        : std_logic;                     -- indicate FIFO is full
    signal almost_full : std_logic;                     -- indicate FIFO has one more word left
    signal clkmain     : std_logic := '1';                     -- global clock which drives serializer
    signal rstmain_l   : std_logic;                     -- reset in that domain
    signal ser_tx      : std_logic;                     -- serial data transmit line

    -- send messages every quarter frame, given a frame rate of 30 fps.
    constant INTERVAL : time := 1 SEC / (30 * 4);

begin  -- architecture testbench

    -- component instantiation
    DUT: entity work.uatx_with_fifo(wrapper)
        generic map (
            SYSCLKPER => SYSCLKPER,     -- system clock period, for UATX baud rate generator
            BAUD_RATE => BAUD_RATE)     -- what it is
        port map (
            clksrc      => clksrc,       -- clock for the FIFO input
            rstsrc_l    => rstsrc_l,     -- reset in that domain
            tx_data     => tx_data,      -- data to send
            tx_valid    => tx_valid,     -- write din to the FIFO
            full        => full,         -- indicate FIFO is full
            almost_full => almost_full,  -- indicate FIFO has one more word left
            clkmain     => clkmain,      -- global clock which drives serializer
            rstmain_l   => rstmain_l,    -- reset in that domain
            ser_tx      => ser_tx);      -- serial data transmit line

    ---------------------------------------------------------------------------------------------------------
    -- Clock and reset
    ---------------------------------------------------------------------------------------------------------
    clksrc <= not clksrc after SRCCLKPER / 2;
    clkmain <= not clkmain after SYSCLKPER / 2;
    arst_l <= '1' after 666 ns;
    
    -- reset in the "main" clock domain.
    main_reset_sync : entity work.reset_sync(synchronizer)
        port map (
            clk    => clkmain,
            arst_l => arst_l,
            srst_l => rstmain_l);

    -- reset in the "source" clock domain.
    src_reset_sync : entity work.reset_sync(synchronizer)
        port map (
            clk    => clksrc,
            arst_l => arst_l,
            srst_l => rstsrc_l);

    ---------------------------------------------------------------------------------------------------------
    -- Main test.
    ---------------------------------------------------------------------------------------------------------
    MainTest: process is
        variable v_cnt : natural range 0 to 255;
    begin  -- process MainTest
        WaitForResetEnd: if arst_l = '0' then
            v_cnt := 10;
            tx_valid <= '0';
            tx_data  <= (others => '0');
            wait until rstmain_l = '1' and rstsrc_l = '1';
            wait for 10 US;
        end if WaitForResetEnd;

        Forever: while TRUE loop
            wait for INTERVAL;
            wait until rising_edge(clksrc);
            tx_data <= std_logic_vector(to_unsigned(v_cnt, tx_data'length));
            tx_valid <= '1';
            v_cnt := (v_cnt + 1) mod 256;
            wait until rising_edge(clksrc);
            tx_data <= std_logic_vector(to_unsigned(v_cnt, tx_data'length));
            v_cnt := (v_cnt + 1) mod 256;
            wait until rising_edge(clksrc);
            tx_valid <= '0';
        end loop Forever;
        
    end process MainTest;

end architecture testbench;
