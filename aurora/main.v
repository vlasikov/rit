`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:29:09 05/14/2018 
// Design Name: 
// Module Name:    main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module main(
    input clk,
	 input [4:0]button,
	 input sma_rx_n,
//	 input sma_rx_p, 
	 
	 output reg[7:0]data
//	 output sma_tx_n,
//	 output sma_tx_p
    );
	 

	wire but_left;
	wire but_right;
	wire but_up;
	wire but_down;
	wire but_fire;

	assign but_up = button[0];
	assign but_down = button[1];
	assign but_left = button[2];
	assign but_right = button[3];
	assign but_fire = button[4];
	
	wire aurora_rx_n;
//	wire aurora_rx_p;
	assign aurora_rx_n = sma_rx_n;
//	assign aurora_rx_p = sma_rx_p;
	
	// LocalLink TX Interface
	reg [15:0]TXD = 0;
	reg TX_REM = 0;
	reg TX_SRC_RDY_N = 0;
	reg TX_SOF_N = 0;
	reg TX_EOF_N = 0;		
	wire TX_DST_RDY_N;
	// LocalLink RX Interface
	wire [0:15]RX_D;
	wire RX_REM;
	wire RX_SRC_RDY_N;
	wire RX_SOF_N;
	wire RX_EOF_N;
	// GTX Serial I/O
	wire RXP;
	wire RXN;	
	wire TXP;
	wire TXN;

	// GTX Reference Clock Interface
//	reg              GTXD0;

	// Error Detection Interface
	wire HARD_ERR;
	wire SOFT_ERR;
	wire FRAME_ERR;

	// Status
	wire CHANNEL_UP;
	wire LANE_UP;

	// Clock Compensation Control Interface
	reg WARN_CC;
	reg DO_CC;

	// System Interface
	reg USER_CLK;
	reg SYNC_CLK;
	reg RESET = 0;
	reg POWER_DOWN = 0;			// 1 - module off
	reg [2:0]LOOPBACK;
	reg GT_RESET;
	wire TX_LOCK;
	wire TX_OUT_CLK;

	wire clk_100_MHz; 
	wire clk_50_MHz; 
	wire clk_24_MHz;
	
	PLL PLL_1 (
		.CLKIN1_IN(clk), 
		.RST_IN(), .CLKOUT0_OUT(clk_50_MHz), 
		.CLKOUT1_OUT(clk_24_MHz), 
		.CLKOUT2_OUT(clk_100_MHz)
		);
		
	transceiver my_transceiver (
		.TX_D(TX_D), 
		.TX_REM(TX_REM), 
		.TX_SRC_RDY_N(TX_SRC_RDY_N), 
		.TX_SOF_N(TX_SOF_N), 
		.TX_EOF_N(TX_EOF_N), 
		.TX_DST_RDY_N(TX_DST_RDY_N), 
		.RX_D(RX_D), 
		.RX_REM(RX_REM), 
		.RX_SRC_RDY_N(RX_SRC_RDY_N), 
		.RX_SOF_N(RX_SOF_N), 
		.RX_EOF_N(RX_EOF_N), 
		.RXP(RXP), 
		.RXN(RXN), 
		.TXP(TXP), 
		.TXN(TXN), 
		.GTXD0(clk_100_MHz), 					// refclk
		.HARD_ERR(HARD_ERR), 
		.SOFT_ERR(SOFT_ERR), 
		.FRAME_ERR(FRAME_ERR), 
		.CHANNEL_UP(CHANNEL_UP), 
		.LANE_UP(LANE_UP), 
		.WARN_CC(WARN_CC), 
		.DO_CC(DO_CC), 
		.USER_CLK(USER_CLK), 
		.SYNC_CLK(SYNC_CLK), 
		.RESET(RESET), 
		.POWER_DOWN(POWER_DOWN), 
		.LOOPBACK(LOOPBACK), 
		.GT_RESET(GT_RESET), 
		.TX_OUT_CLK(TX_OUT_CLK), 				// USER_CLK and SYNC_CLK are the output of a PLL whose input is derived from TX_OUT_CLK.
		.TX_LOCK(TX_LOCK)
		);
	 
	always @(posedge clk_50_MHz) begin
		data[0] = (but_down); 
		data[1] = (but_left); 
		data[2] = (but_right);
		data[3] = (but_fire);
		data[4] = (but_up);
		data[5] = aurora_rx_n;
		data[6] = 0;
		data[7] = 0;
	end


endmodule
