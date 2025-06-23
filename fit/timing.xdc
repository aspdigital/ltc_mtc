## Clock input.
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK100MHZ]

# mainly for I/O timing
# display clock after muxing
# timecode generator clock after muxing
create_generated_clock -name clk_timer -source [get_ports CLK100MHZ] -divide_by 2 [get_pins tc_gen/timer_clk_mux/clk_timer]

#
# for the clock muxing.
# This is for the display clocking.
#
#create_generated_clock -name display_clk_timer_50    -source [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux_0]   -multiply_by 1 -add -master_clock mmcm_adv_inst_n_2 [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/O]
#create_generated_clock -name display_clk_timer_37    -source [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux_1]   -multiply_by 1 -add -master_clock mmcm_adv_inst_n_4 [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/O]
#create_generated_clock -name display_clk_timer_25_24 -source [get_pins the_display_mux/display_clk_mux/clksel_12_3_bufgctrl_0] -multiply_by 1 -add -master_clock clk_timer_50      [get_pins the_display_mux/display_clk_mux/clksel_12_3_bufgctrl/O]
#create_generated_clock -name display_clk_timer_33    -source [get_pins the_display_mux/display_clk_mux/clksel_12_3_bufgctrl_0] -multiply_by 1 -add -master_clock mmcm_adv_inst_n_6 [get_pins the_display_mux/display_clk_mux/clksel_12_3_bufgctrl/O]

#
# input delay on switches and buttons.

set_input_delay -clock [get_clocks sys_clk_pin] -min 1.100 [get_ports {SW[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -max 2.100 [get_ports {SW[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -min 1.100 [get_ports CPU_RESETN]
set_input_delay -clock [get_clocks sys_clk_pin] -max 2.100 [get_ports CPU_RESETN]
set_input_delay -clock [get_clocks clk_timer] -min 1.100 [get_ports BTND]
set_input_delay -clock [get_clocks clk_timer] -max 2.100 [get_ports BTND]

# MIDI In
set_input_delay -clock [get_clocks sys_clk_pin] -min 1.100 [get_ports JA1]
set_input_delay -clock [get_clocks sys_clk_pin] -max 2.100 [get_ports JA1]

# MTC is generated on the system clock.
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -0.600 [get_ports JA2]
set_output_delay -clock [get_clocks sys_clk_pin] -max 1.100 [get_ports JA2]


create_generated_clock -name {clk_bundle[1]_Gen} -source [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/I0] -divide_by 1 -add -master_clock clk_bundle[1] [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name {clk_bundle[0]_Gen} -source [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/I1] -divide_by 1 -add -master_clock clk_bundle[0] [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name {clk_bundle[1]_Gen_1} -source [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/I0] -divide_by 1 -add -master_clock clk_bundle[1] [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name {clk_bundle[0]_Gen_1} -source [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/I1] -divide_by 1 -add -master_clock clk_bundle[0] [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/O]
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks {clk_bundle[1]_Gen}] -group [get_clocks -include_generated_clocks {clk_bundle[0]_Gen}]
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks {clk_bundle[1]_Gen_1}] -group [get_clocks -include_generated_clocks {clk_bundle[0]_Gen_1}]

set_clock_groups -asynchronous -group clk_audio_ub -group sys_clk_pin


