-------------------------------------------------------------------------------
-- Title      : Linear Time Code / MIDI Time Code conversion
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ltc_mtc.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-03-30
-- Last update: 2025-04-08
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

library work;
use work.ltc_mtc_pkg.all;

entity ltc_mtc is

    generic (
        CLKPER : time := 10 NS);
    port (
        -- clock source
        CLK100MHZ  : in  std_logic;                    -- oscillator
        -- buttons. All are active-high except for CPU_RESET.
        CPU_RESETN : in  std_logic;                    -- a button labeled reset
        -- BTNC       : in  std_logic;                    -- the "Center" button
        -- BTNU       : in  std_logic;                    -- the "up" button
        -- BTNL       : in  std_logic;                    -- the "left" button
        -- BTNR       : in  std_logic;                    -- the "right" button
        -- BTND       : in  std_logic;                    -- the "down" button
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
        -- LED        : out std_logic_vector(15 downto 0);
        -- 7-segment display. The controls are active low.
        CA         : out std_logic;                    -- common "A" segment
        CB         : out std_logic;                    -- common "B" segment
        CC         : out std_logic;                    -- common "C" segment
        CD         : out std_logic;                    -- common "D" segment
        CE         : out std_logic;                    -- common "E" segment
        CF         : out std_logic;                    -- common "F" segment
        CG         : out std_logic;                    -- common "G" segment
        DP         : out std_logic;                    -- common decimal point
        AN         : out std_logic_vector(7 downto 0)  -- anodes for each segment
        );

end entity ltc_mtc;

architecture toplevel of ltc_mtc is

    ---------------------------------------------------------------------------------------------------------
    -- Clocking and resets.
    ---------------------------------------------------------------------------------------------------------
    -- system clock, and a reset in its domain.
    -- This clock handles input synchronization, display refresh timing and the timer frequency selection.
    -- Basically the input clock is buffered in clks_rst and driven right back out to here.
    signal clkmain : std_logic;
    signal rstmain_l : std_logic;

    -- clock for the time code generation and display. This clock runs at one of three frequencies, depending
    -- on the selected frame rate. The frequencies are integer multiples of the frame rate so we maintain
    -- accuracy.
    signal clktimer : std_logic;
    signal rsttimer_l : std_logic;

    ---------------------------------------------------------------------------------------------------------
    -- Switches.
    ---------------------------------------------------------------------------------------------------------
    -- We use two of the 16 switches to select the frame rate. The state of the switches is synchronized to
    -- the main clock, and this codes the frame rate and chooses which timer frequency drives the time code
    -- generator. 
    signal frsw : std_logic_vector(1 downto 0);

    ---------------------------------------------------------------------------------------------------------
    -- Timing.
    ---------------------------------------------------------------------------------------------------------
    -- The timer clock, frequency as selected by the frame rate switches above, is divided down to generate a
    -- strobe tick at the start of every frame time. This strobe will be at 24, 25 or 30 frames per second.
    signal frame_tick : std_logic;
    -- Synchronzize the frame tick in the main domain, and delay it for edge detect.
    -- On the edge of this tick, the frame time counters are copied to the display digits.
    signal frame_tick_s : std_logic;
    signal frame_tick_d : std_logic;

    -- Here is where we keep track of the frame time. The frame rate is part of this record.
    signal frame_time : frame_time_t;
    -- Synchronize it to the fast main clock domain for display.
    signal frame_time_s : frame_time_t;

    ---------------------------------------------------------------------------------------------------------
    -- Display.
    ---------------------------------------------------------------------------------------------------------
    -- On every frame tick, capture digit segments. Each digit includes the decimal point.
    -- These are the cathodes of the digit display LEDs.
    signal all_digits : digit_array_t;

    -- Index into the LED anodes. Cathodes are common to all digits, and enabling the anode lights that
    -- digit.
    signal this_anode : natural range 0 to NUM_DIGITS - 1;

    -- Display refresh timer. The period is for one digit. Refreshing the display takes eight times that one
    -- digit. On each refresh tick, we turn on one anode so that its digit can update.
    -- The refresh period of 1 ms per digit, or 8 ms for all digits, was determined by inspection. There is
    -- no visible flicker in the display.
    constant REFRESH_PERIOD : time := 1 MS;
    constant TICKS_PER_REFRESH : natural := integer(REFRESH_PERIOD / CLKPER);
    subtype refresh_timer_t is natural range 0 to TICKS_PER_REFRESH - 1;
    signal refresh_timer : refresh_timer_t;
    signal refresh_tick : std_logic;    -- tick true on timer rollover.
    
begin  -- architecture toplevel

    ---------------------------------------------------------------------------------------------------------
    -- Clocking.
    -- Take in the 100 MHz board oscillator and based on the selected frame rate, output a timer frequency
    -- that is an integer when divided to that frame rate. The frequencies chosen are allowed by the MMCM, so
    -- they're not entirely random.
    ---------------------------------------------------------------------------------------------------------
    clks_rst_inst: entity work.clks_rst
        port map (
            clkref     => CLK100MHZ,
            arst_l     => CPU_RESETN,
            frame_rate => frame_time.frame_rate,
            clktimer   => clktimer,
            rsttimer_l => rsttimer_l,
            clkmain    => clkmain,
            rstmain_l  => rstmain_l);

    ---------------------------------------------------------------------------------------------------------
    -- Frame rate is set by the state of switches 0 and 1.
    -- Synchronize the two rate select switches to the main clock, and then encode that select into the frame
    -- rate type. Store the encoded frame rate in the timer record.
    ---------------------------------------------------------------------------------------------------------
    frsw_cdc_sync : entity work.cdc_sync
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
                frame_time.frame_rate <= FR_30;
                frame_time.frame_cnt.lsd_rollover <= 9;
            else
                FrameRateDecoder : case frsw is
                    when "01"   =>
                        frame_time.frame_cnt.lsd_rollover <= 4;
                        frame_time.frame_rate <= FR_25;
                    when "10"   =>
                        frame_time.frame_cnt.lsd_rollover <= 3;
                        frame_time.frame_rate <= FR_24;
                    when others =>
                        frame_time.frame_cnt.lsd_rollover <= 9;
                        frame_time.frame_rate <= FR_30;
                end case FrameRateDecoder;
            end if;
        end if;
    end process GetFrameRate;

    ---------------------------------------------------------------------------------------------------------
    -- Frame tick counter.
    -- Generate a strobe once per frame, at the rate of 24, 25 or 30 fps, depending on the chosen rate.
    ---------------------------------------------------------------------------------------------------------
    frame_timer_tick: entity work.frame_timer(timer)
        port map (
            clk        => clktimer,
            rst_l      => rsttimer_l,
            frame_rate => frame_time.frame_rate,
            frame_tick => frame_tick);
    
    ---------------------------------------------------------------------------------------------------------
    -- Time code counter.
    -- On every frame tick, increment the frame counter LSD.
    -- When frame counter LSD rolls over, increment the frame counter MSD.
    -- When frame counter MSD rolls over, increment the seconds counter LSD.
    -- And so forth.
    --
    -- Frame counter rollover is a bit of a special case because it will roll over after 23, 24 or 29 counts.
    ---------------------------------------------------------------------------------------------------------
    TimeCodeGenerator : process (clktimer) is
    begin  -- process TimeCodeGenerator
        if rising_edge(clktimer) then
            if rsttimer_l = '0' then
                frame_time.frame_cnt.lsd  <= 0;
                frame_time.frame_cnt.msd  <= 0;
                frame_time.ft_sec.lsd <= 0;
                frame_time.ft_sec.msd <= 0;
                frame_time.ft_min.lsd <= 0;
                frame_time.ft_min.msd <= 0;
                frame_time.ft_hr.lsd  <= 0;
                frame_time.ft_hr.msd  <= 0;
            else
                OnTheTick: if frame_tick then

                    isLastFrameCnt : if ( (frame_time.frame_cnt.lsd = frame_time.frame_cnt.lsd_rollover) and
                                           (frame_time.frame_cnt.msd = 2) ) then
                        frame_time.frame_cnt.lsd <= 0;
                        frame_time.frame_cnt.msd <= 0;

                        isLastSec: if frame_time.ft_sec.lsd = 9 then
                            frame_time.ft_sec.lsd <= 0;
                            
                            isSecRollover: if frame_time.ft_sec.msd = 5 then
                                frame_time.ft_sec.msd <= 0;

                                isLastMin : if frame_time.ft_min.lsd = 9 then
                                    frame_time.ft_min.lsd <= 0;

                                    isMinRollover: if frame_time.ft_min.msd = 5 then
                                        frame_time.ft_min.msd <= 0;

                                        isLastHr: if frame_time.ft_hr.msd = 2 then
                                            
                                            isHrRollover: if frame_time.ft_hr.lsd = 3 then
                                                -- this is the end when everything rolls over to 0
                                                frame_time.ft_hr.msd <= 0;
                                                frame_time.ft_hr.lsd <= 0;
                                            elsif frame_time.ft_hr.lsd = 9 then
                                                frame_time.ft_hr.lsd <= 0;
                                                frame_time.ft_hr.msd <= frame_time.ft_hr.msd + 1;
                                            end if isHrRollover;
                                        else
                                            isAlsoHrRollover: if frame_time.ft_hr.lsd = 9 then
                                                frame_time.ft_hr.lsd <= 0;
                                                frame_time.ft_hr.msd <= frame_time.ft_hr.msd + 1;
                                            else
                                                frame_time.ft_hr.lsd <= frame_time.ft_hr.lsd + 1;
                                            end if isAlsoHrRollover;
                                        end if isLastHr;
                                    else
                                        frame_time.ft_min.msd <= frame_time.ft_min.msd + 1;
                                    end if isMinRollover;
                                    
                                else
                                    frame_time.ft_min.lsd <= frame_time.ft_min.lsd + 1;
                                end if isLastMin;

                            else
                                frame_time.ft_sec.msd <= frame_time.ft_sec.msd + 1;
                            end if isSecRollover;
                        else
                            frame_time.ft_sec.lsd <= frame_time.ft_sec.lsd + 1;
                        end if isLastSec;
                        
                    else

                        UpdateFrameCnt: if frame_time.frame_cnt.lsd = 9 then
                            frame_time.frame_cnt.lsd <= 0;
                            frame_time.frame_cnt.msd <= frame_time.frame_cnt.msd + 1;
                        else
                            frame_time.frame_cnt.lsd <= frame_time.frame_cnt.lsd + 1;
                        end if UpdateFrameCnt;
                        
                    end if isLastFrameCnt;

                end if OnTheTick;

            end if;
        end if;
    end process TimeCodeGenerator;

    ---------------------------------------------------------------------------------------------------------
    -- DISPLAY THE FRAME TIME.
    --
    -- Get frame tick on the faster system clock.
    ---------------------------------------------------------------------------------------------------------
    tick_sync : entity work.cdc_sync
        generic map (
            t           => std_logic,
            RESET_STATE => '0',
            SYNC_FLOPS  => 3)
        port map (
            clk   => clkmain,
            rst_l => rstmain_l,
            d     => frame_tick,
            q     => frame_tick_s);

    ---------------------------------------------------------------------------------------------------------
    -- Get the frame time record on the faster system clock.
    ---------------------------------------------------------------------------------------------------------
    frame_time_sync : entity work.cdc_sync
        generic map (
            t           => frame_time_t,
            RESET_STATE => FRAME_TIME_RESET,
            SYNC_FLOPS  => 3)
        port map (
            clk   => clkmain,
            rst_l => rstmain_l,
            d     => frame_time,
            q     => frame_time_s);
    
    ---------------------------------------------------------------------------------------------------------
    -- Update digits to display on the timer tick.
    -- The display always shows the "previous" frame time, although that probably doesn't matter at 100 MHz.
    ---------------------------------------------------------------------------------------------------------
    UpdateDigits: process (clkmain) is
    begin  -- process UpdateDigits
        if rising_edge(clkmain) then
            if rstmain_l = '0' then
                frame_tick_d <= '0';
                -- ensure all segments are off
                all_digits <= (others => (others => '1'));
            else
                frame_tick_d <= frame_tick_s;
                
                UodateSegments: if frame_tick_s and not frame_tick_d then
                    all_digits(DIGIT_FRAME_LSD) <= segment_driver(frame_time_s.frame_cnt.lsd, DECPT_OFF);
                    all_digits(DIGIT_FRAME_MSD) <= segment_driver(frame_time_s.frame_cnt.msd, DECPT_OFF);
                    all_digits(DIGIT_SEC_LSD)   <= segment_driver(frame_time_s.ft_sec.lsd, DECPT_ON);
                    all_digits(DIGIT_SEC_MSD)   <= segment_driver(frame_time_s.ft_sec.msd, DECPT_OFF);
                    all_digits(DIGIT_MIN_LSD)   <= segment_driver(frame_time_s.ft_min.lsd, DECPT_ON);
                    all_digits(DIGIT_MIN_MSD)   <= segment_driver(frame_time_s.ft_min.msd, DECPT_OFF);
                    all_digits(DIGIT_HR_LSD)    <= segment_driver(frame_time_s.ft_hr.lsd, DECPT_ON);
                    all_digits(DIGIT_HR_MSD)    <= segment_driver(frame_time_s.ft_hr.msd, DECPT_OFF);
                end if UodateSegments;
            end if;
        end if;
    end process UpdateDigits;

    ---------------------------------------------------------------------------------------------------------
    -- We multiplex the cathodes and enable the outputs with the anode.
    -- This is where we set the update rate and drive the anodes and the cathodes.
    --
    -- The refresh timer indicates when the next digit should be selected and illuminated.
    -- The timer rollover is pipelined, that is, we set the tick strobe when the count is 1 so it is true on
    -- count equals zero. Then that single bit is an enable for the output updates.
    -- Note the this_anode is updated with timer = 1, so on refresh tick the new anode is updated
    -- simultaneously with the cathodes for that digit.
    ---------------------------------------------------------------------------------------------------------
    RefreshDisplay: process (clkmain) is
    begin  -- process RefreshDisplay
        if rising_edge(clkmain) then 
            if rstmain_l = '0' then
                refresh_timer <= 0;
                refresh_tick  <= '0';
                this_anode    <= 0;
                AN            <= (0 => '0', others => '1');
            else

                -- the refresh timer just runs continously.
                TheRefreshTimer: if refresh_timer = refresh_timer_t'low then
                    refresh_timer <= refresh_timer_t'high;
                else
                    refresh_timer <= refresh_timer - 1;
                end if TheRefreshTimer;

                -- When the timer rolls over, assert our tick and also update the current anode which is also
                -- the current digit to display.
                RolloverTick: if refresh_timer = 1 then
                    refresh_tick <= '1';
                    this_anode   <= (this_anode + 1) mod NUM_DIGITS;
                else
                    refresh_tick <= '0';
                end if RolloverTick;

                -- drive segments and anode. Note that we first clear all anodes, and then only enable the
                -- anode that is currently selected.
                UpdateDisplay: if refresh_tick then
                    AN <= (others => '1');
                    AN(this_anode) <= '0';
                    CA <= all_digits(this_anode)(CA_IDX);
                    CB <= all_digits(this_anode)(CB_IDX);
                    CC <= all_digits(this_anode)(CC_IDX);
                    CD <= all_digits(this_anode)(CD_IDX);
                    CE <= all_digits(this_anode)(CE_IDX);
                    CF <= all_digits(this_anode)(CF_IDX);
                    CG <= all_digits(this_anode)(CG_IDX);
                    DP <= all_digits(this_anode)(DP_IDX);
                end if UpdateDisplay;
                
            end if;
        end if;
    end process RefreshDisplay;

end architecture toplevel;
