if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name fast_libs\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast.lib]
create_library_set -name slow_libs\
   -timing\
    [list ${::IMEX::libVar}/mmmc/slow.lib]
create_rc_corner -name rc_basic\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/rc_basic/qrcTechFile
create_delay_corner -name slow_corner\
   -library_set slow_libs\
   -rc_corner rc_basic
create_delay_corner -name fast_corner\
   -library_set fast_libs\
   -rc_corner rc_basic
create_constraint_mode -name constraint_basic\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/constraint_basic/constraint_basic.sdc]
create_analysis_view -name setup_view -constraint_mode constraint_basic -delay_corner slow_corner -latency_file ${::IMEX::dataVar}/mmmc/views/setup_view/latency.sdc
create_analysis_view -name hold_view -constraint_mode constraint_basic -delay_corner fast_corner -latency_file ${::IMEX::dataVar}/mmmc/views/hold_view/latency.sdc
set_analysis_view -setup [list setup_view] -hold [list hold_view]
