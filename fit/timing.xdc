## Clock input.
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK100MHZ]

# mainly for I/O timing
# display clock after muxing
create_generated_clock -name clk_display -source [get_ports CLK100MHZ] -divide_by 2 [get_pins the_display_mux/display_clk_mux/clk_display]
# timecode generator clock after muxing
create_generated_clock -name clk_timer -source [get_ports CLK100MHZ] -divide_by 2 [get_pins tc_gen/timer_clk_mux/clk_timer]

#
# for the clock muxing.
# select between 50 MHz (25 fps) and 37.5 MHz (24 fps)
#
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

# timing for LEDs, LTC and MTC outs
set_output_delay -clock [get_clocks clk_display] -min -add_delay -1.100 [get_ports {AN[*]}]
set_output_delay -clock [get_clocks clk_display] -max 2.100 [get_ports {AN[*]}]
set_output_delay -clock [get_clocks clk_display] -min -add_delay -1.100 [get_ports {LED[*]}]
set_output_delay -clock [get_clocks clk_display] -max 2.100 [get_ports {LED[*]}]
set_output_delay -clock [get_clocks clk_display] -min -add_delay -1.100 [get_ports AUD_PWM]
set_output_delay -clock [get_clocks clk_display] -max 2.100 [get_ports AUD_PWM]
set_output_delay -clock [get_clocks clk_display] -min -add_delay -1.100 [get_ports CA]
set_output_delay -clock [get_clocks clk_display] -max 2.100 [get_ports CA]
set_output_delay -clock [get_clocks clk_display] -min -add_delay -1.100 [get_ports CB]
set_output_delay -clock [get_clocks clk_display] -max 2.100 [get_ports CB]
set_output_delay -clock [get_clocks clk_display] -min -add_delay -1.100 [get_ports CC]
set_output_delay -clock [get_clocks clk_display] -max 2.100 [get_ports CC]
set_output_delay -clock [get_clocks clk_display] -min -add_delay -1.100 [get_ports CD]
set_output_delay -clock [get_clocks clk_display] -max 2.100 [get_ports CD]
set_output_delay -clock [get_clocks clk_display] -min -add_delay -1.100 [get_ports CE]
set_output_delay -clock [get_clocks clk_display] -max 2.100 [get_ports CE]
set_output_delay -clock [get_clocks clk_display] -min -add_delay -1.100 [get_ports CF]
set_output_delay -clock [get_clocks clk_display] -max 2.100 [get_ports CF]
set_output_delay -clock [get_clocks clk_display] -min -add_delay -1.100 [get_ports CG]
set_output_delay -clock [get_clocks clk_display] -max 2.100 [get_ports CG]
set_output_delay -clock [get_clocks clk_display] -min -add_delay -1.100 [get_ports DP]
set_output_delay -clock [get_clocks clk_display] -max 2.100 [get_ports DP]
set_output_delay -clock [get_clocks clk_display] -min -add_delay -1.100 [get_ports JA3]
set_output_delay -clock [get_clocks clk_display] -max 2.100 [get_ports JA3]
# MTC is generated on the system clock.
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -0.600 [get_ports JA2]
set_output_delay -clock [get_clocks sys_clk_pin] -max 1.100 [get_ports JA2]



create_clock -period 20.000 -name clk_display_24_25 -waveform {0.000 10.000} [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/O]
create_clock -period 20.000 -name clk_gen_24_25 -waveform {0.000 10.000} [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/O]

set_clock_groups -name clk_grp_24_25 -logically_exclusive -group [get_clocks [list [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT1]] [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT0]]]]
set_clock_groups -name clk_grp_display_24_25_or_33 -logically_exclusive -group [get_clocks [list clk_display_24_25 [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT2]]]]
set_clock_groups -name clk_grp_gen_24_25_or_33 -logically_exclusive -group [get_clocks [list clk_gen_24_25 [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT2]]]]

