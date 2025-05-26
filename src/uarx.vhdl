-------------------------------------------------------------------------------
-- Title      : Standard serial receiver
-- Project    : 
-------------------------------------------------------------------------------
-- File       : uarx.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-20
-- Last update: 2025-05-25
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: This is a standard universal asynchronous receiver (serial port).
-- Included is the baud rate generator.
--
-- We support 8 data bits, no parity, one stop bit only.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-20  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity uarx is

    generic (
        CLK_PER   : time;               -- logic clock period;
        BAUD_RATE : integer);           -- desired baud rate

    port (
        clk      : in  std_logic;                     -- clock for our logic
        rst      : in  std_logic;                     -- reset in that domain
        ser_rx   : in  std_logic;                     -- asynchronous serial input
        rx_data  : out std_logic_vector(7 downto 0);  -- received data word
        rx_valid : out std_logic);                    -- strobe true with new word

end entity uarx;

architecture deserializer of uarx is

    attribute MARK_DEBUG : string;
    
    -- for baud rate timer.
    constant BIT_TIME      : time    := 1 SEC / BAUD_RATE;
    constant TICKS_PER_BIT : natural := integer (BIT_TIME / CLK_PER);
    subtype br_timer_t is natural range 0 to TICKS_PER_BIT - 1;
    signal br_timer        : br_timer_t;

    -- to detect start bit, we see the first falling edge of the data line then wait half a bit period to see
    -- if we still have the start bit.
    constant HALF_BIT_TIME      : time    := BIT_TIME / 2;
    constant TICKS_PER_HALF_BIT : natural := integer (HALF_BIT_TIME / CLK_PER);

    -- synchronize the incoming serial data bit to our clock.
    signal ser_rx_s : std_logic;
    attribute MARK_DEBUG of ser_rx_s : signal is "TRUE";

    -- the shift register. We shift in LSb first.
    signal sr : std_logic_vector(7 downto 0);
    attribute MARK_DEBUG of sr : signal is "TRUE";

    -- count bits as we shift them.
    signal bc : natural range 0 to 7;

    -- state machine.
    type rx_state_t is (
        RX_IDLE,                        -- wait for start bit leading edge
        RX_START_TEST,                  -- is this a start bit?
        RX_SHIFT,                       -- shift in all bits
        RX_STOP);                       -- test for stop bit and latch output if we see it
    signal rx_state : rx_state_t;
    
    attribute MARK_DEBUG of rx_state : signal is "TRUE";

begin  -- architecture deserializer

    ---------------------------------------------------------------------------------------------------------
    -- Synchronize the serial line to our clock.
    ---------------------------------------------------------------------------------------------------------
    ser_rx_cdc_sync : entity work.cdc_sync(synchronizer)
        generic map (
            t           => std_logic,
            RESET_STATE => '1',         -- serial line idles high
            SYNC_FLOPS  => 3)
        port map (
            clk => clk,
            rst => rst,
            d   => ser_rx,
            q   => ser_rx_s);

    ---------------------------------------------------------------------------------------------------------
    -- Deserializer.
    ---------------------------------------------------------------------------------------------------------
    deserialize_it : process (clk) is
    begin  -- process deserialize_it
        if rising_edge(clk) then
            if rst = '1' then
                sr       <= (others => '1');  -- idles high.
                bc       <= 0;
                rx_data  <= (others => '0');
                rx_valid <= '0';
            else

                -- clear one-shot.
                rx_valid <= '0';

                -- capture bits when the baud rate timer expires.
                baud_rate_timer : if br_timer > 0 then
                    br_timer <= br_timer - 1;
                end if baud_rate_timer;

                Decoder : case rx_state is

                    when RX_IDLE =>
                        -- since the line idles high, we need only look for a low on the line.
                        is_first_falling_edge : if ser_rx_s = '0' then
                            br_timer <= TICKS_PER_HALF_BIT - 1;
                            rx_state <= RX_START_TEST;
                        end if is_first_falling_edge;

                    when RX_START_TEST =>
                        is_middle_of_start : if br_timer = 0 then
                            -- if low it's the start bit, so start shifting.
                            is_start : if ser_rx_s = '0' then
                                rx_state <= RX_SHIFT;
                                br_timer <= TICKS_PER_BIT - 1;
                                bc       <= 7;
                            else
                                -- restart and try again
                                rx_state <= RX_IDLE;
                            end if is_start;
                        end if is_middle_of_start;

                    when RX_SHIFT =>
                        is_middle_of_bit : if br_timer = 0 then
                            -- we shift in LSb first.
                            sr <= ser_rx_s & sr(sr'LEFT downto sr'RIGHT + 1);

                            -- reload the bit period timer, whether we need it or not.
                            br_timer <= TICKS_PER_BIT - 1;

                            -- more bits?
                            is_last_bit : if bc = 0 then
                                -- test for stop bit before declaring victory.
                                rx_state <= RX_STOP;
                            else
                                -- next bit.
                                bc <= bc - 1;
                            end if is_last_bit;
                        end if is_middle_of_bit;

                    when RX_STOP =>
                        -- if we see a valid stop bit, latch the shifted in data into the output and strobe
                        -- the valid. Otherwise, this frame is bad, so drop it on the floor.
                        -- Do we want error signals?
                        is_in_stop_bit : if br_timer = 0 then
                            is_stop_bit : if ser_rx_s = '1' then
                                rx_data  <= sr;
                                rx_valid <= '1';
                            end if is_stop_bit;

                            -- in any case, we are done.
                            rx_state <= RX_IDLE;
                        end if is_in_stop_bit;

                end case Decoder;
            end if;
        end if;
    end process deserialize_it;

end architecture deserializer;
