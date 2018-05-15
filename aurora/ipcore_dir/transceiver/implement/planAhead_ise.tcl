##############################################################################
## (c) Copyright 2004 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.
## 
## 
##############################################################################
set projDir [file dirname [info script]]
set projName results
set topName transceiver_example_design
set device xc5vfx70t-2ff1136

if {[file exists $projDir/$projName]} {
# if the project directory exists, delete it and create a new clean one
file delete -force $projDir/$projName
}

create_project $projName $projDir/$projName -part $device

set_property design_mode RTL [get_filesets sources_1]

## Source files
 
#Aurora Lane Modules
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_err_detect.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_lane_init_sm.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_sym_dec.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_sym_gen.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_aurora_lane.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_chbond_count_dec.v
#Global Logic Modules
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_channel_err_detect.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_channel_init_sm.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_idle_and_ver_gen.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_global_logic.v
#TX_LL Logic Modules
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_tx_ll_control.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_tx_ll_datapath.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_tx_ll.v
#RX_LL Pdu Modules
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_rx_ll_pdu_datapath.v
#RX_LL top level
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../src/transceiver_rx_ll.v
#Clock Module
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/clock_module/transceiver_clock_module.v
#GTX Wrapper
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/gt/transceiver_transceiver_wrapper.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/gt/transceiver_tile.v
#Top Level Files
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../../transceiver.v
#end AURORA_MODULE list
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/traffic_gen_check/transceiver_frame_gen.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/traffic_gen_check/transceiver_frame_check.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/cc_manager/transceiver_standard_cc_module.v
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/transceiver_reset_logic.v 
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/../example_design/transceiver_example_design.v 

import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/icon.ngc
import_files -fileset [get_filesets sources_1] -force -norecurse $projDir/vio.ngc

#UCF file
import_files -fileset [get_filesets constrs_1] -force -norecurse $projDir/../example_design/transceiver_example_design.ucf

set_property top $topName [get_property srcset [current_run]]

##-----------------------------Run Synthesis-------------------------------------
set_property flow {XST 13} [get_runs synth_1]
launch_runs -runs synth_1
wait_on_run synth_1

##-----------------------------Run Implementation followed by Bitgen-------------------------------------
set_property flow {ISE 13} [get_runs impl_1]

launch_runs -runs impl_1
wait_on_run impl_1

## Run BitGen
set_property add_step Bitgen [get_runs impl_1]
launch_runs -runs impl_1
wait_on_run impl_1

puts "INFO:Implementation is complete for transceiver_example_design"
puts "INFO:Refer results directory for implementation results" 
