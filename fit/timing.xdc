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
set_input_delay -clock [get_clocks clk_audio_ub] -min -add_delay 0.100 [get_ports JC10]
set_input_delay -clock [get_clocks clk_audio_ub] -max -add_delay 0.100 [get_ports JC10]
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

set_output_delay -clock clk_display -min -add_delay -0.100 [get_ports {AN[*]}]
set_output_delay -clock clk_display -max -add_delay 0.100 [get_ports {AN[*]}]

set_output_delay -clock clk_audio_ub -min -0.100 [get_ports LED16_R]
set_output_delay -clock clk_audio_ub -max 0.100 [get_ports LED16_R]
set_output_delay -clock clk_audio_ub -min -0.100 [get_ports LED16_G]
set_output_delay -clock clk_audio_ub -max 0.100 [get_ports LED16_G]

set_output_delay -clock clk_audio_ub -min -0.100 [get_ports LED17_R]
set_output_delay -clock clk_audio_ub -max 0.100 [get_ports LED17_R]
set_output_delay -clock clk_audio_ub -min -0.100 [get_ports LED17_G]
set_output_delay -clock clk_audio_ub -max 0.100 [get_ports LED17_G]
set_output_delay -clock clk_audio_ub -min -0.100 [get_ports LED17_B]
set_output_delay -clock clk_audio_ub -max 0.100 [get_ports LED17_B]

set_output_delay -clock clk_audio_ub -min -0.100 [get_ports {LED[0]}]
set_output_delay -clock clk_audio_ub -max 0.100 [get_ports {LED[0]}]

set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -0.100 [get_ports JA2]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.100 [get_ports JA2]
set_output_delay -clock clk_audio_ub -min -add_delay -0.100 [get_ports JA3]
set_output_delay -clock clk_audio_ub -max -add_delay 0.100 [get_ports JA3]
set_output_delay -clock [get_clocks clk_audio_ub] -min -add_delay -0.100 [get_ports JC7]
set_output_delay -clock [get_clocks clk_audio_ub] -max -add_delay 0.100 [get_ports JC7]
set_output_delay -clock [get_clocks JC7] -min -add_delay -0.100 [get_ports JC8]
set_output_delay -clock [get_clocks JC7] -max -add_delay 0.100 [get_ports JC8]
set_false_path -to [get_ports JC8]
set_output_delay -clock [get_clocks JC7] -min -add_delay -0.100 [get_ports JC9]
set_output_delay -clock [get_clocks JC7] -max -add_delay 0.100 [get_ports JC9]
set_output_delay -clock clk_timer -min -add_delay -0.100 [get_ports AUD_PWM]
set_output_delay -clock clk_timer -max -add_delay 0.100 [get_ports AUD_PWM]

create_generated_clock -name {clk_bundle[2]_timer} -source [get_pins tc_gen/timer_clk_mux/clksel_12_3_bufgctrl/I1] -divide_by 1 -add -master_clock clk_bundle[2] [get_pins tc_gen/timer_clk_mux/clksel_12_3_bufgctrl/O]
create_generated_clock -name {clk_bundle[1]_timer} -source [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/I0] -divide_by 1 -add -master_clock clk_bundle[1] [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name {clk_bundle[0]_timer} -source [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/I1] -divide_by 1 -add -master_clock clk_bundle[0] [get_pins tc_gen/timer_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name {clk_bundle[2]_display} -source [get_pins the_display_mux/display_clk_mux/clksel_12_3_bufgctrl/I1] -divide_by 1 -add -master_clock clk_bundle[2] [get_pins the_display_mux/display_clk_mux/clksel_12_3_bufgctrl/O]
create_generated_clock -name {clk_bundle[1]_display} -source [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/I0] -divide_by 1 -add -master_clock clk_bundle[1] [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name {clk_bundle[0]_display} -source [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/I1] -divide_by 1 -add -master_clock clk_bundle[0] [get_pins the_display_mux/display_clk_mux/clksel_1_2_bufgmux/O]

set_clock_groups -asynchronous -group clk_bundle[0]_timer -group clk_bundle[1]_timer -group clk_bundle[2]_timer -group clk_display -group clk_timer -group sys_clk_pin
set_clock_groups -asynchronous -group clk_bundle[0]_display -group clk_bundle[1]_display -group clk_bundle[2]_display -group clk_display -group clk_timer -group sys_clk_pin

set_clock_groups -asynchronous -group sys_clk_pin -group [get_clocks [list [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT1]] [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT0]] [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT2]]]]









create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 16384 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clks_rst_inst/clk_audio]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {decoder_ltc/data_receiver/Channels[0].sr[0]} {decoder_ltc/data_receiver/Channels[0].sr[1]} {decoder_ltc/data_receiver/Channels[0].sr[2]} {decoder_ltc/data_receiver/Channels[0].sr[3]} {decoder_ltc/data_receiver/Channels[0].sr[4]} {decoder_ltc/data_receiver/Channels[0].sr[5]} {decoder_ltc/data_receiver/Channels[0].sr[6]} {decoder_ltc/data_receiver/Channels[0].sr[7]} {decoder_ltc/data_receiver/Channels[0].sr[8]} {decoder_ltc/data_receiver/Channels[0].sr[9]} {decoder_ltc/data_receiver/Channels[0].sr[10]} {decoder_ltc/data_receiver/Channels[0].sr[11]} {decoder_ltc/data_receiver/Channels[0].sr[12]} {decoder_ltc/data_receiver/Channels[0].sr[13]} {decoder_ltc/data_receiver/Channels[0].sr[14]} {decoder_ltc/data_receiver/Channels[0].sr[15]} {decoder_ltc/data_receiver/Channels[0].sr[16]} {decoder_ltc/data_receiver/Channels[0].sr[17]} {decoder_ltc/data_receiver/Channels[0].sr[18]} {decoder_ltc/data_receiver/Channels[0].sr[19]} {decoder_ltc/data_receiver/Channels[0].sr[20]} {decoder_ltc/data_receiver/Channels[0].sr[21]} {decoder_ltc/data_receiver/Channels[0].sr[22]} {decoder_ltc/data_receiver/Channels[0].sr[23]} {decoder_ltc/data_receiver/Channels[0].sr[24]} {decoder_ltc/data_receiver/Channels[0].sr[25]} {decoder_ltc/data_receiver/Channels[0].sr[26]} {decoder_ltc/data_receiver/Channels[0].sr[27]} {decoder_ltc/data_receiver/Channels[0].sr[28]} {decoder_ltc/data_receiver/Channels[0].sr[29]} {decoder_ltc/data_receiver/Channels[0].sr[30]} {decoder_ltc/data_receiver/Channels[0].sr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 24 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {decoder_ltc/data_receiver/Channels[0].this_left[0]} {decoder_ltc/data_receiver/Channels[0].this_left[1]} {decoder_ltc/data_receiver/Channels[0].this_left[2]} {decoder_ltc/data_receiver/Channels[0].this_left[3]} {decoder_ltc/data_receiver/Channels[0].this_left[4]} {decoder_ltc/data_receiver/Channels[0].this_left[5]} {decoder_ltc/data_receiver/Channels[0].this_left[6]} {decoder_ltc/data_receiver/Channels[0].this_left[7]} {decoder_ltc/data_receiver/Channels[0].this_left[8]} {decoder_ltc/data_receiver/Channels[0].this_left[9]} {decoder_ltc/data_receiver/Channels[0].this_left[10]} {decoder_ltc/data_receiver/Channels[0].this_left[11]} {decoder_ltc/data_receiver/Channels[0].this_left[12]} {decoder_ltc/data_receiver/Channels[0].this_left[13]} {decoder_ltc/data_receiver/Channels[0].this_left[14]} {decoder_ltc/data_receiver/Channels[0].this_left[15]} {decoder_ltc/data_receiver/Channels[0].this_left[16]} {decoder_ltc/data_receiver/Channels[0].this_left[17]} {decoder_ltc/data_receiver/Channels[0].this_left[18]} {decoder_ltc/data_receiver/Channels[0].this_left[19]} {decoder_ltc/data_receiver/Channels[0].this_left[20]} {decoder_ltc/data_receiver/Channels[0].this_left[21]} {decoder_ltc/data_receiver/Channels[0].this_left[22]} {decoder_ltc/data_receiver/Channels[0].this_left[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 6 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {decoder_ltc/bitwidth_base[0]} {decoder_ltc/bitwidth_base[1]} {decoder_ltc/bitwidth_base[2]} {decoder_ltc/bitwidth_base[3]} {decoder_ltc/bitwidth_base[4]} {decoder_ltc/bitwidth_base[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {decoder_ltc/bw_state[0]} {decoder_ltc/bw_state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 9 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {decoder_ltc/watchdog_timer[0]} {decoder_ltc/watchdog_timer[1]} {decoder_ltc/watchdog_timer[2]} {decoder_ltc/watchdog_timer[3]} {decoder_ltc/watchdog_timer[4]} {decoder_ltc/watchdog_timer[5]} {decoder_ltc/watchdog_timer[6]} {decoder_ltc/watchdog_timer[7]} {decoder_ltc/watchdog_timer[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 3 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {decoder_ltc/ds_state[0]} {decoder_ltc/ds_state[1]} {decoder_ltc/ds_state[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 6 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {decoder_ltc/bitwidth[0]} {decoder_ltc/bitwidth[1]} {decoder_ltc/bitwidth[2]} {decoder_ltc/bitwidth[3]} {decoder_ltc/bitwidth[4]} {decoder_ltc/bitwidth[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 7 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {decoder_ltc/bitcnt[0]} {decoder_ltc/bitcnt[1]} {decoder_ltc/bitcnt[2]} {decoder_ltc/bitcnt[3]} {decoder_ltc/bitcnt[4]} {decoder_ltc/bitcnt[5]} {decoder_ltc/bitcnt[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 6 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {decoder_ltc/bittime[0]} {decoder_ltc/bittime[1]} {decoder_ltc/bittime[2]} {decoder_ltc/bittime[3]} {decoder_ltc/bittime[4]} {decoder_ltc/bittime[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 6 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {decoder_ltc/bitwidth3p4[0]} {decoder_ltc/bitwidth3p4[1]} {decoder_ltc/bitwidth3p4[2]} {decoder_ltc/bitwidth3p4[3]} {decoder_ltc/bitwidth3p4[4]} {decoder_ltc/bitwidth3p4[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 2 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {ltcd_frame_rate[0]} {ltcd_frame_rate[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list decoder_ltc/data_receiver/bclk_d]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list decoder_ltc/data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list decoder_ltc/data_valid_d]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list decoder_ltc/got_transition]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list decoder_ltc/got_transition_d]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list decoder_ltc/locked_d]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list decoder_ltc/loss_of_signal]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list decoder_ltc/data_receiver/lrclk_d]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list ltcd_los]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list ltcd_new_frame_time]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list decoder_ltc/prev_sign]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list decoder_ltc/this_sign]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_audio]
