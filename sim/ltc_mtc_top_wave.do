onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ltc_mtc_tb/DUT/gen_frame_rate
add wave -noupdate /ltc_mtc_tb/DUT/gen_frame_time
add wave -noupdate /ltc_mtc_tb/DUT/tc_display_src
add wave -noupdate /ltc_mtc_tb/DUT/tc_ext_src
add wave -noupdate /ltc_mtc_tb/DUT/mmcm_locked
add wave -noupdate /ltc_mtc_tb/DUT/mtcd_frame_rate
add wave -noupdate /ltc_mtc_tb/DUT/mtcd_frame_time
add wave -noupdate /ltc_mtc_tb/DUT/mtcd_new_frame_time
add wave -noupdate /ltc_mtc_tb/DUT/tc_gen/timer_clk_mux/clk_bundle
add wave -noupdate /ltc_mtc_tb/DUT/tc_gen/timer_clk_mux/clk_out
add wave -noupdate /ltc_mtc_tb/DUT/tc_gen/timer_clk_mux/clk_sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 327
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ns} {23508 ns}
