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
