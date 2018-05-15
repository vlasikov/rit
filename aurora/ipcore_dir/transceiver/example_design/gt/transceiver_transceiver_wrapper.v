///////////////////////////////////////////////////////////////////////////////
// (c) Copyright 2008 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// 
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 7.1i
//  \   \         Application : 
//  /   /         Filename : transceiver_GTX_WRAPPER.v
// /___/   /\     Timestamp : 02/08/2005 09:12:43
// \   \  /  \ 
//  \___\/\___\ 
//
////////////////////////////////////////////////////////////////////////////////
//Command: 
//Design Name: transceiver_GTX_WRAPPER
//
// Module transceiver_GTX_WRAPPER
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
(* core_generation_info = "transceiver,aurora_8b10b_v5_3,{user_interface=Legacy_LL, backchannel_mode=Sidebands, c_aurora_lanes=1, c_column_used=left, c_gt_clock_1=GTXD0, c_gt_clock_2=None, c_gt_loc_1=1, c_gt_loc_10=X, c_gt_loc_11=X, c_gt_loc_12=X, c_gt_loc_13=X, c_gt_loc_14=X, c_gt_loc_15=X, c_gt_loc_16=X, c_gt_loc_17=X, c_gt_loc_18=X, c_gt_loc_19=X, c_gt_loc_2=X, c_gt_loc_20=X, c_gt_loc_21=X, c_gt_loc_22=X, c_gt_loc_23=X, c_gt_loc_24=X, c_gt_loc_25=X, c_gt_loc_26=X, c_gt_loc_27=X, c_gt_loc_28=X, c_gt_loc_29=X, c_gt_loc_3=X, c_gt_loc_30=X, c_gt_loc_31=X, c_gt_loc_32=X, c_gt_loc_33=X, c_gt_loc_34=X, c_gt_loc_35=X, c_gt_loc_36=X, c_gt_loc_37=X, c_gt_loc_38=X, c_gt_loc_39=X, c_gt_loc_4=X, c_gt_loc_40=X, c_gt_loc_41=X, c_gt_loc_42=X, c_gt_loc_43=X, c_gt_loc_44=X, c_gt_loc_45=X, c_gt_loc_46=X, c_gt_loc_47=X, c_gt_loc_48=X, c_gt_loc_5=X, c_gt_loc_6=X, c_gt_loc_7=X, c_gt_loc_8=X, c_gt_loc_9=X, c_lane_width=2, c_line_rate=1.0, c_nfc=false, c_nfc_mode=IMM, c_refclk_frequency=100.0, c_simplex=false, c_simplex_mode=TX, c_stream=false, c_ufc=false, flow_mode=None, interface_mode=Framing, dataflow_config=Duplex}" *)
module transceiver_GTX_WRAPPER #
(
    // Simulation attributes
    parameter   SIM_MODE              =   "FAST",  // Set to Fast Functional Simulation Model
    parameter   SIM_GTXRESET_SPEEDUP=   0,      // Set to 1 to speed up sim reset
    parameter   SIM_PLL_PERDIV2     =   9'h0fa,    // Set to the VCO Unit Interval time

    parameter  CHAN_BOND_LEVEL_0 = 0,
    parameter  CHAN_BOND_LEVEL_1 = 0,

    // Channel bond MASTER/SLAVE connection
    parameter CHAN_BOND_MODE_0      = "OFF",
    parameter CHAN_BOND_MODE_1      = "OFF",
    // Refclk attributes
    parameter   CLKINDC_B           =   "TRUE"
)
(

//---------------------- Loopback and Powerdown Ports ----------------------
   LOOPBACK_IN,
//--------------------- Receive Ports - 8b10b Decoder ----------------------
    RXCHARISCOMMA_OUT,
    RXCHARISK_OUT,
    RXDISPERR_OUT,
    RXNOTINTABLE_OUT,
//----------------- Receive Ports - Channel Bonding Ports -----------------
    ENCHANSYNC_IN,
    CHBONDDONE_OUT,
//----------------- Receive Ports - Clock Correction Ports -----------------
    RXBUFERR_OUT,
//------------- Receive Ports - Comma Detection and Alignment --------------
    RXREALIGN_OUT,
    ENMCOMMAALIGN_IN,
    ENPCOMMAALIGN_IN,
//----------------- Receive Ports - RX Data Path interface -----------------
    RXDATA_OUT,
    RXRECCLK1_OUT,
    RXRECCLK2_OUT,
    RXRESET_IN,
    RXUSRCLK_IN,
    RXUSRCLK2_IN,
//----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    RX1N_IN,
    RX1P_IN,
//--------------- Receive Ports - RX Polarity Control Ports ----------------
    RXPOLARITY_IN,
//------------------- Shared Ports - Tile and PLL Ports --------------------
    REFCLK,
    GTXRESET_IN,
    PLLLKDET_OUT,
    REFCLKOUT_OUT,
//-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
    TXCHARISK_IN,
//---------------- Transmit Ports - TX Data Path interface -----------------
    TXDATA_IN,
    TXOUTCLK1_OUT,
    TXOUTCLK2_OUT,
    TXRESET_IN,
    TXUSRCLK_IN,
    TXUSRCLK2_IN,
    TXBUFERR_OUT,
//------------- Transmit Ports - TX Driver and OOB signalling --------------
    TX1N_OUT,
    TX1P_OUT,

 

  
    RXCHARISCOMMA_OUT_unused,
    RXCHARISK_OUT_unused,
    RXDISPERR_OUT_unused,
    RXNOTINTABLE_OUT_unused,
//----------------- Receive Ports - Channel Bonding Ports -----------------
    RXREALIGN_OUT_unused,
    RXDATA_OUT_unused,
    RX1N_IN_unused,
    RX1P_IN_unused,
    TX1N_OUT_unused,
    TX1P_OUT_unused,

    RXBUFERR_OUT_unused,
    TXBUFERR_OUT_unused,
    CHBONDDONE_OUT_unused,



    POWERDOWN_IN
);
//***************************** Port Declarations *****************************
//---------------------- Loopback and Powerdown Ports ----------------------
 input    [2:0]    LOOPBACK_IN;
//--------------------- Receive Ports - 8b10b Decoder ----------------------
 output   [1:0]    RXCHARISCOMMA_OUT; 
 output   [1:0]    RXCHARISK_OUT; 
 output   [1:0]    RXDISPERR_OUT;
 output   [1:0]    RXNOTINTABLE_OUT;
//----------------- Receive Ports - Channel Bonding Ports -----------------
 
 input             ENCHANSYNC_IN; 
 output            CHBONDDONE_OUT;
//----------------- Receive Ports - Clock Correction Ports -----------------
 output            RXBUFERR_OUT;
//------------- Receive Ports - Comma Detection and Alignment --------------
 output            RXREALIGN_OUT;
 input             ENMCOMMAALIGN_IN;
 input             ENPCOMMAALIGN_IN;
//----------------- Receive Ports - RX Data Path interface -----------------
 output   [15:0]   RXDATA_OUT; 
 output            RXRECCLK1_OUT;
 output            RXRECCLK2_OUT;
 input             RXRESET_IN;
  input             RXUSRCLK_IN;
 input             RXUSRCLK2_IN;
//----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
 
 input             RX1N_IN;  
 input             RX1P_IN;  
//--------------- Receive Ports - RX Polarity Control Ports ----------------
 input             RXPOLARITY_IN;
//------------------- Shared Ports - Tile and PLL Ports --------------------
 input             REFCLK;
 input             GTXRESET_IN;
 output            PLLLKDET_OUT;
 input             POWERDOWN_IN;
 output            REFCLKOUT_OUT;
//-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
 input    [1:0]    TXCHARISK_IN; 
//---------------- Transmit Ports - TX Data Path interface -----------------
 input    [15:0]   TXDATA_IN; 
 output            TXOUTCLK1_OUT;
 output            TXOUTCLK2_OUT;
 input             TXRESET_IN;
 output            TXBUFERR_OUT;
 input             TXUSRCLK_IN;
 input             TXUSRCLK2_IN;
//------------- Transmit Ports - TX Driver and OOB signalling --------------
 output            TX1N_OUT;
 output            TX1P_OUT;

 

  
   output   [1:0]    RXCHARISCOMMA_OUT_unused; 
   output   [1:0]    RXCHARISK_OUT_unused; 
   output   [1:0]    RXDISPERR_OUT_unused;
   output   [1:0]    RXNOTINTABLE_OUT_unused;
//------------- Receive Ports - Comma Detection and Alignment --------------
   output            RXREALIGN_OUT_unused;
   output   [15:0]   RXDATA_OUT_unused; 
   input             RX1N_IN_unused;  
   input             RX1P_IN_unused;  
   output            RXBUFERR_OUT_unused;
   output            TXBUFERR_OUT_unused;
   output            CHBONDDONE_OUT_unused;
   output            TX1N_OUT_unused;
   output            TX1P_OUT_unused;



//***************************** Wire Declarations *****************************
// Ground and VCC signals
 wire               tied_to_ground_i;
 wire    [63:0]     tied_to_ground_vec_i;
 wire               tied_to_vcc_i;
 wire    [63:0]     tied_to_vcc_vec_i;
// floating input port connection signals
 wire     [1:0]    open_rxbufstatus_i;
 wire              open_txbufstatus_i;

 wire     [1:0]    open_rxbufstatus_unused_i;
 wire              open_txbufstatus_unused_i;

// wire to output lock signal
 wire              plllkdet_i;

 wire               resetdone0_i;
 wire               resetdone1_i;
// Channel Bonding 3
 wire     [3:0]    chbondi;
 wire     [3:0]    chbondo;
   
 wire     [3:0]    chbondi_unused_i;

//********************************* Main Body of Code**************************
//-------------------------  Static signal Assigments ---------------------   
 assign tied_to_ground_i             = 1'b0;
 assign tied_to_ground_vec_i         = 64'h0000000000000000;
 assign tied_to_vcc_i                = 1'b1;
 assign tied_to_vcc_vec_i            = 64'hffffffffffffffff;

// Assign lock signals
 assign  PLLLKDET_OUT  =   plllkdet_i;


 assign chbondi_unused_i  = 4'b0000;

 assign  chbondi = chbondi_unused_i;

//------------------------- GTX/GTP Instantiations  --------------------------   
 
  
//*************************************************************************************************    
//-----------------------------------EVEN GTP-----------------------------------------------
//*************************************************************************************************
TRANSCEIVER_TILE # 
    (
        //_______________________ Simulation-Only Attributes __________________
	.TILE_SIM_MODE                    (SIM_MODE),
        .TILE_SIM_GTXRESET_SPEEDUP    (SIM_GTXRESET_SPEEDUP),
        .TILE_SIM_PLL_PERDIV2             (SIM_PLL_PERDIV2),
         .TILE_CHAN_BOND_LEVEL_0          (0),
         .TILE_CHAN_BOND_LEVEL_1          (0),
         .TILE_CHAN_BOND_MODE_0           (CHAN_BOND_MODE_0),
         .TILE_CHAN_BOND_MODE_1           ("OFF")
     ) 
GTX_TILE_INST (
         //---------------------- Loopback and Powerdown Ports ----------------------
         .LOOPBACK0_IN                  (LOOPBACK_IN),
         .LOOPBACK1_IN                  (3'b000),
         //--------------------- Receive Ports - 8b10b Decoder ----------------------
         .RXCHARISCOMMA0_OUT             (RXCHARISCOMMA_OUT),
         .RXCHARISK0_OUT                 (RXCHARISK_OUT),
         .RXCHARISCOMMA1_OUT             (RXCHARISCOMMA_OUT_unused),
         .RXCHARISK1_OUT                 (RXCHARISK_OUT_unused),
         .RXDISPERR0_OUT                 (RXDISPERR_OUT),
         .RXNOTINTABLE0_OUT              (RXNOTINTABLE_OUT),
         .RXDISPERR1_OUT                 (RXDISPERR_OUT_unused),
         .RXNOTINTABLE1_OUT              (RXNOTINTABLE_OUT_unused),

         //----------------- Receive Ports - Clock Correction Ports -----------------
         .RXCLKCORCNT0_OUT              (),
         .RXCLKCORCNT1_OUT              (),
         //------------- Receive Ports - Comma Detection and Alignment --------------
         .RXBYTEREALIGN0_OUT             (RXREALIGN_OUT ),
         .RXBYTEREALIGN1_OUT             (RXREALIGN_OUT_unused),
         .RXENMCOMMAALIGN0_IN           (ENMCOMMAALIGN_IN),
         .RXENMCOMMAALIGN1_IN          (tied_to_ground_i),
         .RXENPCOMMAALIGN0_IN           (ENPCOMMAALIGN_IN),
         .RXENPCOMMAALIGN1_IN           (tied_to_ground_i),
         //----------------- Receive Ports - RX Data Path interface -----------------
         .RXDATA0_OUT                    (RXDATA_OUT),
         .RXDATA1_OUT                    (RXDATA_OUT_unused),
         .RXRESET0_IN                   (RXRESET_IN ),
         .RXRESET1_IN                   (tied_to_ground_i),
         .RXUSRCLK0_IN                  (RXUSRCLK_IN),
         .RXUSRCLK1_IN                  (tied_to_ground_i ),
         .RXUSRCLK20_IN                 (RXUSRCLK2_IN),
         .RXUSRCLK21_IN                 (tied_to_ground_i),

         //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
         .RXCDRRESET0_IN                (tied_to_ground_i),
         .RXCDRRESET1_IN                (tied_to_ground_i),
         .RXN0_IN                       (RX1N_IN),
         .RXN1_IN                       (RX1N_IN_unused),
         .RXP0_IN                       (RX1P_IN),
         .RXP1_IN                       (RX1P_IN_unused),
         //------ Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
         .RXBUFSTATUS0_OUT               ({RXBUFERR_OUT,open_rxbufstatus_i}),
         .RXBUFSTATUS1_OUT               ({RXBUFERR_OUT_unused,open_rxbufstatus_unused_i}),
         .TXBUFSTATUS0_OUT               ({TXBUFERR_OUT,open_txbufstatus_i}),
         .TXBUFSTATUS1_OUT               ({TXBUFERR_OUT_unused,open_txbufstatus_unused_i}),
         //--------------- Receive Ports - RX Polarity Control Ports ----------------
         .RXPOLARITY0_IN                (RXPOLARITY_IN),
         .RXPOLARITY1_IN                (tied_to_ground_i),
        //------------------- Shared Ports - Tile and PLL Ports --------------------
         .CLKIN_IN                      (REFCLK),

         .GTXRESET_IN                   (GTXRESET_IN),
         .PLLLKDET_OUT                   (plllkdet_i),
         .REFCLKOUT_OUT                  (REFCLKOUT_OUT),
         .RESETDONE0_OUT                 (resetdone0_i),
         .RESETDONE1_OUT                 (resetdone1_i),
         //-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
         
         .TXCHARISK0_IN                 (TXCHARISK_IN),
         .TXCHARISK1_IN                 (tied_to_ground_vec_i[1:0] ),
         //---------------- Transmit Ports - TX Data Path interface -----------------
         .TXDATA0_IN                    (TXDATA_IN),
         .TXDATA1_IN                    (tied_to_ground_vec_i[15:0]),
         .TXOUTCLK0_OUT                 (TXOUTCLK1_OUT),
         .TXOUTCLK1_OUT                 (TXOUTCLK1_OUT_unused),
         .TXRESET0_IN                   (TXRESET_IN ),
         .TXRESET1_IN                   (tied_to_ground_i),
         .TXUSRCLK0_IN                  (TXUSRCLK_IN),
         .TXUSRCLK1_IN                  (tied_to_ground_i),
         .TXUSRCLK20_IN                 (TXUSRCLK2_IN),
         .TXUSRCLK21_IN                 (tied_to_ground_i),

         //------------- Transmit Ports - TX Driver and OOB signalling --------------
         .TXN0_OUT                       (TX1N_OUT),
         .TXN1_OUT                       (TX1N_OUT_unused),
         .TXP0_OUT                       (TX1P_OUT),
         .TXP1_OUT                       (TX1P_OUT_unused)
  );

 
/*
// Unuser GT TILE : AR# 33473
*/
endmodule
