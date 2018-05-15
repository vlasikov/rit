


//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
// Instantiate the module
transceiver instance_name (
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
    .GTXD0(GTXD0), 
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
    .TX_OUT_CLK(TX_OUT_CLK), 
    .TX_LOCK(TX_LOCK)
    );


// INST_TAG_END ------ End INSTANTIATION Template ---------