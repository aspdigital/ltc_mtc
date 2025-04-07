-------------------------------------------------------------------------------
-- Title      : Linear Time Code / MIDI Time Code conversion
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ltc_mtc.vhdl
-- Author     : Andy Peters  <devel@latke.net>
-- Company    : ASP Digital
-- Created    : 2025-03-30
-- Last update: 2025-04-06
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

    -- reset synched to our clock.
    signal rst_l : std_logic;

    -- synchronized switches, which set frame rate.
    signal frsw : std_logic_vector(1 downto 0);

    -- tick every frame time.
    signal frame_tick : std_logic;

    -- keep track of the frame time and frame rate.
    signal frame_time : frame_time_t;

    -- capture digit segments. Each digit includes the decimal point.
    signal all_digits : digit_array_t;

    -- anode enable.
    signal this_anode : natural range 0 to NUM_DIGITS - 1;

    -- refresh timer. The period is for one digit. Refreshing the display takes eight times that one digit.
    constant REFRESH_PERIOD : time := 1 MS;
    constant TICKS_PER_REFRESH : natural := integer(REFRESH_PERIOD / CLKPER);
    subtype refresh_timer_t is natural range 0 to TICKS_PER_REFRESH - 1;
    signal refresh_timer : refresh_timer_t;
    signal refresh_tick : std_logic;    -- tick true on timer rollover.
    
begin  -- architecture toplevel

    ---------------------------------------------------------------------------------------------------------
    -- Reset synchronizer.
    ---------------------------------------------------------------------------------------------------------
    reset_syncer : entity work.reset_sync
        port map (
            clk    => CLK100MHZ,
            arst_l => CPU_RESETN,
            srst_l => rst_l);

    ---------------------------------------------------------------------------------------------------------
    -- Frame rate is set by the state of switches 0 and 1.
    ---------------------------------------------------------------------------------------------------------
    SwitchSync : for thissw in frsw'range generate
        frsw_cdc_sync : entity work.cdc_sync
            port map (
                clk   => CLK100MHZ,
                rst_l => rst_l,
                d     => SW(thissw),
                q     => frsw(thissw));
    end generate SwitchSync;

    GetFrameRate : process (CLK100MHZ) is
    begin  -- process GetFrameRate
        if rising_edge(CLK100MHZ) then
            if rst_l = '0' then
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
    ---------------------------------------------------------------------------------------------------------
    frame_timer_1: entity work.frame_timer(timer)
        generic map (
            CLKPER => CLKPER)
        port map (
            clk        => CLK100MHZ,
            rst_l      => rst_l,
            frame_rate => frame_time.frame_rate,
            frame_tick => frame_tick);
    
    ---------------------------------------------------------------------------------------------------------
    -- Time code counter.
    ---------------------------------------------------------------------------------------------------------
    TimeCodeGenerator : process (CLK100MHZ) is
    begin  -- process TimeCodeGenerator
        if rising_edge(CLK100MHZ) then
            if rst_l = '0' then
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

                                isLastMin : if frame_time.ft_min.lsd = 0 then
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
    -- Update digits to display on the timer tick.
    -- The display always shows the "previous" frame time, although that probably doesn't matter at 100 MHz.
    ---------------------------------------------------------------------------------------------------------
    UpdateDigits: process (CLK100MHZ) is
    begin  -- process UpdateDigits
        if rising_edge(CLK100MHZ) then
            if rst_l = '0' then
                -- ensure all segments are off
                all_digits <= (others => (others => '1'));
            else
                UodateSegments: if frame_tick then
                    all_digits(DIGIT_FRAME_LSD) <= segment_driver(frame_time.frame_cnt.lsd, DECPT_OFF);
                    all_digits(DIGIT_FRAME_MSD) <= segment_driver(frame_time.frame_cnt.msd, DECPT_OFF);
                    all_digits(DIGIT_SEC_LSD) <= segment_driver(frame_time.ft_sec.lsd, DECPT_ON);
                    all_digits(DIGIT_SEC_MSD) <= segment_driver(frame_time.ft_sec.msd, DECPT_OFF);
                    all_digits(DIGIT_MIN_LSD) <= segment_driver(frame_time.ft_min.lsd, DECPT_ON);
                    all_digits(DIGIT_MIN_MSD) <= segment_driver(frame_time.ft_min.msd, DECPT_OFF);
                    all_digits(DIGIT_HR_LSD) <= segment_driver(frame_time.ft_hr.lsd, DECPT_ON);
                    all_digits(DIGIT_HR_MSD) <= segment_driver(frame_time.ft_hr.msd, DECPT_OFF);
                end if UodateSegments;
            end if;
        end if;
    end process UpdateDigits;

    ---------------------------------------------------------------------------------------------------------
    -- We multiplex the cathodes and enable the outputs with the anode.
    -- This is where we set the update rate and drive the anodes and the cathodes.
    ---------------------------------------------------------------------------------------------------------
    RefreshDisplay: process (CLK100MHz) is
    begin  -- process RefreshDisplay
        if rising_edge(CLK100MHz) then 
            if rst_l = '0' then
                refresh_timer <= 0;
                refresh_tick <= '0';
                this_anode <= 0;
                AN <= (0 => '0', others => '1');
            else

                TheRefreshTimer: if refresh_timer = refresh_timer_t'low then
                    refresh_timer <= refresh_timer_t'high;
                else
                    refresh_timer <= refresh_timer - 1;
                end if TheRefreshTimer;

                RolloverTick: if refresh_timer = 1 then
                    refresh_tick <= '1';
                    this_anode <= (this_anode + 1) mod NUM_DIGITS;
                else
                    refresh_tick <= '0';
                end if RolloverTick;

                -- drive segments and anode.
                UpdateDisplay: if refresh_tick then
                    AN <= (others => '1');
                    AN(this_anode) <= '0';
                    CA <= all_digits(this_anode)(0);
                    CB <= all_digits(this_anode)(1);
                    CC <= all_digits(this_anode)(2);
                    CD <= all_digits(this_anode)(3);
                    CE <= all_digits(this_anode)(4);
                    CF <= all_digits(this_anode)(5);
                    CG <= all_digits(this_anode)(6);
                    DP <= all_digits(this_anode)(7);
                end if UpdateDisplay;
                
            end if;
        end if;
    end process RefreshDisplay;

end architecture toplevel;
