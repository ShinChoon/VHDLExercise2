###################################################################

# Created by write_sdc on Mon May 30 22:44:23 2022

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions PVT_0P9V_125C -library slow_vdd1v0
set_max_area 0
set_driving_cell -lib_cell INVX1LVT [get_ports clk]
set_driving_cell -lib_cell INVX1LVT [get_ports rst]
set_driving_cell -lib_cell INVX1LVT [get_ports instr_wr]
set_driving_cell -lib_cell INVX1LVT [get_ports {PC_tot[7]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {PC_tot[6]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {PC_tot[5]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {PC_tot[4]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {PC_tot[3]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {PC_tot[2]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {PC_tot[1]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {PC_tot[0]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[13]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[12]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[11]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[10]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[9]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[8]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[7]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[6]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[5]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[4]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[3]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[2]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[1]}]
set_driving_cell -lib_cell INVX1LVT [get_ports {instruction_in[0]}]
set_load -pin_load 0.001 [get_ports {opcode_status[1]}]
set_load -pin_load 0.001 [get_ports {opcode_status[0]}]
set_load -pin_load 0.001 [get_ports {statusOutSPI[2]}]
set_load -pin_load 0.001 [get_ports {statusOutSPI[1]}]
set_load -pin_load 0.001 [get_ports {statusOutSPI[0]}]
set_load -pin_load 0.001 [get_ports {resultOutMemSPI[7]}]
set_load -pin_load 0.001 [get_ports {resultOutMemSPI[6]}]
set_load -pin_load 0.001 [get_ports {resultOutMemSPI[5]}]
set_load -pin_load 0.001 [get_ports {resultOutMemSPI[4]}]
set_load -pin_load 0.001 [get_ports {resultOutMemSPI[3]}]
set_load -pin_load 0.001 [get_ports {resultOutMemSPI[2]}]
set_load -pin_load 0.001 [get_ports {resultOutMemSPI[1]}]
set_load -pin_load 0.001 [get_ports {resultOutMemSPI[0]}]
set_load -pin_load 0.001 [get_ports {addrSPI[7]}]
set_load -pin_load 0.001 [get_ports {addrSPI[6]}]
set_load -pin_load 0.001 [get_ports {addrSPI[5]}]
set_load -pin_load 0.001 [get_ports {addrSPI[4]}]
set_load -pin_load 0.001 [get_ports {addrSPI[3]}]
set_load -pin_load 0.001 [get_ports {addrSPI[2]}]
set_load -pin_load 0.001 [get_ports {addrSPI[1]}]
set_load -pin_load 0.001 [get_ports {addrSPI[0]}]
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_uncertainty -setup 1  [get_clocks clk]
set_clock_transition -max -rise 0.1 [get_clocks clk]
set_clock_transition -max -fall 0.1 [get_clocks clk]
set_clock_transition -min -rise 0.1 [get_clocks clk]
set_clock_transition -min -fall 0.1 [get_clocks clk]
set_input_delay -clock clk  2  [get_ports {instruction_in[8]}]
set_input_delay -clock clk  2  [get_ports instr_wr]
set_input_delay -clock clk  2  [get_ports {PC_tot[3]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[1]}]
set_input_delay -clock clk  2  [get_ports {PC_tot[5]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[4]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[11]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[6]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[0]}]
set_input_delay -clock clk  2  [get_ports {PC_tot[1]}]
set_input_delay -clock clk  2  [get_ports {PC_tot[4]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[7]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[2]}]
set_input_delay -clock clk  2  [get_ports {PC_tot[6]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[9]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[13]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[12]}]
set_input_delay -clock clk  2  [get_ports {PC_tot[0]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[3]}]
set_input_delay -clock clk  2  [get_ports {PC_tot[7]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[10]}]
set_input_delay -clock clk  2  [get_ports {PC_tot[2]}]
set_input_delay -clock clk  2  [get_ports {instruction_in[5]}]
set_output_delay -clock clk  2  [get_ports {resultOutMemSPI[3]}]
set_output_delay -clock clk  2  [get_ports {resultOutMemSPI[2]}]
set_output_delay -clock clk  2  [get_ports {statusOutSPI[2]}]
set_output_delay -clock clk  2  [get_ports {addrSPI[1]}]
set_output_delay -clock clk  2  [get_ports {addrSPI[3]}]
set_output_delay -clock clk  2  [get_ports {resultOutMemSPI[0]}]
set_output_delay -clock clk  2  [get_ports {addrSPI[5]}]
set_output_delay -clock clk  2  [get_ports {resultOutMemSPI[7]}]
set_output_delay -clock clk  2  [get_ports {resultOutMemSPI[6]}]
set_output_delay -clock clk  2  [get_ports {addrSPI[0]}]
set_output_delay -clock clk  2  [get_ports {addrSPI[7]}]
set_output_delay -clock clk  2  [get_ports {opcode_status[0]}]
set_output_delay -clock clk  2  [get_ports {resultOutMemSPI[4]}]
set_output_delay -clock clk  2  [get_ports {addrSPI[2]}]
set_output_delay -clock clk  2  [get_ports {addrSPI[4]}]
set_output_delay -clock clk  2  [get_ports {resultOutMemSPI[1]}]
set_output_delay -clock clk  2  [get_ports {statusOutSPI[1]}]
set_output_delay -clock clk  2  [get_ports {addrSPI[6]}]
set_output_delay -clock clk  2  [get_ports {opcode_status[1]}]
set_output_delay -clock clk  2  [get_ports {resultOutMemSPI[5]}]
set_output_delay -clock clk  2  [get_ports {statusOutSPI[0]}]