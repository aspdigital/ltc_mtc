## Clock input.
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK100MHZ]

# mainly for I/O timing
# display clock after muxing
# timecode generator clock after muxing

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


# MIDI In

# MTC is generated on the system clock.



set_clock_groups -asynchronous -group clk_audio_ub -group sys_clk_pin



create_generated_clock -name JC7 -source [get_pins i2s_mclk_forward/C] -divide_by 1 [get_ports JC7]
create_clock -period 26.667 -name {VIRTUAL_clk_bundle[0]} -waveform {0.000 13.333}
create_clock -period 20.000 -name {VIRTUAL_clk_bundle[1]} -waveform {0.000 10.000}
create_clock -period 30.303 -name {VIRTUAL_clk_bundle[2]} -waveform {0.000 15.152}

create_generated_clock -name clk_timer -source [get_ports CLK100MHZ] -divide_by 2 [get_pins tc_gen/timer_clk_mux/clk_timer]
create_generated_clock -name clk_display -source [get_ports CLK100MHZ] -divide_by 2 [get_pins the_display_mux/display_clk_mux/clk_out]

set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.100 [get_ports {SW[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.100 [get_ports {SW[*]}]

set_input_delay -clock clk_timer -min -add_delay 0.100 [get_ports BTND]
set_input_delay -clock clk_timer -max -add_delay 0.100 [get_ports BTND]

set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.100 [get_ports CPU_RESETN]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.100 [get_ports CPU_RESETN]
set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.100 [get_ports JA1]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.100 [get_ports JA1]
set_input_delay -clock [get_clocks -of_objects [get_pins clks_rst_inst/audio_clk_mmcm/CLKOUT0]] -min -add_delay 0.100 [get_ports JC10]
set_input_delay -clock [get_clocks -of_objects [get_pins clks_rst_inst/audio_clk_mmcm/CLKOUT0]] -max -add_delay 0.100 [get_ports JC10]
set_false_path -from [get_ports JC10]

set_output_delay -clock clk_display -min -add_delay -0.100 [get_ports CA]
set_output_delay -clock clk_display -max -add_delay 0.100 [get_ports CA]

set_output_delay -clock clk_display -min -add_delay -0.100 [get_ports CB]
set_output_delay -clock clk_display -max -add_delay 0.100 [get_ports CB]

set_output_delay -clock clk_display -min -add_delay -0.100 [get_ports CC]
set_output_delay -clock clk_display -max -add_delay 0.100 [get_ports CC]

set_output_delay -clock clk_display -min -add_delay -0.100 [get_ports CD]
set_output_delay -clock clk_display -max -add_delay 0.100 [get_ports CD]

set_output_delay -clock clk_display -min -add_delay -0.100 [get_ports CE]
set_output_delay -clock clk_display -max -add_delay 0.100 [get_ports CE]

set_output_delay -clock clk_display -min -add_delay -0.100 [get_ports CF]
set_output_delay -clock clk_display -max -add_delay 0.100 [get_ports CF]

set_output_delay -clock clk_display -min -add_delay -0.100 [get_ports CG]
set_output_delay -clock clk_display -max -add_delay 0.100 [get_ports CG]

set_output_delay -clock clk_display -min -add_delay -0.100 [get_ports DP]
set_output_delay -clock clk_display -max -add_delay 0.100 [get_ports DP]

set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -0.100 [get_ports JA2]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.100 [get_ports JA2]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -0.100 [get_ports JA3]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.100 [get_ports JA3]
set_output_delay -clock [get_clocks JC7] -min -add_delay -0.100 [get_ports JC8]
set_output_delay -clock [get_clocks JC7] -max -add_delay 0.100 [get_ports JC8]
set_false_path -to [get_ports JC8]
set_output_delay -clock [get_clocks JC7] -min -add_delay -0.100 [get_ports JC9]
set_output_delay -clock [get_clocks JC7] -max -add_delay 0.100 [get_ports JC9]

create_generated_clock -name {clk_bundle[2]_timer} -source [get_pins tc_gen/timer_clk_mux/clksel_12_3_bufgctrl/I1] -divide_by 1 -add -master_clock clk_bundle[2] [get_pins tc_gen/timer_clk_mux/clksel_12_3_bufgctrl/O]
create_generated_clock -name {clk_bundle[1]_timer} -source [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/I0] -divide_by 1 -add -master_clock clk_bundle[1] [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name {clk_bundle[0]_timer} -source [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/I1] -divide_by 1 -add -master_clock clk_bundle[0] [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name {clk_bundle[2]_display} -source [get_pins the_display_mux/display_clk_mux/clksel_12_3_bufgctrl/I1] -divide_by 1 -add -master_clock clk_bundle[2] [get_pins the_display_mux/display_clk_mux/clksel_12_3_bufgctrl/O]
create_generated_clock -name {clk_bundle[1]_display} -source [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/I0] -divide_by 1 -add -master_clock clk_bundle[1] [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name {clk_bundle[0]_display} -source [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/I1] -divide_by 1 -add -master_clock clk_bundle[0] [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/O]

set_clock_groups -asynchronous -group [get_clocks {clk_bundle[*]_timer}] -group clk_display -group clk_timer -group sys_clk_pin
set_clock_groups -asynchronous -group [get_clocks {clk_bundle[*]_display}] -group clk_display -group clk_timer -group sys_clk_pin


set_clock_groups -asynchronous -group sys_clk_pin -group [get_clocks [list [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT1]] [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT0]] [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT2]]]]
