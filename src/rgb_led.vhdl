-------------------------------------------------------------------------------
-- Title      : Demonstrate the RGB LED using an instance of clk_mux.
-- Project    : 
-------------------------------------------------------------------------------
-- File       : rgb_led.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-19
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
-- 2025-04-19  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity rgb_led is
    generic (
        TIMER_MAX : natural := 99999);
    port (
        clk : in  std_logic;
        rst : in  std_logic;
        led : out std_logic);

end entity rgb_led;

architecture led_driver of rgb_led is

    signal timer : natural range 0 to TIMER_MAX - 1;

begin  -- architecture led_driver

    led_on : process (clk) is
    begin  -- process Flop
        if rising_edge(clk) then
            if rst = '1' then
                timer <= 0;
                led   <= '0';
            else
                CountForTimer : if timer = 0 then
                    timer <= TIMER_MAX - 1;
                else
                    timer <= timer - 1;
                end if CountForTimer;

                ToggleLed : if timer = 1 then
                    led <= '1';
                elsif timer = TIMER_MAX / 2 then
                    led <= '0';
                end if ToggleLed;
            end if;
        end if;
    end process led_on;

end architecture led_driver;
