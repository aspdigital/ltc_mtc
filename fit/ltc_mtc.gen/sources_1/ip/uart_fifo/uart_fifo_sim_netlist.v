// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Thu May 15 19:57:43 2025
// Host        : mini-win running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/Andy
//               Peters/Documents/GitHub/ltc_mtc/fit/ltc_mtc.gen/sources_1/ip/uart_fifo/uart_fifo_sim_netlist.v}
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
