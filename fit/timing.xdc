## Clock input.
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK100MHZ]

# timer clock after muxing
create_generated_clock -name clk_timer -source [get_pins clks_rst_inst/CLK100MHZ_IBUF] -divide_by 2 [get_pins clks_rst_inst/timer_clk_mux/clksel_12_3_bufgctrl_0]

set_false_path -from [get_pins {frame_rate_reg[*]/C}] -to [get_pins {frame_rate_cdc_sync/d_s_reg[*]/D}]


set_input_delay -clock [get_clocks sys_clk_pin] -min  2.100 [get_ports {SW[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -max  5.100 [get_ports {SW[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -min  2.100 [get_ports CPU_RESETN]
set_input_delay -clock [get_clocks sys_clk_pin] -max  5.100 [get_ports CPU_RESETN]

set_input_delay -clock [get_clocks clk_timer] -min  2.100 [get_ports BTND]
set_input_delay -clock [get_clocks clk_timer] -max  5.100 [get_ports BTND]
set_false_path -from [get_ports BTND] -to [get_pins ff_sw_debounce/sw_sync/d_s_reg/D]

set_output_delay -clock [get_clocks sys_clk_pin] 0.100 [get_ports JA2]
set_output_delay -clock [get_clocks clk_timer] 0.1 [get_ports "LED*"]
set_output_delay -clock [get_clocks clk_timer] 0.1 [get_ports "AN[*]"]
set_output_delay -clock [get_clocks clk_timer] 0.1 [get_ports AUD_PWM]
set_output_delay -clock [get_clocks clk_timer] 0.1 [get_ports "C*"]
set_output_delay -clock [get_clocks clk_timer] 0.1 [get_ports "DP"]
set_output_delay -clock [get_clocks clk_timer] 0.1 [get_ports "JA3"]

set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks {mmcm_adv_inst_n_2 mmcm_adv_inst_n_4}] -group [get_clocks -include_generated_clocks mmcm_adv_inst_n_6]
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks mmcm_adv_inst_n_2] -group [get_clocks -include_generated_clocks mmcm_adv_inst_n_4]

set_false_path -from [get_clocks sys_clk_pin] -to [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT2]]
set_false_path -from [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT2]] -to [get_clocks clk_timer]
set_false_path -from [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks clk_timer]

set_false_path -from [get_clocks sys_clk_pin] -to [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks sys_clk_pin] -to [get_clocks -of_objects [get_pins clks_rst_inst/mmcm_adv_inst/CLKOUT1]]



set_property IOB TRUE [all_inputs]
set_property IOB TRUE [all_outputs]

