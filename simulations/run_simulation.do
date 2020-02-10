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
vlib work

# (example) compile files into work library:
# - all VHDL files from folder ../vhdl
# - file "sim_testbench.vhd" from current folder
# vcom -2008 -work work ../vhdl/*.vhd sim_testbench

# compile multiplexer entity:
vcom -2008 -work work ../vhdl/multiplexer.vhd 

# initialize simulation
vsim work.multiplexer

# (example) add signals to wave window, different radix can be used
# add wave sig1
# add wave -decimal sig2
# add wave -unsigned dut:sig3

# add all waves in default radix
add wave *

# # run simulation for 80 us
# run 80 us

# run simulation till the end
run -all

# zoom out to full wave
wave zoom full
