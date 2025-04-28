-------------------------------------------------------------------------------
-- Title      : Testbench for design "uatx_with_fifo"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : uatx_with_fifo_tb.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-13
-- Last update: 2025-04-27
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-13  -        andy    Created
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
    constant SYSCLKPER : time    := 10 NS;           -- system clock period, for UATX baud rate generator
    constant BAUD_RATE : natural := 31250;           -- what it is
    constant SRCCLKPER : time    := 1 SEC / 33.0e6;  -- 33 MHz

    signal arst_l : std_logic := '0';

    -- component ports
    signal clk_src     : std_logic := '1';              -- clock for the FIFO input
    signal rst_src     : std_logic;                     -- reset in that domain
    signal tx_data     : std_logic_vector(7 downto 0);  -- data to send
    signal tx_valid    : std_logic;                     -- write din to the FIFO
    signal full        : std_logic;                     -- indicate FIFO is full
    signal almost_full : std_logic;                     -- indicate FIFO has one more word left
    signal clk_main    : std_logic := '1';              -- global clock which drives serializer
    signal rst_main    : std_logic;                     -- reset in that domain
    signal ser_tx      : std_logic;                     -- serial data transmit line

    -- send messages every quarter frame, given a frame rate of 30 fps.
    constant INTERVAL : time := 1 SEC / (30 * 4);

begin  -- architecture testbench

    -- component instantiation
    DUT : entity work.uatx_with_fifo(wrapper)
        generic map (
            SYSCLKPER => SYSCLKPER,      -- system clock period, for UATX baud rate generator
            BAUD_RATE => BAUD_RATE)      -- what it is
        port map (
            clk_src     => clk_src,      -- clock for the FIFO input
            rst_src     => rst_src,      -- reset in that domain
            tx_data     => tx_data,      -- data to send
            tx_valid    => tx_valid,     -- write din to the FIFO
            full        => full,         -- indicate FIFO is full
            almost_full => almost_full,  -- indicate FIFO has one more word left
            clk_main    => clk_main,     -- global clock which drives serializer
            rst_main    => rst_main,     -- reset in that domain
            ser_tx      => ser_tx);      -- serial data transmit line

    ---------------------------------------------------------------------------------------------------------
    -- Clock and reset
    ---------------------------------------------------------------------------------------------------------
    clk_src  <= not clk_src  after SRCCLKPER / 2;
    clk_main <= not clk_main after SYSCLKPER / 2;
    arst_l   <= '1'          after 666 NS;

    -- reset in the "main" clock domain.
    main_reset_sync : entity work.reset_sync(synchronizer)
        generic map (
            ASYNC_ACTIVE => '0')
        port map (
            clk  => clk_main,
            arst => arst_l,
            srst => rst_main);

    -- reset in the "source" clock domain.
    src_reset_sync : entity work.reset_sync(synchronizer)
        generic map (
            ASYNC_ACTIVE => '0')
        port map (
            clk  => clk_src,
            arst => arst_l,
            srst => rst_src);

    ---------------------------------------------------------------------------------------------------------
    -- Main test.
    ---------------------------------------------------------------------------------------------------------
    MainTest : process is
        variable v_cnt : natural range 0 to 255;
    begin  -- process MainTest
        WaitForResetEnd : if arst_l = '0' then
            v_cnt    := 10;
            tx_valid <= '0';
            tx_data  <= (others => '0');
            wait until rst_main = '0' and rst_src = '0';
            wait for 10 US;
        end if WaitForResetEnd;

        Forever : while TRUE loop
            wait for INTERVAL;
            wait until rising_edge(clk_src);
            tx_data  <= std_logic_vector(to_unsigned(v_cnt, tx_data'length));
            tx_valid <= '1';
            v_cnt    := (v_cnt + 1) mod 256;
            wait until rising_edge(clk_src);
            tx_data  <= std_logic_vector(to_unsigned(v_cnt, tx_data'length));
            v_cnt    := (v_cnt + 1) mod 256;
            wait until rising_edge(clk_src);
            tx_valid <= '0';
        end loop Forever;

    end process MainTest;

end architecture testbench;
