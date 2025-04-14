-------------------------------------------------------------------------------
-- Title      : Switch debounce logic
-- Project    : 
-------------------------------------------------------------------------------
-- File       : debounce.vhd
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-13
-- Last update: 2025-04-13
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Debounce a switch.
-- Generics set the debounce time and the active state.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-13  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity debounce is

    generic (
        CLKPER        : time;           -- period of the logic clock
        DEBOUNCE_WAIT : time;           -- when to sample after initial switch change
        ACTIVE_STATE  : std_logic);

    port (
        clk   : in  std_logic;          -- the logic clock to which the switch is synchronized
        rst_l : in  std_logic;          -- reset in that domain
        sw    : in  std_logic;          -- the switch input
        swdb  : out std_logic);         -- debounced switch output

end entity debounce;

architecture swdeb of debounce is

    -- synchronizer
    signal sw_s : std_logic;
    signal sw_d : std_logic;            -- delay for edge detect

    -- capture the "previous" state of the switch, so we can update the output correctly.
    signal sw_prev : std_logic;

    -- convert the debounce wait generic time to an integer for counting.
    constant TICKS_PER_DEBOUNCE : natural := integer(DEBOUNCE_WAIT / CLKPER) - 1;
    subtype debounce_timer_t is natural range 0 to TICKS_PER_DEBOUNCE;
    signal debounce_timer       : debounce_timer_t;

    -- simple state machine that manages debouncing.
    type debounce_state_t is (
        DB_IDLE,                        -- wait for an initial press or release.
        DB_WAIT_TO_TEST);               -- wait for debounce timer to expire, then test.
    signal debounce_state : debounce_state_t;

begin  -- architecture swdeb

    -- First we must synchronize the async switch input to our clock.
    sw_sync : entity work.cdc_sync(synchronizer)
        generic map (
            t           => std_logic,
            RESET_STATE => not ACTIVE_STATE,
            SYNC_FLOPS  => 3)
        port map (
            clk   => clk,
            rst_l => rst_l,
            d     => sw,
            q     => sw_s);

    -- Debounce timer. Basically where there is an edge, latch it, then wait the debounce time. If it's still
    -- the same state, then update the output with that new state.
    Debouncer : process (clk) is
    begin  -- process Debouncer
        if rising_edge(clk) then
            if rst_l = '0' then
                debounce_timer <= 0;                 -- count the debounce time
                sw_d           <= not ACTIVE_STATE;  -- delay for edge detect
                sw_prev        <= not ACTIVE_STATE;  -- state captured after a difference
                swdb           <= not ACTIVE_STATE;
                debounce_state <= DB_IDLE;
                
            else

                -- edge detector delay.
                sw_d <= sw_s;

                -- debounce timer.
                the_timer : if debounce_timer > 0 then
                    debounce_timer <= debounce_timer - 1;
                end if the_timer;

                Decoder : case debounce_state is
                    when DB_IDLE =>
                        -- idle, which means we are not testing an existing press or release.
                        -- any change in the switch state starts the timer.
                        ChangeInSwitch : if sw_s xor sw_d then
                            sw_prev        <= sw_s;  -- save for later compare.
                            debounce_timer <= TICKS_PER_DEBOUNCE - 1;
                            debounce_state <= DB_WAIT_TO_TEST;
                        end if ChangeInSwitch;

                    when DB_WAIT_TO_TEST =>
                        -- when timer expires, if the current switch state is the same as we stored then the
                        -- state is valid. Update the output and idle.
                        -- If it is different, idle without the update.
                        is_timer_expired : if debounce_timer = 0 then
                            is_match : if sw_s = sw_prev then
                                swdb <= sw_s;
                            end if is_match;

                            debounce_state <= DB_IDLE;

                        end if is_timer_expired;

                end case Decoder;
            end if;
        end if;
    end process Debouncer;

end architecture swdeb;
