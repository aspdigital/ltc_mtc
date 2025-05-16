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

vlog -work xpm  -l xpm -l fifo_generator_v13_2_11 -l xil_defaultlib \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_2_11  -v2k5 -l xpm -l fifo_generator_v13_2_11 -l xil_defaultlib \
"../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_11 -93  \
"../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_11  -v2k5 -l xpm -l fifo_generator_v13_2_11 -l xil_defaultlib \
"../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -v2k5 -l xpm -l fifo_generator_v13_2_11 -l xil_defaultlib \
"../../../ltc_mtc.gen/sources_1/ip/uart_fifo/sim/uart_fifo.v" \

vcom -work xil_defaultlib -2008  \
"../../../../src/cdc_sync.vhdl" \
"../../../../src/ltc_mtc_pkg.vhdl" \
"../../../../src/clk_mux_pkg.vhdl" \
"../../../../src/reset_sync.vhdl" \
"../../../../src/clk_mux.vhdl" \
"../../../../src/clks_rst.vhdl" \
"../../../../src/debounce.vhdl" \
"../../../../src/mtc_pkg.vhdl" \
"../../../../src/timecode_pkg.vhdl" \
"../../../../src/seven_segment_display_pkg.vhdl" \
"../../../../src/timecode_display.vhdl" \
"../../../../src/display_mux.vhdl" \
"../../../../src/frame_timer.vhdl" \
"../../../../src/ltc_encoder.vhdl" \
"../../../../src/timecode_generator.vhdl" \
"../../../../src/mtc_encoder.vhdl" \
"../../../../src/uatx.vhdl" \
"../../../../src/uatx_with_fifo.vhdl" \
"../../../../src/mtc_tx.vhdl" \
"../../../../src/tc_generator.vhdl" \
"../../../../src/uarx.vhdl" \
"../../../../src/mtc_decoder.vhdl" \
"../../../../src/ltc_mtc.vhdl" \
"../../../../tb/tb_mtc_decoder.vhdl" \
"../../../../tb/tb_mtc_encoder.vhdl" \
"../../../../tb/ltc_mtc_tb.vhdl" \

vlog -work xil_defaultlib \
"glbl.v"

