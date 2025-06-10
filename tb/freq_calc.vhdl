-- mods:
-- 2023-04-17 andy: fix divide-by-zero error when v_prevdiff is zero.
--                  simpler frequency calculation: doesn't require long FEMTO constant.
library ieee;
use ieee.std_logic_1164.all;
library std;
use std.textio.all;

entity freq_calc is
    generic (
        SIGNAL_NAME : string);
    port (
        mysig : in std_logic);

end entity freq_calc;

architecture calculator of freq_calc is

begin  -- architecture calculator

    FreqReporter : process is
        variable v_prevtime     : time := 0 FS;
        variable v_currtime     : time := 0 FS;
        variable v_prevdiff     : time := 0 FS;
        variable v_newdiff      : time := 0 FS;
        variable v_currfreq     : real := 0.0;
    begin  -- process FreqReporter

        wait until rising_edge(mysig);
        v_currtime := now;
        v_newdiff  := v_currtime - v_prevtime;

        if (v_prevdiff > 0 fs) then     -- prevent divide-by-zero error
            if v_newdiff /= v_prevdiff then
                v_currfreq := real(1 sec / v_newdiff);
                report SIGNAL_NAME & ":   Period is: " & to_string(v_newdiff) & "   Frequency is: " & to_string(v_currfreq)
                    severity NOTE;
            end if;
        end if;

        v_prevdiff := v_newdiff;
        v_prevtime := v_currtime;

    end process FreqReporter;

end architecture calculator;
