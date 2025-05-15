set_property IOB TRUE [all_inputs]
set_property IOB TRUE [all_outputs]
## Clock input.
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK100MHZ]

# timer clock after muxing
create_generated_clock -name clk_timer -source [get_ports CLK100MHZ] -divide_by 2 [get_pins clks_rst_inst/clk_timer]

set_false_path -from [get_pins {frame_rate_reg[*]/C}] -to [get_pins {frame_rate_cdc_sync/d_s_reg[*]/D}]

# for the clock muxing.
# select between 50 MHz (25 fps) and 37.5 MHz (24 fps)
create_generated_clock -name clk_timer_50 -source [get_pins clks_rst_inst/timer_clk_mux/clksel_1_2_bufgmux_0] -multiply_by 1 -add -master_clock mmcm_adv_inst_n_2 [get_pins clks_rst_inst/timer_clk_mux/clksel_1_2_bufgmux/O]
create_generated_clock -name clk_timer_37 -source [get_pins clks_rst_inst/timer_clk_mux/clksel_1_2_bufgmux_1] -multiply_by 1 -add -master_clock mmcm_adv_inst_n_4 [get_pins clks_rst_inst/timer_clk_mux/clksel_1_2_bufgmux/O]
set_clock_groups -name grp_25_24 -physically_exclusive -group [get_clocks {clk_timer_25_24 clk_timer_50 sys_clk_pin clk_timer}]

# for between the above and the 33 MHz (30 fps)
# 50/37 drives I0 of the output mux.
create_generated_clock -name clk_timer_25_24 -source [get_pins clks_rst_inst/timer_clk_mux/clksel_12_3_bufgctrl_0] -multiply_by 1 -add -master_clock clk_timer_50 [get_pins clks_rst_inst/timer_clk_mux/clksel_12_3_bufgctrl/O]
# 33 drives I1 of the output muix
create_generated_clock -name clk_timer_33 -source [get_pins clks_rst_inst/timer_clk_mux/clksel_12_3_bufgctrl_0] -multiply_by 1 -add -master_clock mmcm_adv_inst_n_6 [get_pins clks_rst_inst/timer_clk_mux/clksel_12_3_bufgctrl/O]

set_input_delay -clock [get_clocks sys_clk_pin] 0.000 [get_ports {SW[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] 0.000 [get_ports CPU_RESETN]
set_input_delay -clock [get_clocks clk_timer] 0.000 [get_ports BTND]

create_clock -period 20.000 -name VIRTUAL_clk_timer -waveform {0.000 10.000}
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -min -add_delay 0.000 [get_ports {AN[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -max -add_delay 0.000 [get_ports {AN[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -min -add_delay 0.000 [get_ports {LED[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -max -add_delay 0.000 [get_ports {LED[*]}]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -min -add_delay 0.000 [get_ports AUD_PWM]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -max -add_delay 0.000 [get_ports AUD_PWM]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -min -add_delay 0.000 [get_ports CA]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -max -add_delay 0.000 [get_ports CA]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -min -add_delay 0.000 [get_ports CB]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -max -add_delay 0.000 [get_ports CB]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -min -add_delay 0.000 [get_ports CC]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -max -add_delay 0.000 [get_ports CC]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -min -add_delay 0.000 [get_ports CD]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -max -add_delay 0.000 [get_ports CD]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -min -add_delay 0.000 [get_ports CE]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -max -add_delay 0.000 [get_ports CE]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -min -add_delay 0.000 [get_ports CF]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -max -add_delay 0.000 [get_ports CF]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -min -add_delay 0.000 [get_ports CG]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -max -add_delay 0.000 [get_ports CG]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -min -add_delay 0.000 [get_ports DP]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -max -add_delay 0.000 [get_ports DP]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports JA2]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 0.000 [get_ports JA2]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -min -add_delay 0.000 [get_ports JA3]
set_output_delay -clock [get_clocks VIRTUAL_clk_timer] -max -add_delay 0.000 [get_ports JA3]

set_clock_groups -physically_exclusive -group [get_clocks -include_generated_clocks clk_timer_33] -group [get_clocks -include_generated_clocks clk_timer_25_24]
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks {clk_timer_37 clk_timer_50}] -group [get_clocks -include_generated_clocks mmcm_adv_inst_n_6]
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks mmcm_adv_inst_n_2] -group [get_clocks -include_generated_clocks mmcm_adv_inst_n_4]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clks_rst_inst/clk_main]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 2 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {the_display_mux/frame_rate_mux[0]} {the_display_mux/frame_rate_mux[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 4 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {the_display_mux/frame_time_mux_reg[ft_hr][lsd][3]_0[0]} {the_display_mux/frame_time_mux_reg[ft_hr][lsd][3]_0[1]} {the_display_mux/frame_time_mux_reg[ft_hr][lsd][3]_0[2]} {the_display_mux/frame_time_mux_reg[ft_hr][lsd][3]_0[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 3 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {the_display_mux/frame_time_mux_reg[ft_sec][msd][0]} {the_display_mux/frame_time_mux_reg[ft_sec][msd][1]} {the_display_mux/frame_time_mux_reg[ft_sec][msd][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {the_display_mux/mtcd_frame_time[frame_cnt][msd][0]} {the_display_mux/mtcd_frame_time[frame_cnt][msd][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 3 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {the_display_mux/gen_frame_time_s[ft_min][msd][0]} {the_display_mux/gen_frame_time_s[ft_min][msd][1]} {the_display_mux/gen_frame_time_s[ft_min][msd][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 2 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {the_display_mux/frame_time_mux_reg[frame_cnt][msd][0]} {the_display_mux/frame_time_mux_reg[frame_cnt][msd][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 4 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {the_display_mux/frame_time_mux_reg[frame_cnt][lsd][3]_0[0]} {the_display_mux/frame_time_mux_reg[frame_cnt][lsd][3]_0[1]} {the_display_mux/frame_time_mux_reg[frame_cnt][lsd][3]_0[2]} {the_display_mux/frame_time_mux_reg[frame_cnt][lsd][3]_0[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 2 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {the_display_mux/gen_frame_time_s[frame_cnt][msd][0]} {the_display_mux/gen_frame_time_s[frame_cnt][msd][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 2 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {the_display_mux/mtcd_frame_rate[0]} {the_display_mux/mtcd_frame_rate[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 4 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {the_display_mux/frame_time_mux_reg[ft_hr][lsd][0]} {the_display_mux/frame_time_mux_reg[ft_hr][lsd][1]} {the_display_mux/frame_time_mux_reg[ft_hr][lsd][2]} {the_display_mux/frame_time_mux_reg[ft_hr][lsd][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 4 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {the_display_mux/gen_frame_time_s[ft_sec][lsd][0]} {the_display_mux/gen_frame_time_s[ft_sec][lsd][1]} {the_display_mux/gen_frame_time_s[ft_sec][lsd][2]} {the_display_mux/gen_frame_time_s[ft_sec][lsd][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 3 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {the_display_mux/mtcd_frame_time[ft_sec][msd][0]} {the_display_mux/mtcd_frame_time[ft_sec][msd][1]} {the_display_mux/mtcd_frame_time[ft_sec][msd][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {the_display_mux/frame_time_mux_reg[ft_hr][msd][0]_0[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 3 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {the_display_mux/frame_time_mux_reg[ft_min][msd][0]} {the_display_mux/frame_time_mux_reg[ft_min][msd][1]} {the_display_mux/frame_time_mux_reg[ft_min][msd][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 4 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {the_display_mux/frame_time_mux_reg[ft_min][lsd][0]} {the_display_mux/frame_time_mux_reg[ft_min][lsd][1]} {the_display_mux/frame_time_mux_reg[ft_min][lsd][2]} {the_display_mux/frame_time_mux_reg[ft_min][lsd][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 3 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {the_display_mux/mtcd_frame_time[ft_min][msd][0]} {the_display_mux/mtcd_frame_time[ft_min][msd][1]} {the_display_mux/mtcd_frame_time[ft_min][msd][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 2 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {the_display_mux/frame_time_mux_reg[ft_hr][msd][0]} {the_display_mux/frame_time_mux_reg[ft_hr][msd][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 4 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {the_display_mux/frame_time_mux_reg[ft_sec][lsd][3]_0[0]} {the_display_mux/frame_time_mux_reg[ft_sec][lsd][3]_0[1]} {the_display_mux/frame_time_mux_reg[ft_sec][lsd][3]_0[2]} {the_display_mux/frame_time_mux_reg[ft_sec][lsd][3]_0[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 4 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {the_display_mux/gen_frame_time_s[ft_min][lsd][0]} {the_display_mux/gen_frame_time_s[ft_min][lsd][1]} {the_display_mux/gen_frame_time_s[ft_min][lsd][2]} {the_display_mux/gen_frame_time_s[ft_min][lsd][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 4 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {the_display_mux/frame_time_mux_reg[ft_min][lsd][3]_0[0]} {the_display_mux/frame_time_mux_reg[ft_min][lsd][3]_0[1]} {the_display_mux/frame_time_mux_reg[ft_min][lsd][3]_0[2]} {the_display_mux/frame_time_mux_reg[ft_min][lsd][3]_0[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 4 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {the_display_mux/gen_frame_time_s[frame_cnt][lsd][0]} {the_display_mux/gen_frame_time_s[frame_cnt][lsd][1]} {the_display_mux/gen_frame_time_s[frame_cnt][lsd][2]} {the_display_mux/gen_frame_time_s[frame_cnt][lsd][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 4 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {the_display_mux/frame_time_mux_reg[frame_cnt][lsd][0]} {the_display_mux/frame_time_mux_reg[frame_cnt][lsd][1]} {the_display_mux/frame_time_mux_reg[frame_cnt][lsd][2]} {the_display_mux/frame_time_mux_reg[frame_cnt][lsd][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 4 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {the_display_mux/frame_time_mux_reg[ft_sec][lsd][0]} {the_display_mux/frame_time_mux_reg[ft_sec][lsd][1]} {the_display_mux/frame_time_mux_reg[ft_sec][lsd][2]} {the_display_mux/frame_time_mux_reg[ft_sec][lsd][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 4 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {the_display_mux/gen_frame_time_s[ft_hr][lsd][0]} {the_display_mux/gen_frame_time_s[ft_hr][lsd][1]} {the_display_mux/gen_frame_time_s[ft_hr][lsd][2]} {the_display_mux/gen_frame_time_s[ft_hr][lsd][3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 3 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {the_display_mux/gen_frame_time_s[ft_sec][msd][0]} {the_display_mux/gen_frame_time_s[ft_sec][msd][1]} {the_display_mux/gen_frame_time_s[ft_sec][msd][2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 2 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {decoder_mtc/DecodeFrameRate[0]} {decoder_mtc/DecodeFrameRate[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 2 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {tc_gen/frame_rate_reg[1]_0[0]} {tc_gen/frame_rate_reg[1]_0[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list decoder_mtc/midi_uarx/ser_rx_cdc_sync/d_s]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list the_display_mux/sw_db_2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list the_display_mux/sw_db_3]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list tc_gen/timer_clk_mux/clk_timer]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 3 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {tc_gen/TimeCodeGenerator.v_sec_reg[msd][2][0]} {tc_gen/TimeCodeGenerator.v_sec_reg[msd][2][1]} {tc_gen/TimeCodeGenerator.v_sec_reg[msd][2][2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 2 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {tc_gen/TimeCodeGenerator.v_hr_reg[msd][1][0]} {tc_gen/TimeCodeGenerator.v_hr_reg[msd][1][1]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 4 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {tc_gen/TimeCodeGenerator.v_hr_reg[lsd][3][0]} {tc_gen/TimeCodeGenerator.v_hr_reg[lsd][3][1]} {tc_gen/TimeCodeGenerator.v_hr_reg[lsd][3][2]} {tc_gen/TimeCodeGenerator.v_hr_reg[lsd][3][3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 3 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {tc_gen/TimeCodeGenerator.v_min_reg[msd][2][0]} {tc_gen/TimeCodeGenerator.v_min_reg[msd][2][1]} {tc_gen/TimeCodeGenerator.v_min_reg[msd][2][2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 4 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {tc_gen/TimeCodeGenerator.v_sec_reg[lsd][3][0]} {tc_gen/TimeCodeGenerator.v_sec_reg[lsd][3][1]} {tc_gen/TimeCodeGenerator.v_sec_reg[lsd][3][2]} {tc_gen/TimeCodeGenerator.v_sec_reg[lsd][3][3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 2 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {tc_gen/frame_rate_s[0]} {tc_gen/frame_rate_s[1]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 3 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {tc_gen/qframe_id[0]} {tc_gen/qframe_id[1]} {tc_gen/qframe_id[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 4 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {tc_gen/TimeCodeGenerator.v_min_reg[lsd][3][0]} {tc_gen/TimeCodeGenerator.v_min_reg[lsd][3][1]} {tc_gen/TimeCodeGenerator.v_min_reg[lsd][3][2]} {tc_gen/TimeCodeGenerator.v_min_reg[lsd][3][3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 1 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list tc_gen/frame_tick]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 1 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {tc_gen/qframe_pkt[tick]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_1_clk_timer]
