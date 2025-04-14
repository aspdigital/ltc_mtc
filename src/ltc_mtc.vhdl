-------------------------------------------------------------------------------
-- Title      : Linear Time Code / MIDI Time Code conversion
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ltc_mtc.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-03-30
-- Last update: 2025-04-13
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
--
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
        SW         : in  std_logic_vector(1 downto 0);  -- 15 downto 0
        -- RGB LEDs. Controls are active low.
        -- LED16_B    : out std_logic;                    -- blue
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
        JA         : out std_logic_vector(2 downto 1);  -- use as MTC and LTC output
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
    signal clkmain   : std_logic;
    signal rstmain_l : std_logic;

    -- clock for the time code generation and display. This clock runs at one of three frequencies, depending
    -- on the selected frame rate. The frequencies are integer multiples of the frame rate so we maintain
    -- accuracy.
    signal clktimer   : std_logic;
    signal rsttimer_l : std_logic;

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
    -- We use two of the 16 switches to select the frame rate. The state of the switches is synchronized to
    -- the main clock, and this codes the frame rate and chooses which timer frequency drives the time code
    -- generator. 
    signal frsw          : std_logic_vector(1 downto 0);
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

begin  -- architecture toplevel

    ---------------------------------------------------------------------------------------------------------
    -- For now, disble the PWM filters.
    ---------------------------------------------------------------------------------------------------------
    AUD_SD  <= '0';
    AUD_PWM <= '0';
    ---------------------------------------------------------------------------------------------------------
    -- Clocking.
    -- Take in the 100 MHz board oscillator and based on the selected frame rate, output a timer frequency
    -- that is an integer when divided to that frame rate. The frequencies chosen are allowed by the MMCM, so
    -- they're not entirely random.
    ---------------------------------------------------------------------------------------------------------
    clks_rst_inst : entity work.clks_rst(clkgen)
        port map (
            clkref     => CLK100MHZ,
            arst_l     => CPU_RESETN,
            frame_rate => frame_rate,
            clktimer   => clktimer,
            rsttimer_l => rsttimer_l,
            clkmain    => clkmain,
            rstmain_l  => rstmain_l);

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
            clk   => clktimer,               -- the logic clock to which the switch is synchronized
            rst_l => rsttimer_l,             -- reset in that domain
            sw    => BTND,                   -- the switch input
            swdb  => do_full_frame);         -- debounced switch output

    ---------------------------------------------------------------------------------------------------------
    -- Frame rate is set by the state of switches 0 and 1.
    -- Synchronize the two rate select switches to the main clock, and then encode that select into the frame
    -- rate type. We do this on the main clock, and not the timer clock, because the frame rate here is used
    -- (in clks_rst) to select the timer clock.
    ---------------------------------------------------------------------------------------------------------
    frsw_cdc_sync : entity work.cdc_sync(synchronizer)
        generic map (
            t           => std_logic_vector(frsw'range),
            RESET_STATE => (frsw'range => '0'),
            SYNC_FLOPS  => 3)
        port map (
            clk   => clkmain,
            rst_l => rstmain_l,
            d     => SW,
            q     => frsw);

    GetFrameRate : process (clkmain) is
    begin  -- process GetFrameRate
        if rising_edge(clkmain) then
            if rstmain_l = '0' then
                frame_rate <= FR_30;
            else
                frame_rate <= frame_rate_t'val(to_integer(unsigned(frsw)));
            end if;
        end if;
    end process GetFrameRate;

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
            clk   => clktimer,
            rst_l => rsttimer_l,
            d     => frame_rate,
            q     => frame_rate_s);

    ---------------------------------------------------------------------------------------------------------
    -- Frame tick counter.
    -- Generate a strobe once per frame, at the rate of 24, 25 or 30 fps, depending on the chosen rate.
    ---------------------------------------------------------------------------------------------------------
    frame_timer_tick : entity work.frame_timer(timer)
        port map (
            clk        => clktimer,
            rst_l      => rsttimer_l,
            frame_rate => frame_rate_s,
            frame_tick => frame_tick,
            qframe_pkt => qframe_pkt);

    ---------------------------------------------------------------------------------------------------------
    -- This is where we generate the time code, given a frame rate. The code updates with every frame_tick.
    -- The generator runs freely. It restarts only when the frame rate changes.
    ---------------------------------------------------------------------------------------------------------
    tcg : entity work.timecode_generator(timers)
        port map (
            clktimer   => clktimer,
            rsttimer_l => rsttimer_l,
            frame_rate => frame_rate_s,
            frame_tick => frame_tick,
            frame_time => frame_time);

    ---------------------------------------------------------------------------------------------------------
    -- DISPLAY THE FRAME TIME.
    ---------------------------------------------------------------------------------------------------------
    tcd : entity work.timecode_display(digit_driver)
        generic map (
            CLKPER_30FPS => CLKPER_30FPS,
            CLKPER_25FPS => CLKPER_25FPS,
            CLKPER_24FPS => CLKPER_24FPS)
        port map (
            clktimer   => clktimer,
            rsttimer_l => rsttimer_l,
            frame_time => frame_time,
            frame_rate => frame_rate_s,
            display    => display);

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
            clktimer   => clktimer,
            rsttimer_l => rsttimer_l,
            frame_rate => frame_rate_s,
            frame_tick => frame_tick,
            frame_time => frame_time,
            ltc        => JA(1));       -- temporary test port.

    ---------------------------------------------------------------------------------------------------------
    -- create MIDI time code packets and feed to serial transmitter.
    -- The serial transmitter is not embedded in this encoder because if the encoder is used in a design
    -- where other MIDI data (note, controller, etc) are transmitted, the muxing and serial TX loader have to
    -- be designed.
    ---------------------------------------------------------------------------------------------------------
    mtc_enc : entity work.mtc_encoder(coder)
        port map (
            clktimer      => clktimer,
            rsttimer_l    => rsttimer_l,
            frame_rate    => frame_rate,
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
            clksrc      => clktimer,        -- clock for the FIFO input
            rstsrc_l    => rsttimer_l,      -- reset in that domain
            tx_data     => midi_msg_data,   -- data to send
            tx_valid    => midi_msg_valid,  -- write din to the FIFO
            full        => open,
            almost_full => open,
            clkmain     => clkmain,         -- global clock which drives serializer
            rstmain_l   => rstmain_l,       -- reset in that domain
            ser_tx      => JA(2));          -- serial data transmit line

    -- until the MIDI serial interface is implemented, the MIDI message goes to the LEDs. Doubtful we will
    -- see them. LEDs are active high.
    drive_leds : process (clktimer) is
        variable v_cntr : natural range 0 to 255;
    begin  -- process drive_leds
        if rising_edge(clktimer) then
            if rsttimer_l = '0' then
                LED <= (others => '0');
            else
                -- lower 8 LEDs map to the message. Upper 8 LEDs count messages.
                UpdateLEds : if midi_msg_valid then
                    LED(7 downto 0)  <= midi_msg_data;
                    LED(15 downto 8) <= std_logic_vector(to_unsigned(v_cntr, 8));
                    v_cntr           := (v_cntr + 1) mod 256;
                end if UpdateLEds;
            end if;
        end if;
    end process drive_leds;

end architecture toplevel;
