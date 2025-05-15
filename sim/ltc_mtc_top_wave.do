onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ltc_mtc_tb/DUT/mmcm_locked
add wave -noupdate -divider Generator
add wave -noupdate /ltc_mtc_tb/DUT/tc_gen/frame_time
add wave -noupdate -divider {Time Code Display Source Select}
add wave -noupdate /ltc_mtc_tb/DUT/gen_frame_rate
add wave -noupdate -color Orange /ltc_mtc_tb/DUT/gen_frame_time
add wave -noupdate /ltc_mtc_tb/DUT/mtcd_frame_rate
add wave -noupdate /ltc_mtc_tb/DUT/mtcd_frame_time
add wave -noupdate -color Coral /ltc_mtc_tb/DUT/the_display_mux/frame_rate_mux
add wave -noupdate -color Coral /ltc_mtc_tb/DUT/the_display_mux/frame_time_mux
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/clk_display
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/rst_display
add wave -noupdate -divider {Rate and time in display domain}
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/frame_rate_mux_s
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/frame_time_mux_s
add wave -noupdate -divider {Display driver}
add wave -noupdate -radix unsigned /ltc_mtc_tb/DUT/the_display_mux/received_tcd/reload
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/received_tcd/refresh_timer
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/received_tcd/refresh_tick
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/received_tcd/this_anode
add wave -noupdate -expand /ltc_mtc_tb/DUT/the_display_mux/received_tcd/all_digits
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13642879371 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 410
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
WaveRestoreZoom {0 ps} {6868954272 ps}
