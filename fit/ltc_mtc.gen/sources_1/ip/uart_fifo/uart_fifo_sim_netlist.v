// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Mon May 26 16:42:45 2025
// Host        : ANDYPETERS84AE running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/andy/projects/ltc_mtc/fit/ltc_mtc.gen/sources_1/ip/uart_fifo/uart_fifo_sim_netlist.v
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
