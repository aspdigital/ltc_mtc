-------------------------------------------------------------------------------
-- Title      : Linear Time Code / MIDI Time Code conversion
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ltc_mtc.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-03-30
-- Last update: 2025-05-13
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

library work;
use work.ltc_mtc_pkg.all;
use work.mtc_pkg.all;
use work.seven_segment_display_pkg.all;
use work.timecode_pkg.all;
use work.clk_mux_pkg.all;

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
        -- LED16_G    : out std_logic;                    -- green
        -- LED16_R    : out std_logic;                    -- red
        -- LED17_B    : out std_logic;                    -- blue
        -- LED17_G    : out std_logic;                    -- red
        -- LED17_R    : out std_logic;                    -- green
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
        JA1        : in  std_logic;                     -- JA(2) is MTC in
        JA2        : out std_logic;                     -- JA(2) is MTC out
        JA3        : out std_logic;                     -- frame timer tick test point
        -- Linear time code output on the audio PWM pin.
        AUD_PWM    : out std_logic;                     -- PWM signal path through to low-pass filter
        AUD_SD     : out std_logic                      -- active low shutdown, bring high to enable PWM
        );

end entity ltc_mtc;

architecture toplevel of ltc_mtc is

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

    -- the "down" button is used as the trigger to send a Full Frame message out the MTC port, instead of
    -- sending the usual two-byte timing messages.
    signal do_full_frame : std_logic;

    ---------------------------------------------------------------------------------------------------------
    -- Timing.
    ---------------------------------------------------------------------------------------------------------
    -- The frame rate, as determined by the switches. This drives the tick counter and selects which clock
    -- drives the timers that are divided down to get the current coded time.

    signal frame_rate   : frame_rate_t;
    -- needed on timer clock too
    signal frame_rate_s : frame_rate_t;

    -- The timer clock, frequency as selected by the frame rate switches above, is divided down to generate a
    -- strobe tick at the start of every frame time. This strobe will be at 24, 25 or 30 frames per second.
    signal frame_tick : std_logic;

    -- quarter-frame timer, for MTC.
    signal qframe_pkt : qframe_pkt_t;

    -- This is the time code from the time code generator.
    signal frame_time : frame_time_t;

    ---------------------------------------------------------------------------------------------------------
    -- Display the timecode.
    ---------------------------------------------------------------------------------------------------------
    signal display : display_t;         -- record with all LED segments.

    ---------------------------------------------------------------------------------------------------------
    -- The MIDI baud rate.
    ---------------------------------------------------------------------------------------------------------
    constant MIDI_BAUD_RATE : natural := 31250;

    ---------------------------------------------------------------------------------------------------------
    -- MIDI message from encoder to serial transmit
    ---------------------------------------------------------------------------------------------------------
    signal midi_msg_data  : std_logic_vector(7 downto 0);
    signal midi_msg_valid : std_logic;

    ---------------------------------------------------------------------------------------------------------
    -- MTC receiver. This runs on the main clock.
    ---------------------------------------------------------------------------------------------------------
    -- determines which clock to use for the display, if display is showing received MIDI time clock.
    signal mtcd_frame_rate     : frame_rate_t;
    -- received frame time, and data valid strobe.
    signal mtcd_frame_time     : frame_time_t;
    signal mtcd_new_frame_time : std_logic;

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
            -- switches determine frame timer rate.
            frame_rate  => frame_rate,
            -- to other things that need to select a clock.
            clk_bundle  => clk_bundle,
            mmcm_locked => mmcm_locked,
            -- to the LTC time code generator and frame rate generator.
            clk_timer   => clk_timer,
            rst_timer   => rst_timer,
            -- for non-frame-rate related logic, runs all the time.
            clk_main    => clk_main,
            rst_main    => rst_main);

    ---------------------------------------------------------------------------------------------------------
    -- Debounce the button we use to initiate a Full Frame time message over MIDI.
    -- As this switch is used in the timer clock domain, sync it to that clock.
    ---------------------------------------------------------------------------------------------------------
    ff_sw_debounce : entity work.debounce(swdeb)
        generic map (
            CLKPER        => CLKPER,         -- period of the logic clock
            DEBOUNCE_WAIT => DEBOUNCE_WAIT,  -- when to sample after initial switch change
            ACTIVE_STATE  => '1')
        port map (
            clk  => clk_timer,               -- the logic clock to which the switch is synchronized
            rst  => rst_timer,               -- reset in that domain
            sw   => BTND,                    -- the switch input
            swdb => do_full_frame);          -- debounced switch output

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
    -- Frame rate is set by the state of switches 0 and 1.
    -- After debounce, encode that select into the frame rate type. We do this on the main clock, and not the
    -- timer clock, because the frame rate here is used (in clks_rst) to select the timer clock.
    ---------------------------------------------------------------------------------------------------------
    GetOutputFrameRate : process (clk_main) is
    begin  -- process GetFrameRate
        if rising_edge(clk_main) then
            if rst_main = '1' then
                frame_rate <= FR_30;
            else
                frame_rate <= frame_rate_t'val(to_integer(unsigned(frsw)));
            end if;
        end if;
    end process GetOutputxsFrameRate;

    ---------------------------------------------------------------------------------------------------------
    -- Sync frame rate to the timer clock, as it is needed in that domain.
    -- NB that the timer clock will change if the frame rate changes.
    ---------------------------------------------------------------------------------------------------------
    frame_rate_cdc_sync : entity work.cdc_sync(synchronizer)
        generic map (
            t           => frame_rate_t,
            RESET_STATE => FR_30,
            SYNC_FLOPS  => 3)
        port map (
            clk => clk_timer,
            rst => rst_timer,
            d   => frame_rate,
            q   => frame_rate_s);

    ---------------------------------------------------------------------------------------------------------
    -- Frame tick counter.
    -- Generate a strobe once per frame, at the rate of 24, 25 or 30 fps, depending on the chosen rate.
    ---------------------------------------------------------------------------------------------------------
    frame_timer_tick : entity work.frame_timer(timer)
        port map (
            clk        => clk_timer,
            rst        => rst_timer,
            frame_rate => frame_rate_s,
            frame_tick => frame_tick,
            qframe_pkt => qframe_pkt);

    ---------------------------------------------------------------------------------------------------------
    -- This is where we generate the time code, given a frame rate. The code updates with every frame_tick.
    -- The generator runs freely. It restarts only when the frame rate changes.
    ---------------------------------------------------------------------------------------------------------
    tcg : entity work.timecode_generator(timers)
        port map (
            clk_timer  => clk_timer,
            rst_timer  => rst_timer,
            frame_rate => frame_rate_s,
            frame_tick => frame_tick,
            frame_time => frame_time);

    JA3 <= frame_tick;                  -- test point

    ---------------------------------------------------------------------------------------------------------
    -- DISPLAY THE FRAME TIME.
    ---------------------------------------------------------------------------------------------------------

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
    -- Encode the time code and drive it out as linear time code
    ---------------------------------------------------------------------------------------------------------
    ltc_enc : entity work.ltc_encoder(coder)
        port map (
            clk_timer  => clk_timer,
            rst_timer  => rst_timer,
            frame_rate => frame_rate_s,
            frame_tick => frame_tick,
            frame_time => frame_time,
            ltc        => AUD_PWM);

    ---------------------------------------------------------------------------------------------------------
    -- create MIDI time code packets and feed to serial transmitter.
    -- The serial transmitter is not embedded in this encoder because if the encoder is used in a design
    -- where other MIDI data (note, controller, etc) are transmitted, the muxing and serial TX loader have to
    -- be designed.
    ---------------------------------------------------------------------------------------------------------
    mtc_enc : entity work.mtc_encoder(coder)
        port map (
            clk_timer     => clk_timer,
            rst_timer     => rst_timer,
            frame_rate    => frame_rate_s,
            frame_tick    => frame_tick,
            frame_time    => frame_time,
            qframe_pkt    => qframe_pkt,
            do_full_frame => do_full_frame,
            msg_data      => midi_msg_data,
            msg_valid     => midi_msg_valid);

    ---------------------------------------------------------------------------------------------------------
    -- Take coded MIDI TC messages and push them out the serial port.
    ---------------------------------------------------------------------------------------------------------
    serial_transmitter : entity work.uatx_with_fifo(wrapper)
        generic map (
            SYSCLKPER => CLKPER,            -- system clock period, for UATX baud rate generator
            BAUD_RATE => MIDI_BAUD_RATE)    -- what it is
        port map (
            clk_src     => clk_timer,       -- clock for the FIFO input
            rst_src     => rst_timer,       -- reset in that domain
            tx_data     => midi_msg_data,   -- data to send
            tx_valid    => midi_msg_valid,  -- write din to the FIFO
            full        => open,
            almost_full => open,
            clk_main    => clk_main,        -- global clock which drives serializer
            rst_main    => rst_main,        -- reset in that domain
            ser_tx      => JA2);            -- serial data transmit line

    -- until the MIDI serial interface is implemented, the MIDI message goes to the LEDs. Doubtful we will
    -- see them. LEDs are active high.
    drive_leds : process (clk_timer) is
    begin  -- process drive_leds
        if rising_edge(clk_timer) then
            if rst_timer = '1' then
                LED <= (others => '0');
            else
                -- lower 8 LEDs map to the message. 
                UpdateLEds : if midi_msg_valid then
                    LED(7 downto 0)  <= midi_msg_data;
                end if UpdateLEds;

                -- upper LEDs show frame rate.
                what_frame_rate: case frame_rate_s is
                    when FR_24 =>
                        LED(15 downto 8) <= "00100100";
                    when FR_25 =>
                        LED(15 downto 8) <= "00100101";
                    when FR_30 =>
                        LED(15 downto 8) <= "00110000";
                    when others =>
                        LED(15 downto 8) <= "11000011";
                end case what_frame_rate;
                
            end if;
        end if;
    end process drive_leds;

    ---------------------------------------------------------------------------------------------------------
    -- MTC decoder. 
    ---------------------------------------------------------------------------------------------------------

    decoder_mtc : entity work.mtc_decoder(decoder)
        generic map (
            CLK_PER   => CLK_PER,
            BAUD_RATE => BAUD_RATE)
        port map (
            midi_rx        => JA1,
            clk_main       => clk_main,
            rst_main       => rst_main,
            frame_rate     => mtcd_frame_rate,
            frame_time     => mtcd_frame_time,
            new_frame_time => mtcd_new_frame_time);

end architecture toplevel;
