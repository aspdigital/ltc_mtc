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





create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 16384 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clks_rst_inst/clk_main]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 2 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {decoder_mtc/ft_rx_in[frame_rate][0]} {decoder_mtc/ft_rx_in[frame_rate][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 5 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {decoder_mtc/ft_rx_in[hours][0]} {decoder_mtc/ft_rx_in[hours][1]} {decoder_mtc/ft_rx_in[hours][2]} {decoder_mtc/ft_rx_in[hours][3]} {decoder_mtc/ft_rx_in[hours][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 6 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {decoder_mtc/ft_rx_in[seconds][0]} {decoder_mtc/ft_rx_in[seconds][1]} {decoder_mtc/ft_rx_in[seconds][2]} {decoder_mtc/ft_rx_in[seconds][3]} {decoder_mtc/ft_rx_in[seconds][4]} {decoder_mtc/ft_rx_in[seconds][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 5 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {decoder_mtc/ft_rx_out[frames][0]} {decoder_mtc/ft_rx_out[frames][1]} {decoder_mtc/ft_rx_out[frames][2]} {decoder_mtc/ft_rx_out[frames][3]} {decoder_mtc/ft_rx_out[frames][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 6 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {decoder_mtc/ft_rx_out[minutes][0]} {decoder_mtc/ft_rx_out[minutes][1]} {decoder_mtc/ft_rx_out[minutes][2]} {decoder_mtc/ft_rx_out[minutes][3]} {decoder_mtc/ft_rx_out[minutes][4]} {decoder_mtc/ft_rx_out[minutes][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 6 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {decoder_mtc/ft_rx_out[seconds][0]} {decoder_mtc/ft_rx_out[seconds][1]} {decoder_mtc/ft_rx_out[seconds][2]} {decoder_mtc/ft_rx_out[seconds][3]} {decoder_mtc/ft_rx_out[seconds][4]} {decoder_mtc/ft_rx_out[seconds][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 5 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {decoder_mtc/ft_rx_out_inc[frames][0]} {decoder_mtc/ft_rx_out_inc[frames][1]} {decoder_mtc/ft_rx_out_inc[frames][2]} {decoder_mtc/ft_rx_out_inc[frames][3]} {decoder_mtc/ft_rx_out_inc[frames][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 2 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {decoder_mtc/ft_rx_out[frame_rate][0]} {decoder_mtc/ft_rx_out[frame_rate][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 6 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {decoder_mtc/ft_rx_in[minutes][0]} {decoder_mtc/ft_rx_in[minutes][1]} {decoder_mtc/ft_rx_in[minutes][2]} {decoder_mtc/ft_rx_in[minutes][3]} {decoder_mtc/ft_rx_in[minutes][4]} {decoder_mtc/ft_rx_in[minutes][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 5 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {decoder_mtc/frame_rollover[0]} {decoder_mtc/frame_rollover[1]} {decoder_mtc/frame_rollover[2]} {decoder_mtc/frame_rollover[3]} {decoder_mtc/frame_rollover[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 2 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {decoder_mtc/ft_rx_out_inc[frame_rate][0]} {decoder_mtc/ft_rx_out_inc[frame_rate][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 5 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {decoder_mtc/ft_rx_in[frames][0]} {decoder_mtc/ft_rx_in[frames][1]} {decoder_mtc/ft_rx_in[frames][2]} {decoder_mtc/ft_rx_in[frames][3]} {decoder_mtc/ft_rx_in[frames][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 5 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {decoder_mtc/ft_rx_out[hours][0]} {decoder_mtc/ft_rx_out[hours][1]} {decoder_mtc/ft_rx_out[hours][2]} {decoder_mtc/ft_rx_out[hours][3]} {decoder_mtc/ft_rx_out[hours][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 6 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {decoder_mtc/ft_rx_out_inc[minutes][0]} {decoder_mtc/ft_rx_out_inc[minutes][1]} {decoder_mtc/ft_rx_out_inc[minutes][2]} {decoder_mtc/ft_rx_out_inc[minutes][3]} {decoder_mtc/ft_rx_out_inc[minutes][4]} {decoder_mtc/ft_rx_out_inc[minutes][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {decoder_mtc/rx_data[0]} {decoder_mtc/rx_data[1]} {decoder_mtc/rx_data[2]} {decoder_mtc/rx_data[3]} {decoder_mtc/rx_data[4]} {decoder_mtc/rx_data[5]} {decoder_mtc/rx_data[6]} {decoder_mtc/rx_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 5 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {decoder_mtc/ft_rx_out_inc[hours][0]} {decoder_mtc/ft_rx_out_inc[hours][1]} {decoder_mtc/ft_rx_out_inc[hours][2]} {decoder_mtc/ft_rx_out_inc[hours][3]} {decoder_mtc/ft_rx_out_inc[hours][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 6 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {decoder_mtc/ft_rx_out_inc[seconds][0]} {decoder_mtc/ft_rx_out_inc[seconds][1]} {decoder_mtc/ft_rx_out_inc[seconds][2]} {decoder_mtc/ft_rx_out_inc[seconds][3]} {decoder_mtc/ft_rx_out_inc[seconds][4]} {decoder_mtc/ft_rx_out_inc[seconds][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 2 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {decoder_mtc/midi_uarx/rx_state[0]} {decoder_mtc/midi_uarx/rx_state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 8 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {decoder_mtc/midi_uarx/sr[0]} {decoder_mtc/midi_uarx/sr[1]} {decoder_mtc/midi_uarx/sr[2]} {decoder_mtc/midi_uarx/sr[3]} {decoder_mtc/midi_uarx/sr[4]} {decoder_mtc/midi_uarx/sr[5]} {decoder_mtc/midi_uarx/sr[6]} {decoder_mtc/midi_uarx/sr[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 2 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {the_display_mux/frame_rate_mux[0]} {the_display_mux/frame_rate_mux[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 4 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {the_display_mux/frame_time_mux[frame_cnt][lsd][0]} {the_display_mux/frame_time_mux[frame_cnt][lsd][1]} {the_display_mux/frame_time_mux[frame_cnt][lsd][2]} {the_display_mux/frame_time_mux[frame_cnt][lsd][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 2 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {the_display_mux/frame_time_mux[ft_hr][msd][0]} {the_display_mux/frame_time_mux[ft_hr][msd][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 4 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {the_display_mux/frame_time_mux[ft_hr][lsd][0]} {the_display_mux/frame_time_mux[ft_hr][lsd][1]} {the_display_mux/frame_time_mux[ft_hr][lsd][2]} {the_display_mux/frame_time_mux[ft_hr][lsd][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 3 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {the_display_mux/frame_time_mux[ft_min][msd][0]} {the_display_mux/frame_time_mux[ft_min][msd][1]} {the_display_mux/frame_time_mux[ft_min][msd][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 4 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {the_display_mux/frame_time_mux[ft_sec][lsd][0]} {the_display_mux/frame_time_mux[ft_sec][lsd][1]} {the_display_mux/frame_time_mux[ft_sec][lsd][2]} {the_display_mux/frame_time_mux[ft_sec][lsd][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 2 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {the_display_mux/frame_time_mux[frame_cnt][msd][0]} {the_display_mux/frame_time_mux[frame_cnt][msd][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 4 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {the_display_mux/frame_time_mux[ft_min][lsd][0]} {the_display_mux/frame_time_mux[ft_min][lsd][1]} {the_display_mux/frame_time_mux[ft_min][lsd][2]} {the_display_mux/frame_time_mux[ft_min][lsd][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 3 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {the_display_mux/frame_time_mux[ft_sec][msd][0]} {the_display_mux/frame_time_mux[ft_sec][msd][1]} {the_display_mux/frame_time_mux[ft_sec][msd][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 5 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {mtcd_frame_time[frames][0]} {mtcd_frame_time[frames][1]} {mtcd_frame_time[frames][2]} {mtcd_frame_time[frames][3]} {mtcd_frame_time[frames][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 2 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {mtcd_frame_time[frame_rate][0]} {mtcd_frame_time[frame_rate][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 6 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {mtcd_frame_time[minutes][0]} {mtcd_frame_time[minutes][1]} {mtcd_frame_time[minutes][2]} {mtcd_frame_time[minutes][3]} {mtcd_frame_time[minutes][4]} {mtcd_frame_time[minutes][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 6 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {mtcd_frame_time[seconds][0]} {mtcd_frame_time[seconds][1]} {mtcd_frame_time[seconds][2]} {mtcd_frame_time[seconds][3]} {mtcd_frame_time[seconds][4]} {mtcd_frame_time[seconds][5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 5 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {mtcd_frame_time[hours][0]} {mtcd_frame_time[hours][1]} {mtcd_frame_time[hours][2]} {mtcd_frame_time[hours][3]} {mtcd_frame_time[hours][4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list decoder_mtc/got_qf_0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list decoder_mtc/got_qf_4]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list decoder_mtc/got_qf_4_d]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list decoder_mtc/got_qfscs]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list mtcd_new_frame_time]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list decoder_mtc/rx_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list decoder_mtc/midi_uarx/ser_rx_s]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list the_display_mux/tc_display_src]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list the_display_mux/tc_ext_src]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_main]
