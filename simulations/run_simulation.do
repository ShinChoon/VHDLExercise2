<<<<<<< HEAD
<<<<<<< HEAD
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
=======
# QUESTASIM SIMULATION SCRIPT
# Created by Enrico Roverato on 23.03.2016
# Edited by Ilia Kempi on 10.02.2020
#
# This is an example TCL script to run a simulation in QuestaSim. You may modify it according to your own needs.
# The script can be run in either of these two ways:
# 1) from QuestaSim's console, by typing "source run_simulation.tcl"
# 2) from Unix terminal, by starting QuestaSim with the -do option: "vsim -do run_simulation.tcl"
#
# The complete documentation of QuestaSim's supported commands can be found at:
# ${MGC_AMS_HOME}/docs/pdfdocs/questa_sim_ref.pdf


# create work library (if not existing)
=======
>>>>>>> 8021808 (cleaned the code)
vlib work
vcom -work work ../vhdl/orgate.vhd 

vsim work.orgate
add wave a
add wave b
add wave c
run -all
wave zoom full
>>>>>>> f496601 (populated placeholders)
