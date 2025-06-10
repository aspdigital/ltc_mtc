-------------------------------------------------------------------------------
-- Title      : I2S receiver
-- Project    : 
-------------------------------------------------------------------------------
-- File       : i2s_rx.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-06-02
-- Last update: 2025-06-09
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-06-02  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2s_rx is

    port (
        clk_audio   : in  std_logic;    -- clock at modulator rate
        rst_audio   : in  std_logic;
        sclk_audio  : in  std_logic;    -- shift clock
        lrclk_audio : in  std_logic;    -- L/R clock at sample rate
        data_audio  : in  std_logic;    -- from the converter
        data_valid  : out std_logic;
        data_left   : out signed(23 downto 0);
        data_right  : out signed(23 downto 0));

end entity i2s_rx;

architecture i2s_receiver of i2s_rx is

    -- for edge detect.
    signal sclk_d  : std_logic;
    signal lrclk_d : std_logic;

    -- the shift register.
    signal sr : std_logic_vector(63 downto 0);

begin  -- architecture i2s_receiver

    shifter : process (clk_audio) is
    begin  -- process shifter
        if rising_edge(clk_audio) then   -- rising clock edge
            if rst_audio = '1' then      -- synchronous reset (active high)
                sclk_d     <= '0';
                lrclk_d    <= '0';
                sr         <= (others => '0');
                data_valid <= '0';
                data_left  <= (others => '0');
                data_right <= (others => '0');
            else
                sclk_d  <= sclk_audio;
                lrclk_d <= lrclk_audio;

                -- always shift on rising edge of sclk.
                shift_in : if sclk_audio = '1' and sclk_d = '0' then
                    sr <= sr(sr'LEFT - 1 downto 0) & data_audio;
                end if shift_in;

                -- update outputs on falling edge of LRCLK, which is when the whole frame has shifted in.
                latch_data : if lrclk_audio = '0' and lrclk_d = '1' then
                    data_valid <= '1';
                    data_left  <= signed(sr(62 downto 38));
                    data_right <= signed(sr(30 downto 6));
                else
                    data_valid <= '0';
                end if latch_data;

            end if;
        end if;
    end process shifter;

end architecture i2s_receiver;
