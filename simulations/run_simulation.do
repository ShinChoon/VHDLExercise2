vlib work
vcom -work work ../vhdl/InstructionSet.vhd 
vcom -work work ../vhdl/ALU.vhd 
vcom -work work ../vhdl/RAM.vhd
vcom -work work ../vhdl/MUX.vhd 
vcom -work work ../vhdl/FSM.vhd 
vcom -work work ../vhdl/ALU_tb.vhd 
vsim work.ALU_tb
add wave A
#add wave result

add wave op_wr
add wave instr_wr
add wave resultOutReg
add wave resultOutMem
add wave resultALU
add wave output_lit
add wave input_select
add wave addr
add wave instruction_out
add wave instruction_in
add wave clk
run -all
run 1000ns
wave zoom full
