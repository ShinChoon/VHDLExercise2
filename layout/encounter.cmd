#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Tue May 24 19:38:35 2022                
#                                                     
#######################################################

#@(#)CDS: Encounter v14.28-s033_1 (64bit) 03/21/2016 13:34 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute v14.28-s005 NR160313-1959/14_28-UB (database version 2.30, 267.6.1) {superthreading v1.25}
#@(#)CDS: CeltIC v14.28-s006_1 (64bit) 03/08/2016 00:08:23 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 14.28-s002 (64bit) 03/21/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 14.28-s007_1 (64bit) Mar  7 2016 23:11:05 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v14.28-s006
#@(#)CDS: IQRC/TQRC 14.2.2-s217 (64bit) Wed Apr 15 23:10:24 PDT 2015 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_gnd_net vss!
set init_lef_file {../techlibs/gsclib045_tech.lef ../techlibs/gsclib045_macro.lef}
set init_design_settop 0
set init_verilog ../netlist/serial_peripheral_interface.v
set init_mmmc_file Default.view
set init_pwr_net vdd!
init_design
fit
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site CoreSite -r 0.992807867312 0.699991 15 15 15 15
uiSetTool select
getIoFlowFlag
fit
getPinAssignMode -pinEditInBatch -quiet
getPinAssignMode -pinEditInBatch -quiet
windowSelect -144.784 277.455 -18.294 265.339
fit