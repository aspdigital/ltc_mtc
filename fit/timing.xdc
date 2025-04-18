## Clock input.
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK100MHZ]

# False paths between the MMCM outputs and the input clock as well.

# More clock groups and timing ignores, so Vivado doesn't complain about proper CDC.
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks {clk_out_37p5 clk_out_50}] -group [get_clocks -include_generated_clocks clk_out_33]
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks clk_out_50] -group [get_clocks -include_generated_clocks clk_out_37p5]

set_false_path -from [get_pins {frame_rate_reg[*]/C}] -to [get_pins {frame_rate_cdc_sync/d_s_reg[*]/D}]


# Vivado demands input delay specs, even for the async buttons etc
set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 2.100 [get_ports {SW[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 8.100 [get_ports {SW[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 2.100 [get_ports CPU_RESETN]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 8.100 [get_ports CPU_RESETN]
set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 2.100 [get_ports BTND]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 8.100 [get_ports BTND]

# vivado demands output delay specs for the LEDs.
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -1.900 [get_ports {LED[*]}]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 6.100 [get_ports {LED[*]}]
set_false_path -to [get_ports {LED[*]}]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -1.900 [get_ports {AN[*]}]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 6.100 [get_ports {AN[*]}]
set_false_path -to [get_ports {AN[*]}]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -1.900 [get_ports CA]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 6.100 [get_ports CA]
set_false_path -to [get_ports CA]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -1.900 [get_ports CB]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 6.100 [get_ports CB]
set_false_path -to [get_ports CB]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -1.900 [get_ports CC]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 6.100 [get_ports CC]
set_false_path -to [get_ports CC]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -1.900 [get_ports CD]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 6.100 [get_ports CD]
set_false_path -to [get_ports CD]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -1.900 [get_ports CE]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 6.100 [get_ports CE]
set_false_path -to [get_ports CE]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -1.900 [get_ports CF]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 6.100 [get_ports CF]
set_false_path -to [get_ports CF]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -1.900 [get_ports CG]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 6.100 [get_ports CG]
set_false_path -to [get_ports CG]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -1.900 [get_ports DP]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 6.100 [get_ports DP]
set_false_path -to [get_ports DP]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay -1.900 [get_ports {JA[*]}]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 6.100 [get_ports {JA[*]}]
set_false_path -to [get_ports {JA[*]}]


set_false_path -from [get_clocks sys_clk_pin] -to [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT2]]
set_false_path -from [get_pins clks_rst_inst/timer_clk_mux/rst_int_l_reg_inv/C] -to [get_pins {clks_rst_inst/timer_clk_mux/reset_sync/ResetSynchronizer.v_rsthold_reg[*]/PRE}]
set_false_path -from [get_pins clks_rst_inst/timer_clk_mux/rst_int_l_reg_inv/C] -to [get_pins clks_rst_inst/timer_clk_mux/reset_sync/srst_l_reg/CLR]
