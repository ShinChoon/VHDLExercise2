set_svf -append { /home/xzhong/E3540/synthesis/default.svf } 

read_verilog -container r -libname WORK -05 { /home/xzhong/E3540/netlist/microcontroller_interface_8_8.v } 

read_db -container r { /home/xzhong/E3540/techlibs/slow.db } 

set_top r:/WORK/microcontroller_interface_8_8 

read_verilog -container i -libname WORK -05 { /home/xzhong/E3540/netlist/microcontroller_interface_8_8_layout.v } 

set_top i:/WORK/microcontroller_interface_8_8 

read_db { /home/xzhong/E3540/techlibs/slow.db } 

read_verilog -container i -libname WORK -05 { /home/xzhong/E3540/netlist/microcontroller_interface_8_8_layout.v } 

set_top i:/WORK/microcontroller_interface_8_8 

match 
verify 

