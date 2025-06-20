-------------------------------------------------------------------------------
-- Title      : I2S receiver
-- Project    : 
-------------------------------------------------------------------------------
-- File       : i2s_rx.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-06-02
-- Last update: 2025-06-18
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
    signal lrclk_dd : std_logic;

    -- the shift register.
    signal sr : std_logic_vector(31 downto 0);
    alias this_sample : std_logic_vector(23 downto 0) is sr(sr'LEFT downto sr'LEFT - 24 + 1);
    signal this_left : signed(23 downto 0);

begin  -- architecture i2s_receiver

    shifter : process (clk_audio) is
    begin  -- process shifter
        if rising_edge(clk_audio) then   -- rising clock edge
            if rst_audio = '1' then      -- synchronous reset (active high)
                sclk_d     <= '0';
                lrclk_d    <= '0';
                lrclk_dd   <= '0';
                sr         <= (others => '0');
                data_valid <= '0';
                data_left  <= (others => '0');
                data_right <= (others => '0');
            else
                sclk_d  <= sclk_audio;

                -- always shift on rising edge of sclk.
                shift_in : if sclk_audio = '1' and sclk_d = '0' then
                    sr <= sr(sr'LEFT - 1 downto 0) & data_audio;
                    lrclk_d <= lrclk_audio;
                    lrclk_dd <= lrclk_d;

                    got_both_samples: if lrclk_d = '0' and lrclk_dd = '1' then
                        data_valid <= not data_valid;
                    end if got_both_samples;
                end if shift_in;

                latch_data : if lrclk_d xor lrclk_dd then
                    if lrclk_d = '1' then
                        -- we've just toggled to right, so capture left.
                        this_left <= signed(this_sample);
                    else
                        data_left <= this_left;
                        data_right <= signed(this_sample);
                    end if;
                end if latch_data;

            end if;
        end if;
    end process shifter;

end architecture i2s_receiver;
