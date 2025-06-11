// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Tue Jun 10 21:05:32 2025
// Host        : ANDYPETERS84AE running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               z:/Projects/ltc_mtc/fit/ltc_mtc.gen/sources_1/ip/uart_fifo/uart_fifo_sim_netlist.v
// Design      : uart_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "uart_fifo,fifo_generator_v13_2_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_13,Vivado 2025.1" *) 
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
  uart_fifo_fifo_generator_v13_2_13 U0
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
module uart_fifo_xpm_cdc_gray__1
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
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
DkrAesSLBeDxhaXI0asb+puroLvZBWosIXruDqTgmPTfjI3i0ebKCZLqSBTKg5KUexTiKWVl+9Ug
OYhkMJXkn0n/j8/6GJO1z/4tReZHG89WtZnUKH7DqjJ9cbYER+xiMOLSptE29AOOLGbQ4MjVzy18
/GymLeiAgR0qzkp9N7Q=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
yr55bXOTA5/Rx+gX4TeeJXN0K2cBO3bWYWFnZFCMoAD3+p3RscsDqPrCcQoQK89bE+j5quTJPCqN
12//qWlZoWwZn76VLtgZ6uR08n49XeFz74xjL/TLVxYGXt6h6xX4vQmlg4FObv4H7DjasBX3ZKbJ
ok2aUJCoVpTf1qKo+JcowFn3wCJuym0DTf+pKogOmnP+lFMp5UqrHjukbVdejhRT74VR1/DemaE8
T5gZjbZ3QR/HcWThFnFovoQYfDe6/w6F45CxJCG+PeP9h3J9NvtHuoTROp/4Pm3PwHsb42eiSpxr
pnyaDp+17FZLap9oxsD4do1RXjk5D34ULkJVIA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
O7CLKF7GDUoxVy+wsDp+MYsQrWrtsRT6vUjYFyhzMh6Ub+aCHVi4kv7qJlcKC/lqgz7jtEMHuwnT
UOnYZwGZhoYQGiyYgQ49hiQ3ZRRKZhFERi0ZIsCQqnt9KL/lctiP1qftlXs9jExoeBOOF7u/WVi3
pyQy0g7Wba9UIUGIm6s=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GNpCV29nEkhsU3/WearppJw/bF+jpNkJZ/R95n3ICdpGLWfuUStwlUy8HF9jlXwQBHOlyBOP7M8y
5/3deJ7dP9wf0/ktca2pbkd2baod2G4UyNgD7Kw6HEUvRRpyTJZ/L3VmfGT+tIbWo6HIxzLTs/m5
5iqKTaDaI4Q3qK4JULeTAAdRL/RfQmSpb3LUmOqKahCwxslnzUfjlDrQ1yr6O4UDsXY4hdfrGK9D
/I7KoTKVvEhrueaX2jRmY3TQrBUt4jyGRe3PZ6bG503/ai2p2yjlgo+WpvN4/p05/WKtMyZOkIZl
UJBltJG+KSXZ7ZMQP6CiBt0LOX7irCbHz0Jc8g==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DywZ/kNdKOmRTL7XhjPG/GfMoClg4ctHdFzXJa3aew7oWOtgVWlq099QePdVKIIjIu5l23MJcdIO
oqynvDtsO7VQVhHYIpsQFOj2gSnqXKfBL8B5bT2FcKG3ooFRv+3lkOFeU5Nw8WL0q47fLhyAMLNd
/9HoUonhRo19wn0Me1Do9aWic/JVt3e9Nd7ru1ix5nBBPNQOlYU7SVx+2X1T2XaJWYvLixlk0Mhc
jMhvX3YFZPzZ0+CM93ob1QR9ScG+y4XfYgNogHRVVefGFoLz2+xnJN+Bu/U0KTX6CQMDDd3buBwQ
T6pBRJKKEDybcMbPkbOJLE5f5LO6qExT7Tg1VA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Xk76vYY5+Mi9SikZxGvoXU0nDA0NsPtFqoFTdNelYrbJJjzYNc3fKoKmeAPJEHAK68DYNC1hfZ+h
wET+8JT5Y0DFS6q4lseScDHDk1aw1B8bX+BjAZGKZ0aHGVLPVIBWoebVqqt6jq4ixwO9FqIZHsBM
+MvVrCQvX1DCzUaRFYo14SpAvNJqUYqu6GG3yylKDKwbG8MXyf+cxyC3SADqw9GIWVeUU6K6qVhw
xPAS+X8RLs2umC5guWQim6qB6i7UvICDc0XHSGBJTshyHB7pJ2HTmwrJM0u4VdB6VWY7d3+mSXiS
DD460Qt+vAgSG+7W6NzEmdFsY1oS7d9BmIM8TQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lnn2zznD4woSpcQ8qX9T+xHBP0X7XM2/xXLBM/d+4CrXYKZQlI5YUEvGjRGGV7RB+4F2JgUow8cF
xFJeqARfTzUNSbwmUP/DFMtqlGEpM1nl55xR/wX4ilkSqJcznCGf58hVz/IgOrc5d0OVvOQ/RNYL
rQXtkBsY4w2O8c7EGphPL24fy/JJg5k7ryF7nyHr6SJRrqNDPv/NiKuP5m/kV27HfpteXE06q4M0
JWC5QAIiv5LTpXAb+DVggJmRRAjxMvV2S84NjffxHFMCaMTvtc+jxlYh9aF+cQNAKPRiHAx85SiJ
PEFLBbwPCT5vvJDdLpasydWmMxkjZHzK2xrqeQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
DUNozA2bEHamc0iNCnZvk8LepBeINdhN5GX+6IX34qnspEKMKv7BjtLqXgwW/V/JCnWf8Y7OIbw4
f22QHEpI1y43+nOTrbDPPtprE6ltlBCtccryEPYttIQJF/Tiu49G9uWMIYmXUXgklMNLgBGIeDiK
MdigVvsFpWQ6/uEjPAFsj2WD2pLIKxqEXb3OZ0Nem9xlsoptO6Uf3qgYsXspsW/L4zVBsQNlETzy
cGcBkm40vHTRqemA2HpoPknluLKSuOwehOGvmKh55bvIJRxVFCrPdV4bF50Nq2S4uePYJ2wCeLJb
1sDpBCI5cUI6kGfJN0e+OIQ/DwN9iIoPWSdiKj6BN3I0bmh8maYAcAmtDaAzTaXC3jXkFQB+ik7h
V11sxx0a+8ZYnH66nJrJftgrmqQZU1leLEGxxaKkkPXytKyATXEpCz9MbzyjKwvliQljZcszf7lH
WWRPP6R6bKU8hpjrVAMsuRm+R8j4iHc4nTPqt7cZhlyhAViBvlB2C40D

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EHaUQmQmLufYzNZ5QppuzuiisgA7fFX3fAiRBFmfJqYPZjTG0XgsTNCRYHWXcuY3m9BX/s9Er2Gd
/L/4+bT/RXW5ZkETw2SBQHO7qe1CJqtNqDahDuB0zADrCR/cKwPDQtFItqIOeGeJoLEA9s/HUvSD
th2uPFi0+hFXeDicj+1plX4ApmUWJska8TlRwC0oi/m+lIBBbRrdYO5XY38+qhOgnKC2wPmdMbkc
EFGNFdyzlp/ZUen6C7tswoDOjsDSmlB3wOq10stSLY7Bo90k8f9xLzuwI5q+H7plQuinSdWPRTYu
x9hcgLtu9zFvPwNz/KNLHShBAtzUCp4bx3dwGw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
sOYoFu61UC8Y00qCHUNN26P31U5AWJ63SSgVOs2Gp7CWPJ+P3OCRLePUP3+bAteUgBN7AVfI4R/z
Yw2S8JiIqaRcTitNUHv2Diet7aTJZ4Pnf0fbOaK8TOtu0MU72ttMTQPYuX472KGwdJiqBAxB4FzH
KuXCK8Q+rXGxbV5Sub0rOi5KOyQYei7zMxxhQsQHIl4iRkiNGJ5OLhaX6w1YJw60TzJq3XLnqBbu
hbrtcwSQccW8il9D3IlW+Uk+JKVURvFU0ULOXoBLyfWnFH57yQp5QhIrCf8jqGqVd4po+EbPJz6B
sWESgEhaJa8ccl9THIShRCNPAVXkyfN7wTTFmA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fz3nBHklRG4aYQk8bMLrCmmQlzihvhNQmRJkDjMqAVQp3WfT3s29tMACoxDJDWmUKcN48pRpjTcS
XQtCGGmwDaUP9aAsJBVtDs3tIakQoXZ/Q+b6bJy16xRLtVX3DbYsT5harhUkmBWCTRn3H1XrmQyv
sxbL1P6awsZjt9hO4Mdv3YOqh9IsIKEnsRIHQNdH6IFLnpz/3Zi3LzPQNq06nEuGqIvBuo3484HA
Oqj7FoYVOOEHSLUEZOW8wOSmhniWeAOKTQGQRonLiMMuS8yDcXSIQh1zEg+e0cBH8+1DW5cFMzeD
wCbuSTLTBwW2672ks/1kB5Hp7UKgj/KoG2ySZA==

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
