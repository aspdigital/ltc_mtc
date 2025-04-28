-------------------------------------------------------------------------------
-- Title      : Testbench for design "uarx"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : uarx_tb.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-20
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
-- 2025-04-20  -        andy    Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uarx_tb is
end entity uarx_tb;

architecture testbench of uarx_tb is

    -- component generics
    constant CLK_PER   : time    := 10 NS;
    constant BAUD_RATE : integer := 31250;  -- standard MIDI rate

    signal tb_arst_l : std_logic := '0';  -- async reset

    -- component ports
    signal clk      : std_logic := '1';
    signal rst      : std_logic := '1';
    signal ser_rx   : std_logic;
    signal rx_data  : std_logic_vector(7 downto 0);
    signal rx_valid : std_logic;

    -- latched result.
    signal tb_rx_data : std_logic_vector(7 downto 0);

    -- test bench transmitter.
    constant TB_BIT_TIME : time := 1 SEC / BAUD_RATE;
    signal tx_word       : std_logic_vector(9 downto 0);
    alias sent_word      : std_logic_vector(7 downto 0) is tx_word(8 downto 1);

    -- control clock, when it stops, sim ends.
    signal running : boolean := TRUE;

begin  -- architecture testbench

    -- component instantiation
    DUT : entity work.uarx
        generic map (
            CLK_PER   => CLK_PER,
            BAUD_RATE => BAUD_RATE)
        port map (
            clk      => clk,
            rst      => rst,
            ser_rx   => ser_rx,
            rx_data  => rx_data,
            rx_valid => rx_valid);

    -- clock generation
    clk       <= not clk after CLK_PER / 2 when running else '0';
    tb_arst_l <= '1'     after 666 NS;

    main_reset_sync : entity work.reset_sync(synchronizer)
        generic map (
            ASYNC_ACTIVE => '0')
        port map (
            clk  => clk,
            arst => tb_arst_l,
            srst => rst);

    -- Sender.
    send_test_data : process is
    begin  -- process send_test_data

        is_in_reset : if rst /= '0' then
            wait until rst = '0';
            wait for 10 US;
        end if is_in_reset;

        send_words : for w in 0 to 100 loop
            -- load shifter, with start bit at front and stop bit at end
            tx_word <= '1' & std_logic_vector(to_unsigned(w, 8)) & '0';
            send_bits : for b in 0 to 9 loop
                wait for TB_BIT_TIME;
                ser_rx <= tx_word(b);
            end loop send_bits;

            wait until rising_edge(clk) and rx_valid = '1';
            tb_rx_data <= rx_data;
            assert rx_data = sent_word report "Receive word did not match transmitted word" severity ERROR;

        end loop send_words;

        wait for 100 US;

        running <= FALSE;
        wait;

    end process send_test_data;

end architecture testbench;
