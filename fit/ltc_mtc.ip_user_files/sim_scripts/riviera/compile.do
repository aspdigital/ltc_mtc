transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/fifo_generator_v13_2_11
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap fifo_generator_v13_2_11 riviera/fifo_generator_v13_2_11
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr -l xpm -l fifo_generator_v13_2_11 -l xil_defaultlib \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_2_11  -incr -v2k5 -l xpm -l fifo_generator_v13_2_11 -l xil_defaultlib \
"../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_11 -93  -incr \
"../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_11  -incr -v2k5 -l xpm -l fifo_generator_v13_2_11 -l xil_defaultlib \
"../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 -l xpm -l fifo_generator_v13_2_11 -l xil_defaultlib \
"../../../ltc_mtc.gen/sources_1/ip/uart_fifo/sim/uart_fifo.v" \

vcom -work xil_defaultlib -2008  -incr \
"../../../../src/cdc_sync.vhdl" \
"../../../../src/ltc_mtc_pkg.vhdl" \
"../../../../src/clk_mux_pkg.vhdl" \
"../../../../src/reset_sync.vhdl" \
"../../../../src/clk_mux.vhdl" \
"../../../../src/clks_rst.vhdl" \
"../../../../src/debounce.vhdl" \
"../../../../src/mtc_pkg.vhdl" \
"../../../../src/frame_timer.vhdl" \
"../../../../src/timecode_pkg.vhdl" \
"../../../../src/ltc_encoder.vhdl" \
"../../../../src/seven_segment_display_pkg.vhdl" \
"../../../../src/timecode_generator.vhdl" \
"../../../../src/timecode_display.vhdl" \
"../../../../src/mtc_encoder.vhdl" \
"../../../../src/uatx.vhdl" \
"../../../../src/uatx_with_fifo.vhdl" \
"../../../../src/uarx.vhdl" \
"../../../../src/mtc_decoder.vhdl" \
"../../../../src/ltc_mtc.vhdl" \
"../../../../src/rgb_led.vhdl" \
"../../../../tb/mtc_decoder_tb.vhdl" \
"../../../../tb/uarx_tb.vhdl" \
"../../../../tb/ltc_mtc_tb.vhdl" \
"../../../../tb/clks_rst_tb.vhdl" \
"../../../../tb/uatx_with_fifo_tb.vhdl" \

vlog -work xil_defaultlib \
"glbl.v"

