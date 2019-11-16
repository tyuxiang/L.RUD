set projDir "C:/Users/ljl19/L.RUD/work/planAhead"
set projName "LRUD"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/ljl19/L.RUD/work/verilog/mojo_top_0.v" "C:/Users/ljl19/L.RUD/work/verilog/new_alu_1.v" "C:/Users/ljl19/L.RUD/work/verilog/led_module_2.v" "C:/Users/ljl19/L.RUD/work/verilog/check_player_module_3.v" "C:/Users/ljl19/L.RUD/work/verilog/check_step_module_4.v" "C:/Users/ljl19/L.RUD/work/verilog/answer_key_module_5.v" "C:/Users/ljl19/L.RUD/work/verilog/button_module_6.v" "C:/Users/ljl19/L.RUD/work/verilog/convert_to_alu_7.v" "C:/Users/ljl19/L.RUD/work/verilog/move_8.v" "C:/Users/ljl19/L.RUD/work/verilog/reset_conditioner_9.v" "C:/Users/ljl19/L.RUD/work/verilog/edge_detector_10.v" "C:/Users/ljl19/L.RUD/work/verilog/counter_11.v" "C:/Users/ljl19/L.RUD/work/verilog/pn_gen_12.v" "C:/Users/ljl19/L.RUD/work/verilog/adder_13.v" "C:/Users/ljl19/L.RUD/work/verilog/bool_14.v" "C:/Users/ljl19/L.RUD/work/verilog/shft_15.v" "C:/Users/ljl19/L.RUD/work/verilog/comp_16.v" "C:/Users/ljl19/L.RUD/work/verilog/nv_17.v" "C:/Users/ljl19/L.RUD/work/verilog/decoder_18.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/ljl19/L.RUD/constraint/custom.ucf" "C:/Users/ljl19/L.RUD/constraint/io_shield.ucf" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/mojo.ucf" ]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
