#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Tue May 24 23:06:53 2022                
#                                                     
#######################################################

#@(#)CDS: Innovus v18.10-p002_1 (64bit) 05/29/2018 19:19 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 18.10-p002_1 NR180522-1057/18_10-UB (database version 2.30, 418.7.1) {superthreading v1.46}
#@(#)CDS: AAE 18.10-p004 (64bit) 05/29/2018 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 18.10-p003_1 () May 15 2018 10:23:07 ( )
#@(#)CDS: SYNTECH 18.10-a012_1 () Apr 19 2018 01:27:21 ( )
#@(#)CDS: CPE v18.10-p005
#@(#)CDS: IQRC/TQRC 18.1.1-s118 (64bit) Fri Mar 23 17:23:45 PDT 2018 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_lef_file {../techlibs/gsclib045_tech.lef ../techlibs/gsclib045_macro.lef}
set init_design_settop 0
set init_verilog ../netlist/serial_peripheral_interface.v
set init_mmmc_file Default.view
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site CoreSite -r 0.992807867312 0.699991 15 15 15 15
uiSetTool select
getIoFlowFlag
fit
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 0.2 -pin {{addrSPI[0]} {addrSPI[1]} {addrSPI[2]} {addrSPI[3]} {addrSPI[4]} {addrSPI[5]} {addrSPI[6]} {addrSPI[7]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.08 -pinDepth 0.25 -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 0.2 -pin {{addrSPI[0]} {addrSPI[1]} {addrSPI[2]} {addrSPI[3]} {addrSPI[4]} {addrSPI[5]} {addrSPI[6]} {addrSPI[7]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 10 -pin {clk instr_wr rst}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.06 -pinDepth 0.335 -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 10.0 -pin {clk instr_wr rst}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.08 -pinDepth 0.335 -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 10.0 -pin {clk instr_wr rst}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 3 -spreadType center -spacing 0.2 -pin {{addrSPI[0]} {addrSPI[1]} {addrSPI[2]} {addrSPI[3]} {addrSPI[4]} {addrSPI[5]} {addrSPI[6]} {addrSPI[7]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 10.0 -pin {clk instr_wr rst}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 4 -spreadType center -spacing 0.2 -pin {{statusOutSPI[0]} {statusOutSPI[1]} {statusOutSPI[2]} {opcode_status[0]} {opcode_status[1]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right -layer 3 -spreadType center -spacing 10 -pin {{instruction_in[0]} {instruction_in[1]} {instruction_in[2]} {instruction_in[3]} {instruction_in[4]} {instruction_in[5]} {instruction_in[6]} {instruction_in[7]} {instruction_in[8]} {instruction_in[9]} {instruction_in[10]} {instruction_in[11]} {instruction_in[12]} {instruction_in[13]} {resultOutMemSPI[0]} {resultOutMemSPI[1]} {resultOutMemSPI[2]} {resultOutMemSPI[3]} {resultOutMemSPI[4]} {resultOutMemSPI[5]} {resultOutMemSPI[6]} {resultOutMemSPI[7]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Top -layer 4 -spreadType center -spacing 0.2 -pin {{PC_tot[0]} {PC_tot[1]} {PC_tot[2]} {PC_tot[3]} {PC_tot[4]} {PC_tot[5]} {PC_tot[6]} {PC_tot[7]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.08 -pinDepth 0.25 -fixedPin 1 -snap MGRID -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Top -layer 3 -spreadType center -spacing 0.2 -pin {{addrSPI[0]} {addrSPI[1]} {addrSPI[2]} {addrSPI[3]} {addrSPI[4]} {addrSPI[5]} {addrSPI[6]} {addrSPI[7]}}
setPinAssignMode -pinEditInBatch false
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {vdd! vss!} -type core_rings -follow core -layer {top Metal9 bottom Metal9 left Metal8 right Metal8} -width {top 4.5 bottom 4.5 left 4.5 right 4.5} -spacing {top 2 bottom 2 left 2 right 2} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {vdd! vss!} -layer Metal8 -direction vertical -width 4.5 -spacing 2 -number_of_sets 3 -start_from left -start_offset 0 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
clearGlobalNets
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
globalNetConnect vss! -type pgpin -pin VSS -instanceBasename * -hierarchicalInstance {}
clearGlobalNets
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
globalNetConnect vss! -type pgpin -pin VSS -instanceBasename * -hierarchicalInstance {}
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { corePin } -layerChangeRange { Metal1(1) Metal11(11) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { Metal1(1) Metal11(11) } -nets { vdd! vss! } -allowLayerChange 1 -targetViaLayerRange { Metal1(1) Metal11(11) }
fit
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {vdd! vss!} -layer Metal8 -direction vertical -width 4.5 -spacing 2 -number_of_sets 3 -start_from left -start_offset 0 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {vdd! vss!} -layer Metal8 -direction vertical -width 4.5 -spacing 2 -number_of_sets 3 -start_from left -start_offset 0 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
clearGlobalNets
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
globalNetConnect vss! -type pgpin -pin VSS -instanceBasename * -hierarchicalInstance {}
clearGlobalNets
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
globalNetConnect vss! -type pgpin -pin VSS -instanceBasename * -hierarchicalInstance {}
clearGlobalNets
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
globalNetConnect vss! -type pgpin -pin VSS -instanceBasename * -hierarchicalInstance {}
clearGlobalNets
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
globalNetConnect vss! -type pgpin -pin VSS -instanceBasename * -hierarchicalInstance {}
clearGlobalNets
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
globalNetConnect vss! -type pgpin -pin VSS -instanceBasename * -hierarchicalInstance {}
clearGlobalNets
globalNetConnect vdd! -type pgpin -pin VDD -instanceBasename * -hierarchicalInstance {}
globalNetConnect vss! -type pgpin -pin VSS -instanceBasename * -hierarchicalInstance {}
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {vdd! vss!} -type core_rings -follow core -layer {top Metal9 bottom Metal9 left Metal8 right Metal8} -width {top 4.5 bottom 4.5 left 4.5 right 4.5} -spacing {top 2 bottom 2 left 2 right 2} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
