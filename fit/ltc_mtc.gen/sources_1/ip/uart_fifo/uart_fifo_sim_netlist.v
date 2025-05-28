// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue May 27 21:49:03 2025
// Host        : ANDYPETERS84AE running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               z:/Projects/ltc_mtc/fit/ltc_mtc.gen/sources_1/ip/uart_fifo/uart_fifo_sim_netlist.v
// Design      : uart_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "uart_fifo,fifo_generator_v13_2_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_11,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module uart_fifo
   (wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    valid);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;

  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire valid;
  wire wr_clk;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [4:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [4:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "5" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "2" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "31" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "30" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "5" *) 
  (* C_RD_DEPTH = "32" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "5" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "3" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "5" *) 
  (* C_WR_DEPTH = "32" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "5" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  uart_fifo_fifo_generator_v13_2_11 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[4:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[4:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(valid),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[4:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* DEST_SYNC_FF = "3" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "5" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module uart_fifo_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [4:0]src_in_bin;
  input dest_clk;
  output [4:0]dest_out_bin;

  wire [4:0]async_path;
  wire [3:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [4:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [4:0]\dest_graysync_ff[1] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [4:0]\dest_graysync_ff[2] ;
  wire [4:0]dest_out_bin;
  wire [3:0]gray_enc;
  wire src_clk;
  wire [4:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [0]),
        .Q(\dest_graysync_ff[2] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [1]),
        .Q(\dest_graysync_ff[2] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [2]),
        .Q(\dest_graysync_ff[2] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [3]),
        .Q(\dest_graysync_ff[2] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [4]),
        .Q(\dest_graysync_ff[2] [4]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[2] [0]),
        .I1(\dest_graysync_ff[2] [2]),
        .I2(\dest_graysync_ff[2] [4]),
        .I3(\dest_graysync_ff[2] [3]),
        .I4(\dest_graysync_ff[2] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[2] [1]),
        .I1(\dest_graysync_ff[2] [3]),
        .I2(\dest_graysync_ff[2] [4]),
        .I3(\dest_graysync_ff[2] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[2] [2]),
        .I1(\dest_graysync_ff[2] [4]),
        .I2(\dest_graysync_ff[2] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[2] [3]),
        .I1(\dest_graysync_ff[2] [4]),
        .O(binval[3]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[4]),
        .Q(async_path[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "3" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "5" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module uart_fifo_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [4:0]src_in_bin;
  input dest_clk;
  output [4:0]dest_out_bin;

  wire [4:0]async_path;
  wire [3:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [4:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [4:0]\dest_graysync_ff[1] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [4:0]\dest_graysync_ff[2] ;
  wire [4:0]dest_out_bin;
  wire [3:0]gray_enc;
  wire src_clk;
  wire [4:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [0]),
        .Q(\dest_graysync_ff[2] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [1]),
        .Q(\dest_graysync_ff[2] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [2]),
        .Q(\dest_graysync_ff[2] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [3]),
        .Q(\dest_graysync_ff[2] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[2][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [4]),
        .Q(\dest_graysync_ff[2] [4]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[2] [0]),
        .I1(\dest_graysync_ff[2] [2]),
        .I2(\dest_graysync_ff[2] [4]),
        .I3(\dest_graysync_ff[2] [3]),
        .I4(\dest_graysync_ff[2] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[2] [1]),
        .I1(\dest_graysync_ff[2] [3]),
        .I2(\dest_graysync_ff[2] [4]),
        .I3(\dest_graysync_ff[2] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[2] [2]),
        .I1(\dest_graysync_ff[2] [4]),
        .I2(\dest_graysync_ff[2] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[2] [3]),
        .I1(\dest_graysync_ff[2] [4]),
        .O(binval[3]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[2] [4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[4]),
        .Q(async_path[4]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
md0AksSCeI3fOZtF7nrw91OgSzGoACBon4GH9ENTzaI4jlg22H1uTtXayX2Kz+g4ZH2j52rtMH8H
Xc49HVcThMzO1cRXu+SkL59MRQ87klGca4XtjrTtunJoQ+jyOKRwRBeIMHUdntbk2T1kbXHf9KkB
bNYGEMqSrbiDt7IJUx8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
r6CzxR0T3O2wvZRQe25aX3/CWOx/3d/3vJvvS/XsrKr7v852GNQNqCBn+PKsunj0Ncep8DqHtVie
BE6tKIqZW+3txAUjrhSri5liuFWSnzAk+Drsb4RnvIy7BeOdAK6NhVhn8ZyplkJSHVwaGjN8gtPE
LeWEHPHf5qLnzqGKV7B6oIC7POGV6Vamos1p2z1xv2cEw4udvmtZ5EjzeyCMf+omtxEPxhPi6Z2h
ENlGOmuPMkWGMjP6HQCZ1Mi0uiST/zDo29UDIMmOGcsDMe97imU/z2ekKTPXXwjcV+9q+4zHRgJV
6JWWgjU9cztV5OMaEfpBgRBWae/ijWpPZaGuFA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
glFrHilvyO7nq7/OYhnyb9uU9d8UNGJruNnkmJWuTpgvyCDmtx7iVKPBPe1Bj9jUDT/HM9AGxvu0
g7b4TuMdVkegkVPeHhw31IW0HoTL8wPnrLEpzDVK+B7xl953hPKPe0vn+0EQh2UKeL5K8VLxmsSv
gbpEeToeR90yzlSUzDE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D4uBhES8Mkd0GCwY2aQOmEzTqz6hO5B9Wa2oyfVBEODkWyt+AHkIXn4tuBN05FcP2FVmgtVbvZX5
K6iog51IoPw5tv+pM5x8+bQBX/aZpf0c4to3qiX6RZuITpuSUWq/7sqQDqtMqDWOFMMnUBpTX+qI
t61NvyIZcfqRWo4yvIUV2Zh1etqYKDlhqRnMoBZKMeHFpVsp19nU4sf5Km7sSlPQ08vYD8qtJqgJ
ZDYC2KWFTHsnT+5anHvc80FgHt4zBHpPrGprgpltQmVmMZxUD6NRC9EvvXf+pBhgfwPHHePWIKUn
elLld/HEVeFw76SlVV8i4LsS4KWWOM+KmMprEg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EW9gHDqS12MVhy+y/xQVscLd4qOim+cNTepYzlas7WzqDJogZthddOuGjpm3a3fS/cMbF/h0O1Hb
Wjow664GIga0y96lkbkcJ3W8x/IGAsvgyrYT6ScsFhyq7tSd1HjvRG81BhhGM1mmpxfzh0Uqbfso
q+uVKPUmPnbQ/Gdu9YRoxmYVJdmUTpXJ5waYOdib8WNMPLdDfIo/FGrYrx2zYQBtpU5DwwVUTMrB
ZasEyxOj++icI5k5lR3Tx+3gdCFTy4XYQfcj2COm4gnVZ8FN/X1/+0ywsVGAc/OKL+mjMYH3NNH3
zfDO/TpYft+HaVl+CfF/U6IgJJeJs4qI4gB4FA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Myfv5Skg7QCxlNBoFiSTLAeIRYS0J0ArRihYk7dGAHZWAFlxJLgqo51W9P9zTVBurMJjZLtonoDJ
19RfxQj5GqhqN1A20s8xOFfLq6+uDG/V39xQFY32O626Kh4MMlH07hNJL5u1NjJWg1yze0XdFEe9
oLwKQz5lSKGMIh+VPXDuCGhShS+KhHwGEdS0lmA/IHPFNlRG1LsK0zQmUiNkG4kQ5OEVkQgvknNC
B6++ZDIYlT9WbZPs5giRY0zAhUepLPaO+N9F3fIBKVGw4ejbZOt0kXKixF86DDfLmF2+dov+PrTX
1MXJaea3YoQdR2c2MSHAk/TTkzg9ayjvxKaXpg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ks9l+EPHXfDNnWd0exs1j0Q9iSNYaIExwQnpsi8TFJimjPtOkX050wFklsLBM83WyfuD+F2KLNnZ
Jg/aiIiGe9o424jOiEFdnAJuzrD0QL9WmhQ3W9iRJ7uPhha6NfR2WGTCCM4TpN8rTKLQDKxenVfv
6x83rnL5NQxvpp9cQh3zMma73qoEJjhTR9MD9cwA4VeKq2u/R0iTWBplX81vYFd9TW2qW5/Qyzzj
A0+pXzczcJKdggV8h8bYcO+PRC3t2XrufhnjvhjMLG2tPHSMW/soDH/v8KorXyWe5N/q12fo5auN
SXr3olNuB5kpiVS3mJAPV0z4UsFfu2A4hLH7MQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
e3AJKDEM9byJqwpkFZqMIMKMQPOR1VrLFkshor7HR0C+ol7Uv3XTGyvQrINdBEArX0eazF0cHWjC
9B4BhDnysAhT6SENcNHIYHUGQE7uiF7zgL7WhCxClwEnIAVj+PU9FmqlvbreEikHQfbeIDPyCLii
NAS97RDxWki/MfR33zvZX4eEolA/oTyRzr1MagBs7LN1UXyGPvnze8JzHxA3zHVedIIrBrZxkfoj
Loqe6tLYRlC45h1Yr3Wa2gh3LJGtOSji+m7E9Xua/pPh8A/CAD+TNBa5d/X7C3a4AWl2bYTi7HBY
Y8vaIjHiSosru5F2UOEQG9xekCbNRK1Apew1UIvntzCmDMMhlAgB78AUOE2YEWKd9GOl+aTZjMS3
GxAYzrtv/bDRkPOYbcG0SNT9xf+izRM3lX1E2vN3i3uU2Qrh73fjU1lk3PIe/A/H56UrNPDnGT9W
TvlJR47bLDtGyX2+dLvfTaZGRP8aepePOXXLIlvqwCJSMVhCB/hIbz7E

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TfuXOFQtE7YhtTL4354NvKETmBCLSVnb+pbrT8gtzjU7pERE1Hu2ZVzHgVQXwt5RvwG1R/z2je+U
PzszCBhPNqUaXEhuJ0A/q0S/vvOOa6h6tW9MhiB3gnuqEFVWz5pbHZNfgrwh2gT8XyqLI8f1CoJM
xpcB2TbREV/kAAFMxIfH1Dg0KSO2dCeVV1na6N0AiMOQPvXZOB7QpXwNDbYfarWLtF0/l0hi4Fxu
Kgho2ggrUhajP0aKlrCQ9mLsqOyqJELeJldeD+vuUUqhYq4K4RrwtQF+B67lYc4AjznwQ92tUvYJ
ZspFoHJEScNvdFoHFTA2TQ2KToepsqXRiOCL1A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tmfbBpNtCYJ7zsgNxUzw7Dvn+hNn2PPUBeRfXSci/q2/OcQeF/eAAML8YIN1V+AEoAqZTE2/xRQz
+6zwVOLyAOLynMIBQ7EG7xReDJ9kEEiBjnMGO6NWdAsa/VcreVHrLD1PFtA1+WoVe6yOvNGK+Nbh
HjPkXyycyP6RQ4Rx/PtTxw31LOFVezddSgRlaKHTprKTP4LbjPG//onRBg3fAl8zwU1wYYNLzYCX
jwY7xfMkQyhUSpV2Tx3seqy2IYVl8jjxynFxfyxulvrJiqmc6aaKKBdkoOVbJ5eO2sCXFJB1mKEU
WR2Ee2ozisABzk9IcGILewCW7ghdLP82CRZv4A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GfDCxx9db4ripD5mvQy16BVlwPYfeC7ZobZXaX1my6WUDiKwd69J5SreUXKYD9lvZfI7djLgHkYm
5G247T4NX7zoBwc88bUD+tNvGNmzWFfSVVZqu8hjgd31lZXjy9uYdXA/gsE+T+JqEfRYdV8YoGgm
sREyiJjWRPDbx6kc8um8vlAK/Rjwz0EGVkGUoi/+UvxcnjG1PqCl7GSMOQ3gFMEOaxIflShnF2/c
//ioADxl3WjUGyTstMK54XlP8G1Hk95sSe/7Y+SbaIyoG8t6gGDimDJNuGs4JjDUi1V7Gxfzxk9+
O2J++9clyLkMZ3rRyxSvR+Xyrmn3YxjVC68GXw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 72672)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
