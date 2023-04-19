set_svf -append { /home/xzhong/E3540/synthesis/default.svf } 

read_vhdl -container r -libname WORK -93 { /home/xzhong/E3540/vhdl/ALU.vhd /home/xzhong/E3540/vhdl/FSM.vhd /home/xzhong/E3540/vhdl/InstructionSet.vhd /home/xzhong/E3540/vhdl/microcontroller_interface.vhd /home/xzhong/E3540/vhdl/MUX.vhd /home/xzhong/E3540/vhdl/RAM.vhd } 

set_top r:/WORK/microcontroller_interface 

read_verilog -container i -libname WORK -05 { /home/xzhong/E3540/netlist/microcontroller_interface_8_8.v } 

read_db -container i { /home/xzhong/E3540/techlibs/slow.db } 

set_top i:/WORK/microcontroller_interface_8_8 

match 
verify 

