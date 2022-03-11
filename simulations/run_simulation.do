vlib work
vcom -work work ../vhdl/multiplexer.vhd 
vcom -work work ../vhdl/multi_tb.vhd 
vsim work.multi_tb
add wave A
add wave B
add wave Q
add wave S
add wave clk
add wave rst
run -all
run 1000ns
wave zoom full