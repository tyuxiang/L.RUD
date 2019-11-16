set projDir "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/planAhead"
set projName "LRUD"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/mojo_top_0.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/new_alu_1.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/led_module_2.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/check_player_module_3.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/check_step_module_4.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/answer_key_module_5.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/button_module_6.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/convert_to_alu_7.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/move_8.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/reset_conditioner_9.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/edge_detector_10.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/counter_11.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/pn_gen_12.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/adder_13.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/bool_14.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/shft_15.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/comp_16.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/nv_17.v" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/work/verilog/decoder_18.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/constraint/io_shield.ucf" "D:/Programs/Alchitry/Alchitry-labs/Workspace/LRUD/constraint/custom.ucf" "D:/Programs/Alchitry/Alchitry-labs/library/components/mojo.ucf" ]
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
