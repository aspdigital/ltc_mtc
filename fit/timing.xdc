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





connect_debug_port u_ila_1/probe9 [get_nets [list {the_display_mux/frame_time_mux_s[frame_cnt][carry]}]]
connect_debug_port u_ila_1/probe10 [get_nets [list {the_display_mux/frame_time_mux_s[ft_hr][carry]}]]
connect_debug_port u_ila_1/probe11 [get_nets [list {the_display_mux/frame_time_mux_s[ft_min][carry]}]]
connect_debug_port u_ila_1/probe12 [get_nets [list {the_display_mux/frame_time_mux_s[ft_sec][carry]}]]

create_generated_clock -name {clk_bundle[1]_Gen} -source [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/I0] -divide_by 1 -add -master_clock clk_bundle[1] [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name {clk_bundle[0]_Gen} -source [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/I1] -divide_by 1 -add -master_clock clk_bundle[0] [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name {clk_bundle[1]_Gen_1} -source [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/I0] -divide_by 1 -add -master_clock clk_bundle[1] [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name {clk_bundle[0]_Gen_1} -source [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/I1] -divide_by 1 -add -master_clock clk_bundle[0] [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/O]
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks {clk_bundle[1]_Gen}] -group [get_clocks -include_generated_clocks {clk_bundle[0]_Gen}]
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks {clk_bundle[1]_Gen_1}] -group [get_clocks -include_generated_clocks {clk_bundle[0]_Gen_1}]





connect_debug_port u_ila_0/probe6 [get_nets [list {decoder_mtc/ft_rx_out_inc[frames][0]} {decoder_mtc/ft_rx_out_inc[frames][1]} {decoder_mtc/ft_rx_out_inc[frames][2]} {decoder_mtc/ft_rx_out_inc[frames][3]} {decoder_mtc/ft_rx_out_inc[frames][4]}]]
connect_debug_port u_ila_0/probe9 [get_nets [list {decoder_mtc/frame_rollover[0]} {decoder_mtc/frame_rollover[1]} {decoder_mtc/frame_rollover[2]} {decoder_mtc/frame_rollover[3]} {decoder_mtc/frame_rollover[4]}]]
connect_debug_port u_ila_0/probe10 [get_nets [list {decoder_mtc/ft_rx_out_inc[frame_rate][0]} {decoder_mtc/ft_rx_out_inc[frame_rate][1]}]]
connect_debug_port u_ila_0/probe13 [get_nets [list {decoder_mtc/ft_rx_out_inc[minutes][0]} {decoder_mtc/ft_rx_out_inc[minutes][1]} {decoder_mtc/ft_rx_out_inc[minutes][2]} {decoder_mtc/ft_rx_out_inc[minutes][3]} {decoder_mtc/ft_rx_out_inc[minutes][4]} {decoder_mtc/ft_rx_out_inc[minutes][5]}]]
connect_debug_port u_ila_0/probe15 [get_nets [list {decoder_mtc/ft_rx_out_inc[hours][0]} {decoder_mtc/ft_rx_out_inc[hours][1]} {decoder_mtc/ft_rx_out_inc[hours][2]} {decoder_mtc/ft_rx_out_inc[hours][3]} {decoder_mtc/ft_rx_out_inc[hours][4]}]]
connect_debug_port u_ila_0/probe16 [get_nets [list {decoder_mtc/ft_rx_out_inc[seconds][0]} {decoder_mtc/ft_rx_out_inc[seconds][1]} {decoder_mtc/ft_rx_out_inc[seconds][2]} {decoder_mtc/ft_rx_out_inc[seconds][3]} {decoder_mtc/ft_rx_out_inc[seconds][4]} {decoder_mtc/ft_rx_out_inc[seconds][5]}]]
connect_debug_port u_ila_0/probe35 [get_nets [list decoder_mtc/got_qf_4_d]]


