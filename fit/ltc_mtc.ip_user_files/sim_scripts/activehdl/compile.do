transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../ltc_mtc.gen/sources_1/ip/clkgen" -l xpm -l xil_defaultlib \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -2008  \
"../../../../src/cdc_sync.vhdl" \
"../../../../src/ltc_mtc_pkg.vhdl" \
"../../../../src/frame_timer.vhdl" \
"../../../../src/reset_sync.vhdl" \
"../../../../src/ltc_mtc.vhdl" \
"../../../../tb/ltc_mtc_tb.vhdl" \

vlog -work xil_defaultlib \
"glbl.v"

