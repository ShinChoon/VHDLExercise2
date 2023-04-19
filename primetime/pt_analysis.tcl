read_verilog ../netlist/microcontroller_interface_8_8_layout.v
set search_path "../techlibs/"
set link_library "slow.db"
link_design
source "../timing/postlayout.sdc"
read_parasitics "../timing/microcontroller_interface_8_8.spef"
report_constraint -all_violators > "./reports/setup_viol.rpt"
report_timing -delay_type max -max_paths 10 -slack_lesser_than 10 > "./reports/setup_check.rpt"
set power_enable_analysis true
report_power -verbose > "./reports/setup_power.rpt"
set link_library "fast.db"
link_design
source "../timing/postlayout.sdc"
read_parasitics "../timing/microcontroller_interface_8_8.spef"
report_constraint -all_violators > "./reports/hold_viol.rpt"
report_timing -delay_type min -max_paths 10 -slack_lesser_than 10  > "./reports/hold_check.rpt"
report_power -verbose > "./reports/hold_power.rpt"
exit

