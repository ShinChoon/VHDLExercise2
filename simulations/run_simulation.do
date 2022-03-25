vlib work
vcom -work work ../vhdl/InstructionSet.vhd 
vcom -work work ../vhdl/ALU.vhd 
vcom -work work ../vhdl/ALU_tb.vhd 
vsim work.ALU_tb
 add wave A
 add wave B
 add wave bit_select
 add wave result
# add wave clk
 add wave status_out
run -all
run 1000ns
wave zoom full
