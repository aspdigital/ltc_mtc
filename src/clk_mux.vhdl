-------------------------------------------------------------------------------
-- Title      : Specialist clock multiplexor
-- Project    : 
-------------------------------------------------------------------------------
-- File       : clk_mux.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-04-16
-- Last update: 2025-04-27
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Accepts two select lines and three clock inputs, and based on the select lines outputs the
-- desired clock.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-04-16  -        andy    Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

use work.ltc_mtc_pkg.all;
use work.clk_mux_pkg.all;

entity clk_mux is

    port (
        -- lock status and frame rate are on main clock.
        clk_main    : in  std_logic;     -- domain that manages the select
        rst_main    : in  std_logic;     -- reset in that domain
        mmcm_locked : in  std_logic;     -- all clocks are valid
        frame_rate  : in  frame_rate_t;  -- frame rate determines which clock is output.
        -- input clocks
        clk_bundle  : in  clk_bundle_t;
        -- output clock and reset in its domain.
        clk_out     : out std_logic;     -- resulting clock
        rst_out     : out std_logic);    -- reset in that domain.

end entity clk_mux;

architecture mux of clk_mux is

    -- if frame rate changes, we want to assert the reset in the destination domain.
    signal frame_rate_d : frame_rate_t;

    -- Assert reset in the downstream domain when the MMCM is not locked or if the frame rate has changed.
    -- This will be synced to the downstream clock to drive rst_out.
    signal rst_int : std_logic;

    ---------------------------------------------------------------------------------------------------------
    -- Determine clock mux selects from input frame rate.
    ---------------------------------------------------------------------------------------------------------
    signal clk_sel : clk_sel_t;

    ---------------------------------------------------------------------------------------------------------
    -- Clock muxing, first stage.
    -- output of selected clock 1 or 2:
    ---------------------------------------------------------------------------------------------------------
    signal clk_mux_37_or_50 : std_logic;

    ---------------------------------------------------------------------------------------------------------
    -- convert frame rate to clock bundle index.
    ---------------------------------------------------------------------------------------------------------
    function frame_rate_to_bundle_index (
        constant FR : frame_rate_t)
        return clk_bundle_index_t is
        variable cbi : clk_bundle_index_t;
    begin
        Selector : case FR is
            when FR_24 => cbi := CLK_24FPS;
            when FR_25 => cbi := CLK_25FPS;
            when FR_30 => cbi := CLK_30FPS;
            when others =>
                report "Unsupported frame rate in clk_mux" severity ERROR;
        end case Selector;
        return cbi;
    end function frame_rate_to_bundle_index;

begin  -- architecture mux

    ---------------------------------------------------------------------------------------------------------
    -- If the frame rate changes or if the MMCM is unlocked, assert the reset in the muxed clock domain.
    -- This also asserts the reset when the main domain reset is asserted.
    ---------------------------------------------------------------------------------------------------------
    get_clk_selects : process (clk_main) is
    begin  -- process MakeReset
        if rising_edge(clk_main) then
            if rst_main = '1' then
                clk_sel      <= CLK_SEL_FR24;
                frame_rate_d <= FR_24;
                rst_int      <= '1';
            else
                FrameRateDecoder : case frame_rate is
                    when FR_30 => clk_sel <= CLK_SEL_FR30;  -- need 33 MHz clock
                    when FR_25 => clk_sel <= CLK_SEL_FR25;  -- need 50 MHz clock
                    when FR_24 => clk_sel <= CLK_SEL_FR24;  -- need 37.5 MHz clock
                    when others =>
                        report "30 FPS drop not supported yet (clks_rst)" severity ERROR;
                end case FrameRateDecoder;

                -- look for change in frame rate, or MMCM unlock, to assert reset in the mux domain.
                frame_rate_d <= frame_rate;  -- delay for edge detect
                rst_int      <= '1' when mmcm_locked = '0' or (frame_rate /= frame_rate_d) else '0';
            end if;
        end if;
    end process get_clk_selects;

    ---------------------------------------------------------------------------------------------------------
    -- CLOCK MUXING, to select one of the three clocks on which the timecode generator runs, depending on the
    -- selected frame rate.
    ---------------------------------------------------------------------------------------------------------
    -- select clocks 50 MHz or 37.5 MHz
    -- select etiher 25 fps or 24 fps
    clksel_1_2_bufgmux : BUFGMUX
        port map (
            O  => clk_mux_37_or_50,
            I0 => clk_bundle(frame_rate_to_bundle_index(FR_25)),
            I1 => clk_bundle(frame_rate_to_bundle_index(FR_24)),
            S  => clk_sel(CLK_SEL_37_NOT_50));

    -- select above or 33 MHz (30 fps). This mux output is that downstream timer clock.
    clksel_12_3_bufgctrl : BUFGMUX
        port map (
            O  => clk_out,
            I0 => clk_mux_37_or_50,
            I1 => clk_bundle(frame_rate_to_bundle_index(FR_30)),
            S  => clk_sel(CLK_SEL_33_NOT_OTHERS));

    -- reset in the output domain.
    reset_sync : entity work.reset_sync(synchronizer)
        generic map (
            ASYNC_ACTIVE => '1')
        port map (
            clk  => clk_out,
            arst => rst_int,
            srst => rst_out);

end architecture mux;

