analyze -library WORK -format vhdl {/home/xzhong/E3540/vhdl/InstructionSet.vhd /home/xzhong/E3540/vhdl/ALU.vhd /home/xzhong/E3540/vhdl/FSM.vhd /home/xzhong/E3540/vhdl/MUX.vhd /home/xzhong/E3540/vhdl/RAM.vhd /home/xzhong/E3540/vhdl/microcontroller_interface.vhd}
elaborate MICROCONTROLLER_INTERFACE -architecture STRUCT -library WORK -parameters "depth = 8, length = 8"
set_operating_conditions -library slow_vdd1v0 PVT_0P9V_125C
change_selection [all_inputs]
# set_driving_cell  -lib_cell INVX1LVT  { {instruction_in[10]} {instruction_in[9]} {PC_tot[13]} {PC_tot[20]} {PC_tot[7]} {instruction_in[5]} {PC_tot[17]} {PC_tot[3]} {PC_tot[24]} {PC_tot[28]} {instruction_in[2]} {PC_tot[10]} {instruction_in[11]} {PC_tot[14]} {PC_tot[21]} {PC_tot[8]} {instruction_in[6]} {PC_tot[18]} {PC_tot[25]} {PC_tot[4]} {PC_tot[29]} {PC_tot[0]} {PC_tot[11]} {instruction_in[12]} {instruction_in[7]} {PC_tot[15]} instr_wr {PC_tot[22]} {instruction_in[3]} {PC_tot[19]} {PC_tot[26]} {PC_tot[9]} {PC_tot[30]} clk {PC_tot[5]} {instruction_in[13]} {instruction_in[0]} {PC_tot[1]} {PC_tot[12]}   {instruction_in[8]} {PC_tot[16]} {instruction_in[4]} {PC_tot[31]} {PC_tot[23]} {PC_tot[6]} {PC_tot[27]} {PC_tot[2]} {instruction_in[1]} }
set_driving_cell  -lib_cell INVX1LVT  { {instruction_in[8]} instr_wr {PC_tot[3]} {instruction_in[1]} {PC_tot[5]} {instruction_in[4]} {instruction_in[11]} {instruction_in[6]} {instruction_in[0]} {PC_tot[1]} {PC_tot[4]} clk {instruction_in[7]} {instruction_in[2]} rst {PC_tot[6]} {instruction_in[13]} {instruction_in[9]} {instruction_in[12]} {PC_tot[0]} {PC_tot[7]} {instruction_in[3]} {instruction_in[10]} {PC_tot[2]} {instruction_in[5]} }
change_selection [all_outputs]
set_load 0.001000 [get_ports "resultOutMemSPI[2]"]
set_load 0.001000 [get_ports "statusOutSPI[2]"]
set_load 0.001000 [get_ports "addrSPI[1]"]
set_load 0.001000 [get_ports "addrSPI[3]"]
set_load 0.001000 [get_ports "resultOutMemSPI[0]"]
set_load 0.001000 [get_ports "addrSPI[5]"]
set_load 0.001000 [get_ports "resultOutMemSPI[7]"]
set_load 0.001000 [get_ports "resultOutMemSPI[6]"]
set_load 0.001000 [get_ports "addrSPI[0]"]
set_load 0.001000 [get_ports "addrSPI[7]"]
set_load 0.001000 [get_ports "opcode_status[0]"]
set_load 0.001000 [get_ports "resultOutMemSPI[4]"]
set_load 0.001000 [get_ports "addrSPI[2]"]
set_load 0.001000 [get_ports "addrSPI[4]"]
set_load 0.001000 [get_ports "resultOutMemSPI[1]"]
set_load 0.001000 [get_ports "statusOutSPI[1]"]
set_load 0.001000 [get_ports "addrSPI[6]"]
set_load 0.001000 [get_ports "opcode_status[1]"]
set_load 0.001000 [get_ports "resultOutMemSPI[5]"]
set_load 0.001000 [get_ports "statusOutSPI[0]"]
set_load 0.001000 [get_ports "resultOutMemSPI[3]"]
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
set_clock_uncertainty -setup 1 clk
set_clock_transition 0.1 clk

set_input_delay -clock clk  -max -rise 2 "{instruction_in[8]} instr_wr {PC_tot[3]} {instruction_in[1]} {PC_tot[5]} {instruction_in[4]} {instruction_in[11]} {instruction_in[6]} {instruction_in[0]} {PC_tot[1]} {PC_tot[4]} {instruction_in[7]} {instruction_in[2]} {PC_tot[6]} {instruction_in[9]} {instruction_in[13]} {instruction_in[12]} {PC_tot[0]} {instruction_in[3]} {PC_tot[7]} {instruction_in[10]} {PC_tot[2]} {instruction_in[5]}"
set_input_delay -clock clk -max -fall 2 "{instruction_in[8]} instr_wr {PC_tot[3]} {instruction_in[1]} {PC_tot[5]} {instruction_in[4]} {instruction_in[11]} {instruction_in[6]} {instruction_in[0]} {PC_tot[1]} {PC_tot[4]} {instruction_in[7]} {instruction_in[2]} {PC_tot[6]} {instruction_in[9]} {instruction_in[13]} {instruction_in[12]} {PC_tot[0]} {instruction_in[3]} {PC_tot[7]} {instruction_in[10]} {PC_tot[2]} {instruction_in[5]}"
set_input_delay -clock clk -min -rise 2 "{instruction_in[8]} instr_wr {PC_tot[3]} {instruction_in[1]} {PC_tot[5]} {instruction_in[4]} {instruction_in[11]} {instruction_in[6]} {instruction_in[0]} {PC_tot[1]} {PC_tot[4]} {instruction_in[7]} {instruction_in[2]} {PC_tot[6]} {instruction_in[9]} {instruction_in[13]} {instruction_in[12]} {PC_tot[0]} {instruction_in[3]} {PC_tot[7]} {instruction_in[10]} {PC_tot[2]} {instruction_in[5]}"
set_input_delay -clock clk  -min -fall 2 "{instruction_in[8]} instr_wr {PC_tot[3]} {instruction_in[1]} {PC_tot[5]} {instruction_in[4]} {instruction_in[11]} {instruction_in[6]} {instruction_in[0]} {PC_tot[1]} {PC_tot[4]} {instruction_in[7]} {instruction_in[2]} {PC_tot[6]} {instruction_in[9]} {instruction_in[13]} {instruction_in[12]} {PC_tot[0]} {instruction_in[3]} {PC_tot[7]} {instruction_in[10]} {PC_tot[2]} {instruction_in[5]}"

set_output_delay -clock clk  -max -rise 2 "{resultOutMemSPI[3]} {resultOutMemSPI[2]} {statusOutSPI[2]} {addrSPI[1]} {addrSPI[3]} {resultOutMemSPI[0]} {addrSPI[5]} {resultOutMemSPI[7]} {resultOutMemSPI[6]} {addrSPI[0]} {addrSPI[7]} {opcode_status[0]} {resultOutMemSPI[4]} {addrSPI[2]} {addrSPI[4]} {resultOutMemSPI[1]} {statusOutSPI[1]} {addrSPI[6]} {opcode_status[1]} {resultOutMemSPI[5]} {statusOutSPI[0]}"
set_output_delay -clock clk -max -fall 2 "{resultOutMemSPI[3]} {resultOutMemSPI[2]} {statusOutSPI[2]} {addrSPI[1]} {addrSPI[3]} {resultOutMemSPI[0]} {addrSPI[5]} {resultOutMemSPI[7]} {resultOutMemSPI[6]} {addrSPI[0]} {addrSPI[7]} {opcode_status[0]} {resultOutMemSPI[4]} {addrSPI[2]} {addrSPI[4]} {resultOutMemSPI[1]} {statusOutSPI[1]} {addrSPI[6]} {opcode_status[1]} {resultOutMemSPI[5]} {statusOutSPI[0]}"
set_output_delay -clock clk -min -rise 2 "{resultOutMemSPI[3]} {resultOutMemSPI[2]} {statusOutSPI[2]} {addrSPI[1]} {addrSPI[3]} {resultOutMemSPI[0]} {addrSPI[5]} {resultOutMemSPI[7]} {resultOutMemSPI[6]} {addrSPI[0]} {addrSPI[7]} {opcode_status[0]} {resultOutMemSPI[4]} {addrSPI[2]} {addrSPI[4]} {resultOutMemSPI[1]} {statusOutSPI[1]} {addrSPI[6]} {opcode_status[1]} {resultOutMemSPI[5]} {statusOutSPI[0]}"
set_output_delay -clock clk  -min -fall 2 "{resultOutMemSPI[3]} {resultOutMemSPI[2]} {statusOutSPI[2]} {addrSPI[1]} {addrSPI[3]} {resultOutMemSPI[0]} {addrSPI[5]} {resultOutMemSPI[7]} {resultOutMemSPI[6]} {addrSPI[0]} {addrSPI[7]} {opcode_status[0]} {resultOutMemSPI[4]} {addrSPI[2]} {addrSPI[4]} {resultOutMemSPI[1]} {statusOutSPI[1]} {addrSPI[6]} {opcode_status[1]} {resultOutMemSPI[5]} {statusOutSPI[0]}"
change_selection [all_outputs]
set_max_area 0
ungroup -all -flatten
compile_ultra
change_names -rules verilog -hierarchy
write -hierarchy -format verilog -output /home/xzhong/E3540/netlist/microcontroller_interface_8_8.v
write_sdc ../timing/prelayout.sdc
uplevel #0 { report_area }
uplevel #0 { report_power -analysis_effort low }
uplevel #0 { report_constraint -all_violators -significant_digits 2 }
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 10 -significant_digits 2 -sort_by group }
design_vision -f synthesis_script.tcl