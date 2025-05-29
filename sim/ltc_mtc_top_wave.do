onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ltc_mtc_tb/DUT/mmcm_locked
add wave -noupdate /ltc_mtc_tb/DISPLAY_SOURCE
add wave -noupdate /ltc_mtc_tb/SW
add wave -noupdate -divider {Internal generator}
add wave -noupdate /ltc_mtc_tb/DUT/tc_gen/frame_time
add wave -noupdate -divider {Time Code Display Source Select}
add wave -noupdate /ltc_mtc_tb/DUT/gen_frame_rate
add wave -noupdate -color Orange /ltc_mtc_tb/DUT/gen_frame_time
add wave -noupdate /ltc_mtc_tb/DUT/mtcd_frame_time
add wave -noupdate -color Coral /ltc_mtc_tb/DUT/the_display_mux/frame_rate_mux
add wave -noupdate -color Coral /ltc_mtc_tb/DUT/the_display_mux/frame_time_mux
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/clk_display
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/rst_display
add wave -noupdate -divider {MTC Generator}
add wave -noupdate /ltc_mtc_tb/tb_mtc_encoder_1/frame_rate
add wave -noupdate /ltc_mtc_tb/tb_mtc_encoder_1/ft
add wave -noupdate -radix unsigned /ltc_mtc_tb/tb_mtc_encoder_1/last_frame
add wave -noupdate /ltc_mtc_tb/tb_mtc_encoder_1/midi_out
add wave -noupdate -divider {MTC receiver and decoder}
add wave -noupdate /ltc_mtc_tb/tb_mtc_encoder_1/ft
add wave -noupdate /ltc_mtc_tb/DUT/decoder_mtc/midi_uarx/rx_state
add wave -noupdate -radix unsigned /ltc_mtc_tb/DUT/decoder_mtc/midi_uarx/br_timer
add wave -noupdate /ltc_mtc_tb/DUT/decoder_mtc/midi_uarx/br_timer_is_zero
add wave -noupdate /ltc_mtc_tb/DUT/decoder_mtc/midi_rx
add wave -noupdate -radix binary /ltc_mtc_tb/DUT/decoder_mtc/midi_uarx/sr
add wave -noupdate /ltc_mtc_tb/DUT/decoder_mtc/rx_data
add wave -noupdate /ltc_mtc_tb/DUT/decoder_mtc/rx_valid
add wave -noupdate /ltc_mtc_tb/DUT/decoder_mtc/qf_id
add wave -noupdate /ltc_mtc_tb/DUT/decoder_mtc/qf_data
add wave -noupdate /ltc_mtc_tb/DUT/decoder_mtc/got_qf_0
add wave -noupdate /ltc_mtc_tb/DUT/decoder_mtc/got_qf_4
add wave -noupdate -color Goldenrod /ltc_mtc_tb/DUT/decoder_mtc/ft_rx_in
add wave -noupdate /ltc_mtc_tb/DUT/decoder_mtc/ft_rx_out
add wave -noupdate /ltc_mtc_tb/DUT/decoder_mtc/frame_time
add wave -noupdate /ltc_mtc_tb/DUT/decoder_mtc/new_frame_time
add wave -noupdate -divider {Rate and time in display domain}
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/frame_rate_mux_s
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/frame_time_mux_s
add wave -noupdate -divider {Display driver}
add wave -noupdate -radix unsigned /ltc_mtc_tb/DUT/the_display_mux/received_tcd/reload
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/received_tcd/refresh_timer
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/received_tcd/refresh_tick
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/received_tcd/this_anode
add wave -noupdate /ltc_mtc_tb/DUT/the_display_mux/received_tcd/all_digits
add wave -noupdate -divider Display
add wave -noupdate /ltc_mtc_tb/tb_timecode_display_1/digits
add wave -noupdate /ltc_mtc_tb/tb_timecode_display_1/dps
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {103455459817 ps} 0}
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
WaveRestoreZoom {25966643297 ps} {130212281932 ps}
