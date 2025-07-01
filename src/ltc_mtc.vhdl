-------------------------------------------------------------------------------
-- Title      : Linear Time Code / MIDI Time Code conversion
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ltc_mtc.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-03-30
-- Last update: 2025-06-28
-- Platform   : 
-- Standard   : VHDL'08, Math Packages
-------------------------------------------------------------------------------
-- Description: Convert between Linear Time Code and MIDI Time Codexs
-------------------------------------------------------------------------------
-- Copyright (c) 2025 ASP Digital
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2025-03-30  -        andy    Created
-------------------------------------------------------------------------------
--
-- Linear time code contains:
-- Hour : Minute : Seconds : Frame
--
-- in the format:
-- 01:00:00:00
-- so two digits per.
-- 
-- Frames per second depend on frame rate: 30, 25 or 24 fps.
-- seconds range from 0 to 59
-- minutes range from 0 to 59
-- hours range from 0 to 23
-------------------------------------------------------------------------------------------------------------
-- Switches 1 and 0 combine to select the generated frame rate.
-- Switch 2 selects the source of the time code display (internal or external).
-- Switch 3 selects the external time code source (MTC or LTC)
-------------------------------------------------------------------------------------------------------------
-- PMOD "JA" is used for MIDI time code in and out.
-- JA(1) is MTC in.
-- JA(2) is MTC out
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-- To ensure timing accuracy, the frame rate selection also chooses the frequency of the logic clock used to
-- drive the dividers that generate the time code and the display.
-------------------------------------------------------------------------------------------------------------
-- Note that top-level signal names match the schematic.
-------------------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ltc_mtc_pkg.all;
use work.mtc_pkg.all;
use work.seven_segment_display_pkg.all;
use work.timecode_pkg.all;
use work.clk_mux_pkg.all;

library unisim;
use unisim.vcomponents.all;


entity ltc_mtc is

    generic (
        DEBOUNCE_WAIT : time := 2 MS;
        CLKPER        : time := 10 NS);
    port (
        -- clock source
        CLK100MHZ  : in  std_logic;                     -- oscillator
        -- buttons. All are active-high except for CPU_RESET.
        CPU_RESETN : in  std_logic;                     -- a button labeled reset
        -- BTNC       : in  std_logic;                    -- the "Center" button
        -- BTNU       : in  std_logic;                    -- the "up" button
        -- BTNL       : in  std_logic;                    -- the "left" button
        -- BTNR       : in  std_logic;                    -- the "right" button
        BTND       : in  std_logic;                     -- the "down" button
        -- slide switches.
        SW         : in  std_logic_vector(3 downto 0);  -- 15 downto 0
        -- RGB LEDs. Controls are active low.
        LED16_B    : out std_logic;                     -- blue
        LED16_G    : out std_logic;                    -- green
        LED16_R    : out std_logic;                    -- red
        LED17_B    : out std_logic;                    -- blue
        LED17_G    : out std_logic;                    -- red
        LED17_R    : out std_logic;                    -- green
        -- discrete LEDs. These are active high.
        LED        : out std_logic_vector(15 downto 0);
        -- 7-segment display. The controls are active low.
        CA         : out std_logic;                     -- common "A" segment
        CB         : out std_logic;                     -- common "B" segment
        CC         : out std_logic;                     -- common "C" segment
        CD         : out std_logic;                     -- common "D" segment
        CE         : out std_logic;                     -- common "E" segment
        CF         : out std_logic;                     -- common "F" segment
        CG         : out std_logic;                     -- common "G" segment
        DP         : out std_logic;                     -- common decimal point
        AN         : out std_logic_vector(7 downto 0);  -- anodes for each segment
        -- PMOD
        JA1        : in  std_logic;                     -- JA(1) is MTC in
        JA2        : out std_logic;                     -- JA(2) is MTC out
        JA3        : out std_logic;                     -- JA(3) is MTC new frame time
        JC7        : out std_logic;     -- I2S ADC MCLK
        JC8        : out std_logic;     -- I2S ADC LRCLK
        JC9        : out std_logic;     -- I2S ADC SCLK
        JC10       : in  std_logic;     -- I2S ADC data
        -- Linear time code output on the audio PWM pin.
        AUD_PWM    : out std_logic;                     -- PWM signal path through to low-pass filter
        AUD_SD     : out std_logic                      -- active low shutdown, bring high to enable PWM
        );

end entity ltc_mtc;

architecture toplevel of ltc_mtc is

    attribute MARK_DEBUG : string;

    ---------------------------------------------------------------------------------------------------------
    -- Clocking and resets.
    ---------------------------------------------------------------------------------------------------------
    -- system clock, and a reset in its domain.
    -- This clock handles input synchronization, display refresh timing and the timer frequency selection.
    -- Basically the input clock is buffered in clks_rst and driven right back out to here.
    signal clk_main : std_logic;
    signal rst_main : std_logic;

    -- clock for the time code generation and display. This clock runs at one of three frequencies, depending
    -- on the selected frame rate. The frequencies are integer multiples of the frame rate so we maintain
    -- accuracy.
    signal clk_timer : std_logic;
    signal rst_timer : std_logic;

    -- bundle of the MMCM outputs.
    signal clk_bundle : clk_bundle_t;

    -- MMCM lock status, for generating resets.
    signal mmcm_locked : std_logic;

    -- audio clocks.
    signal clk_audio : std_logic;       -- at modulator rate, 38.4 MHz for 100 kHz sampling
    signal rst_audio : std_logic;       -- reset in that domain
    signal sclk_audio : std_logic;      -- I2S shift register clock
    signal lrclk_audio : std_logic;     -- I2S LRCLK at sample rate

    ---------------------------------------------------------------------------------------------------------
    -- The periods of the three clocks that divide nicely into the three frame rates.
    -- These are used to ensure that the display update rate is consistent.
    ---------------------------------------------------------------------------------------------------------
    constant CLKPER_30FPS : time := 30.3030 NS;  -- 33 MHz
    constant CLKPER_25FPS : time := 20 NS;       -- 50 MHz
    constant CLKPER_24FPS : time := 26.6667 NS;  -- 37.5 MHz

    ---------------------------------------------------------------------------------------------------------
    -- Switches and buttons.
    ---------------------------------------------------------------------------------------------------------
    -- first we synchronize all slide switches to the main clock and debounce them.
    signal sw_db : std_logic_vector(SW'range);

    -- We use two of the 16 switches to select the frame rate. The state of the switches is synchronized to
    -- the main clock, and this codes the frame rate and chooses which timer frequency drives the time code
    -- generator. 
    alias frsw : std_logic_vector(1 downto 0) is sw_db(1 downto 0);

    -- switch two selects the time code display source (internal = 0, external = 1)
    alias tc_display_src : std_logic is sw_db(2);

    -- switch three select which external time code source drives the display.
    alias tc_ext_src : std_logic is sw_db(3);

    ---------------------------------------------------------------------------------------------------------
    -- Generated time code and frame rate.
    ---------------------------------------------------------------------------------------------------------
    signal gen_frame_time : frame_time_t;
    signal gen_frame_rate : frame_rate_t;
    
    ---------------------------------------------------------------------------------------------------------
    -- Display the timecode.
    ---------------------------------------------------------------------------------------------------------
    signal display : display_t;         -- record with all LED segments.

    ---------------------------------------------------------------------------------------------------------
    -- MTC receiver. This runs on the main clock.
    ---------------------------------------------------------------------------------------------------------
    signal mtcd_frame_time     : mtc_pkt_t;
    signal mtcd_new_frame_time : std_logic;
    attribute MARK_DEBUG of mtcd_frame_time : signal is "TRUE";
    attribute MARK_DEBUG of mtcd_new_frame_time : signal is "TRUE";

    ---------------------------------------------------------------------------------------------------------
    -- lTC receiver, also on the main clock.
    ---------------------------------------------------------------------------------------------------------
    -- determines which clock to use for the display, if display is showing received linear time code.
    signal ltcd_frame_rate     : frame_rate_t := FR_24;
    -- received frame time, and data valid strobe.
    signal ltcd_frame_time     : frame_time_t := FRAME_TIME_RESET;
    signal ltcd_new_frame_time : std_logic := '0';
    signal ltcd_locked         : std_logic;
    signal ltcd_los            : std_logic;
    
begin  -- architecture toplevel

    ---------------------------------------------------------------------------------------------------------
    -- Enable the PWM filters.
    ---------------------------------------------------------------------------------------------------------
    AUD_SD <= '1';

    ---------------------------------------------------------------------------------------------------------
    -- Clocking.
    -- Take in the 100 MHz board oscillator and based on the selected frame rate, output a timer frequency
    -- that is an integer when divided to that frame rate. The frequencies chosen are allowed by the MMCM, so
    -- they're not entirely random.
    ---------------------------------------------------------------------------------------------------------
    clks_rst_inst : entity work.clks_rst(clkgen)
        port map (
            -- from theboard.
            clk_ref     => CLK100MHZ,
            arst_l      => CPU_RESETN,
            -- to other things that need to select a clock.
            clk_bundle  => clk_bundle,
            mmcm_locked => mmcm_locked,
            -- for non-frame-rate related logic, runs all the time.
            clk_main    => clk_main,
            rst_main    => rst_main,
            -- I2S audio clocks
            rst_audio   => rst_audio,
            clk_audio   => clk_audio,
            sclk_audio  => sclk_audio,
            lrclk_audio => lrclk_audio);

    -- forward the modulator clock out.
    i2s_mclk_forward : ODDR
        generic map(
            DDR_CLK_EDGE => "OPPOSITE_EDGE",  -- "OPPOSITE_EDGE" or "SAME_EDGE"
            INIT         => '0',              -- Initial value for Q port ('1' or '0')
            SRTYPE       => "SYNC")           -- Reset Type ("ASYNC" or "SYNC")
        port map (
            Q  => JC7,                        -- 1-bit DDR output
            C  => clk_audio,                  -- 1-bit clock input
            CE => '1',                        -- 1-bit clock enable input
            D1 => '1',                        -- 1-bit data input (positive edge)
            D2 => '0',                        -- 1-bit data input (negative edge)
            R  => rst_audio,                  -- 1-bit reset input
            S  => '0');                       -- 1-bit set input

    -- other clocks follow.
    JC8 <= lrclk_audio;
    JC9 <= sclk_audio;

    ---------------------------------------------------------------------------------------------------------
    -- Debounce the slide switches.
    ---------------------------------------------------------------------------------------------------------
    debounce_all_switches : for swx in SW'range generate
        sw_debounce : entity work.debounce(swdeb)
            generic map (
                CLKPER        => CLKPER,
                DEBOUNCE_WAIT => DEBOUNCE_WAIT,
                ACTIVE_STATE  => '1')
            port map (
                clk  => clk_main,
                rst  => rst_main,
                sw   => SW(swx),
                swdb => sw_db(swx));
    end generate debounce_all_switches;

    ---------------------------------------------------------------------------------------------------------
    -- This is the time code generator.
    ---------------------------------------------------------------------------------------------------------
    tc_gen : entity work.tc_generator(tcgen)
        generic map (
            CLK_MAIN_PER  => CLKPER,
            DEBOUNCE_WAIT => DEBOUNCE_WAIT,
            DEBOUNCE_CLK_PER => CLKPER_25FPS)
        port map (
            clk_main       => clk_main,
            rst_main       => rst_main,
            clk_bundle     => clk_bundle,
            mmcm_locked    => mmcm_locked,
            frsw           => frsw,
            do_full_frame  => BTND,
            -- time code in both formats.
            ltc            => AUD_PWM,
            mtc            => JA2,
            gen_frame_rate => gen_frame_rate,
            gen_frame_time => gen_frame_time);

    ---------------------------------------------------------------------------------------------------------
    -- DISPLAY THE FRAME TIME.
    ---------------------------------------------------------------------------------------------------------
    the_display_mux : entity work.display_mux(mux)
        generic map (
            CLKPER_30FPS => CLKPER_30FPS,
            CLKPER_25FPS => CLKPER_25FPS,
            CLKPER_24FPS => CLKPER_24FPS)
        port map (
            -- main clock domain
            clk_main            => clk_main,
            rst_main            => rst_main,
            -- the three timer clock options, and the MMCM status.
            mmcm_locked         => mmcm_locked,
            clk_bundle          => clk_bundle,
            -- from the switches that choose what to display.
            tc_display_src      => tc_display_src,  -- '0' = internal, '1' = external
            tc_ext_src          => tc_ext_src,      -- '0' = MTC, '1' = LTC
            -- possible frame times to display.
            -- the frame time generated internally (and driven out on MTC and LTC pins)
            gen_frame_time      => gen_frame_time,
            gen_frame_rate      => gen_frame_rate,
            -- decoded frame time from the MIDI in
            mtcd_frame_time     => mtcd_frame_time,
            mtcd_new_frame_time => mtcd_new_frame_time,
            -- decoded frame time from the LTC in.
            ltcd_frame_time     => ltcd_frame_time,
            ltcd_frame_rate     => ltcd_frame_rate,
            ltcd_new_frame_time => ltcd_new_frame_time,
            -- drive the display.
            display             => display);
    
    -- break out display type to pins.
    CA <= display.CA;
    CB <= display.CB;
    CC <= display.CC;
    CD <= display.CD;
    CE <= display.CE;
    CF <= display.CF;
    CG <= display.CG;
    DP <= display.DP;
    AN <= display.AN;

    ---------------------------------------------------------------------------------------------------------
    -- MTC decoder. 
    ---------------------------------------------------------------------------------------------------------

    decoder_mtc : entity work.mtc_decoder(decoder)
        generic map (
            CLK_PER   => CLKPER)
        port map (
            midi_rx        => JA1,
            clk_main       => clk_main,
            rst_main       => rst_main,
            frame_time     => mtcd_frame_time,
            new_frame_time => mtcd_new_frame_time);

    ---------------------------------------------------------------------------------------------------------
    -- LTC Decoder
    ---------------------------------------------------------------------------------------------------------
    decoder_ltc: entity work.ltc_decoder
        port map (
            clk_audio           => clk_audio,
            rst_audio           => rst_audio,
            sclk_audio          => sclk_audio,
            lrclk_audio         => lrclk_audio,
            data_audio          => JC10,
            ltcd_frame_rate     => ltcd_frame_rate,
            ltcd_frame_time     => ltcd_frame_time,
            ltcd_new_frame_time => ltcd_new_frame_time,
            ltcd_locked         => JA3,
            ltcd_los            => ltcd_los);

    ltcd_los_LEDs: process (clk_audio) is
    begin  -- process ltcd_los_LEDs
        if rising_edge(clk_audio) then
            if rst_audio = '1' then
                LED16_R <= '0';
                LED16_G <= '0';
                LED(0)  <= '0';
                LED17_R <= '0';
                LED17_G <= '0';
                LED17_B <= '0';
            else
                LED16_R <= ltcd_los;
                LED16_G <= not ltcd_los;
                LED(0)  <= ltcd_locked;
                LED17_R <= '0';
                LED17_G <= '0';
                LED17_B <= '0';
                display_ltc_frame_rate: case ltcd_frame_rate is
                    when FR_24 =>
                        LED17_R <= '1';
                    when FR_25 =>
                        LED17_G <= '1';
                    when FR_30 =>
                        LED17_B <= '1';
                    when others =>
                        null;
                end case display_ltc_frame_rate;
            end if;
        end if;
    end process ltcd_los_LEDs;

    LED(15 downto 1) <= (others => '0');
    
end architecture toplevel;
