onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -gTX_FRAME_RATE=0 -L xil_defaultlib -L xpm -L fifo_generator_v13_2_11 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.ltc_mtc_tb xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {ltc_mtc_tb.udo}

run 1000ns

quit -force
