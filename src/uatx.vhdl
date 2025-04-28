-------------------------------------------------------------------------------
-- Title      : Serial Transmitter (half of UART)
-- Project    : 
-------------------------------------------------------------------------------
-- File       : uatx.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-13
-- Last update: 2025-04-27
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: This is the standard universal asynchronous transmitter serial port. It includes a baud rate
-- generator and a shallow  input FIFO.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-13  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity uatx is

    generic (
        SYSCLKPER : time;               -- system clock period
        BAUD_RATE : integer);           -- desired baud rate

    port (
        clk     : in  std_logic;                     -- logic clock
        rst     : in  std_logic;                     -- reset in that domain
        tx_data : in  std_logic_vector(7 downto 0);  -- parallel data to transmit
        tx_wren : in  std_logic;                     -- transmit data write enable
        busy    : out std_logic := '0';
        ser_tx  : out std_logic);                    -- serial data line

end entity uatx;

architecture serializer of uatx is

    -- for baud rate timer.
    constant BIT_TIME      : time    := 1 SEC / BAUD_RATE;
    constant TICKS_PER_BIT : natural := integer(BIT_TIME / SYSCLKPER);
    subtype br_timer_t is natural range 0 to TICKS_PER_BIT - 1;
    signal br_timer        : br_timer_t;

    -- the shift register.
    -- we shift LSb first.
    signal sr : std_logic_vector(9 downto 0);

    -- count bits as we shift them.
    signal bc : natural range 0 to 9;

    -- simple control machine.
    type tx_state_t is (TX_IDLE, TX_SHIFT);
    signal tx_state : tx_state_t;

begin  -- architecture serializer

    shift_it : process (clk) is
    begin  -- process shift_it
        if rising_edge(clk) then
            if rst = '1' then
                br_timer <= 0;
                sr       <= (others => '1');  -- idle high
                bc       <= 0;
                busy     <= '0';
                ser_tx   <= '1';              -- idle high
            else

                -- bit time timer.
                time_each_bit : if br_timer > 0 then
                    br_timer <= br_timer - 1;
                end if time_each_bit;

                Decoder : case tx_state is
                    when TX_IDLE =>
                        bc   <= 0;
                        busy <= '0';

                        if tx_wren = '1' then
                            sr       <= '1' & tx_data & '0';  -- include stop and start bits
                            busy     <= '1';
                            br_timer <= TICKS_PER_BIT - 1;
                            tx_state <= TX_SHIFT;
                        end if;

                    when TX_SHIFT =>
                        end_of_bit : if br_timer = 0 then

                            sr <= '1' & sr(sr'LEFT downto sr'RIGHT + 1);

                            is_last_bit : if bc = 9 then
                                tx_state <= TX_IDLE;
                            else
                                br_timer <= TICKS_PER_BIT - 1;
                                bc       <= bc + 1;
                            end if is_last_bit;

                        end if end_of_bit;
                end case Decoder;


                -- serial output always follows lsb.
                ser_tx <= sr(0);
            end if;
        end if;
    end process shift_it;

end architecture serializer;
