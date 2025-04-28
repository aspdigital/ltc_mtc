// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat Apr 26 16:51:06 2025
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
  (* C_SYNCHRONIZER_STAGE = "2" *) 
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

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
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
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [4]),
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
        .D(\dest_graysync_ff[1] [4]),
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

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
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
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [4]),
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
        .D(\dest_graysync_ff[1] [4]),
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
KgIQF3YafzuiEjm2XscNCb+YzdJivwbWDDrL/Mp2xwZ2QqLIGdTqHNxAUVVY+upJN1TcoVWi5e9G
fUvbyYvLB5E2OOGQDn6v3hXli18GLujNOR9TKPm1hg3Bw7FKPpDRepsmfx6I9ifLa8RtkeCX7c1h
Zicp61Kz3YHU0CNRtWA4FhEK0CUXrQJQH4mJUBTVt2pum46l6/OhXNDGD0Nqhot8YaUhtpzda5bS
Pb3x4hyxmcw4bYoL1dVmCGVST/6VcydhB7IR/GAuqWYSKuebzH6N/VtH9PidQlBI+hMCb71PsdJN
v9vCrqmGu6OMOM2uqN2CUwnhPXjGqMGgKn8O30mtqcqax+WuRfLoiNnQKvpClqMFRLwRNZ6QhC42
D8pjZbwwSMiV2YWEL2EfNwS7oymq4H5sUgNKrsJi/WHCCLO7lsOhRE1egvizKAPslWFlxVyT+CVb
NOFt7nS/bC8Vy34aag7NO5pgQUgGsr8nS8jMEDBX3HdHM4bebhiAFFVKCEx4fIbzAwXTf7hdODja
Fa04TvsZ+14XNJtxwyK4ih0X9TIx0+QGV0toIiQhcmiRAaDUJrdpJM6RECvJMIeWm6J5FJQP/xfs
gnp0eWHKVFNdjZhPZz8bcFXCW4/ZoEjOz6poGo3MoMFq455UyFMWjZmuUPMtC24hT8hJg43pMhCA
MlpQv3FB1ck140sjtYJGH3QlEXXmbGq6wRg9klBm3pEhpU+2a1dJHCV1mRNNxVjWFGI29xFEQNI+
UgdSUOL+/29xN6/hkLs+i/i1oklfdnZDL8/hgxRulfoWzat/ivMnZ9Um9jTf3KxT/mbGIJVTb5RK
6xMdEv+GANzV6GheRexLM2F8BckHhN1CXF4v4w56cOI0sZQabLDbb3z7HJOK/p9EJxw7xpgxhg+6
w0O2tUj+783eh0DIdvEKuNsxiB2V2SHcraUmgBV57iFO4zmfDbNsK25mCLwITF7OSfsmger2peMT
RmWU/zCPvk9BDEiTLtetKssYocJo82G4qwJjDl4FJEue3i9isRXOlHbwJ7L6e6ipJwXgl3UI0N4u
91tleRcPBGayYc+zfNBtgvtkZFIpCpbXt2OGdAyPaK3eIodtInV6h5SV/lkWHkJt3OqLwtGDO9wR
ndu9V9lHzlmanp2rcl2Au/hKPbx7h3gwQ8+um70hhV/4VMpXQv4T1wFk45P2TsbhDkZSMxqAyqmO
fgb7EdTC4Udo38F65FdTWpPQcqZGmJx4xdlDyaFIVbkyWoWmWisAOlpVd0nS5foqtwhpQQxLwYRI
vVXqMa3Q/QJTanfDJo98JVcRw4Ini3+HUUmKGbfn6dZfB1M2jfy1mORk5bvOKSJHiv3HzLlOoCEK
TdtCUHXf2K9wkWF5ubdCi5ieD4yc17f6N5OV8czHkEdIiomYGr3VESOAtMy/agRwnvJX/OhxDC2m
LOev1z1MRHp3Jhg5dQJQGdjn2UhsmS+9sUyZZr1u4JJXWHK8uDvOpjvFhjWHK3fAN0lY3oZ7hAMp
MroIkEs61j9+WoZz3d9pDP5BgIMoz5+48ztndE9M3PjJhBhLe0EU98AM6/b+Hi+wTMlS1SPPWQa+
1d5+CAuSunHFpavzn4a/SqxZ6+z59q5LzcrCXRnD1g9S6f/CjVsA81l2KYmINUnLfPEgPONXVWUj
rcezD6cPrvKIJcW8/1UBO0hri8Aq6SZjvduVemMp9oPBqu7U6fhnGRQriD2+9PjeszDD4NwSMrMx
KQmWRq8dWU/pzf2EKf+w5j2ln1U6b6wGiL37j9JmL5TR098XgqJ1dKwkBEmue9+f8K7M8DBcC5v9
G3InXke1PJbA0biKzf/KU+FRV6LBSk77lLg3EWewRW25KO4I2zogm4wmeWNnVw19luQaQoMFyq8k
EHFpOIgX+UxPf//RGg++o6jK/rtIQ5mo52jTAFI0xl/6/zgZK2weRprMGZ9qONzsZG1ckZ29OnE2
cmGRFwcKwdsSxsH136D/kQ1OVOdoBAxwRtvb/BbXngQVfnIKOYT8Y12XQqtaiRjqYTpN88fO+KdB
lLZXAfUzQ583V4nlC8d7HU10Tcub2lIG57GfherlD2KLd+LMGHFJZ8B6Xaz4e8JqC9WAW3LbARNy
fshVpaFR9uuaNRyhoNpPVQZZ0B66uVt9eI4PlTkZJhSJktRa7CvVBzRiNqa6pjDFcT4GpWGDjCLn
b3w/Eedf4e2YSF1NC6/bA1mwrq6wNdFjzAyVqIv1EtJyOMlkc19iXqvPN4/n7kdaaQC+vdlVbg+5
v59ezrlqB9iDSPd0Xll8bKk+jUCDiRM8fSbW+GyD0E8GPtnU8Ev19RQNAZGyYE4qnALliPPGxy1G
VKc2yey9B2erNsUnVtbtiB4/+vNls5zCzZJb+9NO/cOywx014rRdNRMwd6uXX2ZG5LnkVUTTQfgX
4MgD+lmBxOSSKsdfRTeVwiwPPmR/IHwOtE6cThDZ2WNvor70GaZqmCcyC5HTYDlVlB9qiEQ1gi11
uPs7g29CW/Txc+acS42YmF6mFrPvUA3xsC6oQIn3bh0Z0W7cbP6prGAS7Ra9UIKNWjNdDlIDXwSt
gns4d5GhM3a90J80TSFyhaMqAro9teSTUdgsTWra5sMRbSgjNFaHMJyRC1UfSDDlK5/i2CKxI8BG
t959kjyLku11Wx3+pRiz24YWaMysp2bKkx4V1C9iXmxXyGB3sIvedTMEpofJ2QMpsh/OaBP6W0uc
KBc8t/C9yviQ0JcimgfMcLIlzy5sJX1bsW6loNmhtXNuLN3a6Vc1nnAiuATXuuv/V66tw9uarQ8h
Lpwi5HYo7uj/sYKe10EIrxMr7gBq2hHDXFNjXd9VMs9DRDuS9+JsNkD+bY5CG5vZM7rDkc67TN6p
q662ho+4USh+L+5qT6JZLxVUZbCVcwMEd82iKLlYAEaQ96tLSqfOFbW7d2uKfiUHo+5mEoiuox2P
nILDwQJ6g8Dj9fO3R1TD6M+fLmOdczRW5ayTmBHp2P7xQ7NX64rWMm5FOwa93jye1DqCh+faDGVy
T1n6+iwyjdq88aJaFOVGMJ5Jy+EY1/74rK4vFS93BAt+fshZmobKe8JFYyhkTVQnE+/qo2iY8XqA
4NWTnCmfz3x8PywRPEPYp5IdZsjhesfz7EGfsGDWYPaI/gVR9gr4d/9vpdkxqqncOuR1SbU7iyP5
Fl17I1UnQFTK5YpHx3RmHvbjfOKUVWtgrfQpAKAHiPG0rhgKsK5vPH5flxTicJQ1A+S2CwU/Pnt+
86Zdl3jXT/bcll/E3/mwN/1zH9yQdEL+TTNYtviuNJGEwxYZOsVhgvVjJw67AUTpQuzza5+1YzRG
VoGThRi1ZD7M4mP1tc54fE6PnUd8lp4rn0nOvANU46uT5V6JaEW1YPh8NfkibJtNpkAgYkjgkbl+
xMg+6R5LBelzjwA217LAgbuKIdBilh6v9WZ/GbcaahKdAw3KOUs/gj7FkZ4KmVuUU/bftxtPmitF
Sw+RL7U8ym2WJlAZYGefmrp7BsEnDK3U+CuOynQhyf0FTv6GP1FK3uDo+pbBZQuuqhv7b7Hb87dG
V4uWVEY8900UCdkmmTuch4wsigwOvkuWYj2xvFNmYL9hoyMwAFWCCFsPOYvcpid1adfsdH4fe2De
pGzAO2DzVt4IM10EGzSP5NiIbyanqcWv1qvbncs89IGB4KQP5hWN71fyp2sJo4Nbq6voFEpmK+7c
7kEmzPqvU09zqXICqJLJshFle5pRestSLRIxnw6LXHJdFRmr6UtIwmof6nxKrD8cUjoQwmCNsM79
PreXnPZjbB2Dks6SHDNQqHBMGnS0AvIBzeUDlnLDlAEiP45okytUifmWrk9TRt2lcmefuV2l0XU5
ac4I8eSB6b1aSmchaoPDOblAQQ4HsN0Obj4z8BlFPWKodsj3QyG1o5WGBtCoZoQoqphSR3IO3Oip
HDC6l//g2MSbVAOGdwEw8EFJ5X2wUWh6J4GlsQ3u9+YCEz+wjJdBkltXlXxc2xFo2fCY6pOjvINX
ryFFDpA9d3dAbKuOQxZBXgk2nFuhDZ4ln7iVvxCvH/eKLys79u5UDBJ1to+2Gz+PRoj0NOBOqULX
uopDLGqb+zH5yOBOt2Vl91ije7Qnjli7PlPOKWyccmghxC8phnVS+2WreQUqkndCZKgeb5DEvou6
Vv8K2/rQ/2UKmdTy5p7SboEI4+ehsLxaLYbLyeBJ7AtxaFb/fVU8whlvT1obWFbem3STy/QL1zze
HRh3GuvHel+aHwNpc/V72Hux224/ya3wGv5pNUInxA1uhBS+YxKrKq03SnllkI+g9hELnhyz+Ptd
LY/H7Un1mDRvCwLM6PmY9i7EHZJecP9FvhqAy2Pw+Oh9yKEBWkatqPc8rcPbCbZgwawIudQMjRph
N/shZ7Bknabnow0yw9wd1PWiOherITJqNs5Bl2bXTGNWBS3BrYftimY6u9ExRyQyO90aobyVWVW0
D/x3vV1ApL9ubvLw/wa5tY17wBsi5BoQvWTVsd/mG6NE88mwxYjnFHygkhlxju0cR2Zzfxuk4nck
k55hU1r0cUy2+dK7SrPa0fr0LnDzfrAmnYdU3a+lKbzLbHa54dp43PdVI+VaZ0cDneJLTDy7JG66
/kqDljPViTkoY5uW/EOFK4fItKkRSuAi7aI4qeIdUKCilWgjlKU6VoL8iA00ftj8oU83TGX/pCXs
vhGHkpinLEq9Fjsn/QjG4G4E/zZdwtuNPeFGt5VRnapEpIE5Rj4e/NnvK4tp+XtpUQ8CCeLzwrlR
O1Nay4qcvZuZirWdk5okwc1KHX0R3KZHE8e2jOMJn+JP61TzdjSU5S8Dg4TAv5Ay1I7FFB4flJpj
5XlwNCqIcA7GKNN1qS9i9Z+CVPgcDBzR4rqHK04Zer+2lqeG/VG30fJF+IQZYtqqloGwGLsWFihu
0Xp7Onzt+/d+3npuPDivpRJMsuBhe9ei1Hycj0A9J32E938iG35kPWbRo2/X1KiJZzPZuLf8rUEZ
scwBQ0L1go/oy0s6cwHvIwKoYSwxNKdsZWgeWDhMryZSax5Hd2x0TYohZ5Nq3w7ANQrv8GSboZh+
DlFwtq7cITCzA0s12YGWnR9ERfM6ew6snqHBWASpHRD944tdRw15N+9A4xJo2FrHLmWPa2gBJSpa
XUTLS/PKK/UKqvYaZnO/DYyIn26Pv25p/Ij9rFT5zlKTfOCrrexKpcPp2dyZXk8hmYioVbMaHL7x
amyHcl6GNzZ81xOwAuGmFRITuJ/Fa/tdCRm4G9V7VT4EyIsg/+auBoxsIOyGz5eHNKUilV0AAWKK
f9rJCtfGSTRZoqNgCiX+SBQMHVQwe/+nMw2/RM4lCMjRiePnWHKUkritDWvqsRhYKAP0JnLVKrRq
jaYjLyMI+ptrhbfmi3XTJkt8p2/m8ZQxfgH+N0TzdR48JDqTUxdGSsEhfVq6jbzFNHmtY4xvemZT
dKY0nzn/5cpNZkHT7OvJqO6SBATb/y0eUJUB+rO71N13hsAFyCQ4oZ8PO3SzQy8mfHu5Ib5glpRs
rBONdTs4QqJsG82I4H52oyGwrbfjHvURzIwcRrwI79BmmlYrUL5omCiPKuKKyNO/g34xppJketl/
+ik03bfNNscc73S4mGrNDZogTSgUpc5+K7MH3VuAx5W12FrHbo/JoKdEtkI7s+sduxLdP0wNhnnN
cKDv9vSUkcRRGvlZKRGxVzLL3X1IXRmbAAQXjBkETeQxLLmvfuu3Ul/R12kELku1vao5nBmCpCjp
M4OvHsebfOgF4AEWboYNl6fGaoFhesR0nwmTqYSaeI+1xNapMxXmuq5gNAHXxSvPJ+mdfP31/HcZ
Mu92cJuvR/fNQfEonffpOl5lnybOcKwhn17NkSXcRhMcje3j7TCyY8q/vUo3aPVNUq/X7fuVGVVH
ajZQOg7eWl9DnQNTWWfn98L+mDI6mX+IUy0CsKDBl9+rjRjaebLsR4CkgWW2DAWo63GPaOTS8FYf
IYXHT87eJ/4njn4NryGqRNd5fToMxgNc3Iyoj7/Kbq96op1xU2ONRM0R98nkhlWBstElpMhcQ57J
behUJh+Z5rpWCajFKn7BMusOp0gOaag9Vjy+EZX9Vu0w+ybIpFoCxursLg6ZQ/CPRaI3aXSjxicx
dgWyruKXGbZBLEfykJxPglZUshEXTWGLoEi4vbNusIO0Kcs2KVjjvFFriX/5IkiZ/CRiTqb2/7zA
SPZp3RJD6oThxOl3eHQEWN6E8dhtR02GtlnWw/3XyTccNa5b7fIjGIr+8s2LH89CLwknPCYx506P
Fvt6fjSMdYhIqEN5FvHkaJP1vfOQMVJ370PRY4Gk3gFZosYcYb+vGhUgjKwVeCV0LmwgAvSsmQ1H
tiP4q4p4Qbh5HXU5GdsMTmO77l4R80cI5Facbixfn9dxgzpR5ruCosJ3na9+9mb5Z8owNwa/EV8l
tIMzp3rlSv4RExWTRURxrbufi8xGf81mCO9GS8ZrdVVQEQBI+d7m558+bTVs7hrRVHBpXvkX6c1K
GHRW7BL5a+gTGtSxvQccfv7bEnuCqLRmJ5Rc6NO3nAyFCPNWMAyrEm0OTXxbArNCipJwftAmr5QK
zXxng6s++PG7AfOgAIiucsCu/i9dzIrjeQRAlnuiXNydKr2FO7ytEd9XgU3/DG2qS7yS5k3i2pDh
l4rlW+CyBvI1NW9OqquptHcqGNnhPbdnB9Bs5oWX6K4FXfiZaocWv1PLuq6G89Pj2N9OtFXtPZ0t
eB5r7xhjoaUv7MRN4smflRVSW+NwxH6c3N4gZJyTruJ6icJtDYxj2AT22QdWgKYvmJDvgRxfpuoe
CUAxSavjsf9UKvwC00GbWsdLNpBJIVnGt91v8xsHP3pnDHjRlnX7EmPBhEPM1HSMWdJXPOwBTHp+
a9ZuFXhQxjTw+RUZ39Uk/S5mwUs3+uMEXPHZSYVZl1xWnUpemBQeRPfb8i5+EUf2ur9Gz4UKbxu/
Ox+N637yvmYvssqVcYxWISex0ErOyPVUgI7KX6CphCe5rNJiZ2ohC7HEhKvsSiLytu+kY1ZZF0S6
YvYiqzPqxZlpfCLn/r/kxwIT8+nPJ/nPeTW4UHKtqO55D/CKaQYczZLIz+x+ba0hAz0FuQQKJPVL
VmHNhwhB7jp3P4r+7ppYvMDIEBOH0JfXOwH9xZqPBmpIW9t0yS/wX4ViYusR0kPuEJ+S74U0qRLI
5Verd5vGsMebLfi0zZmqbtLDqJPxBsUXhd2guJVQDR03vGS3XuIIAfpmRtt6jletJn2lNJdh2HcA
r2P0PHQhROAulGU/L/bV1qRLfPF38wOIrRYpLmu3AxrJRSKQKiNqbgPOlDUqPcIlJvC2eOASwfQ+
gVoOzCWghGz2XZl1T4Jh9CP2oeJ+4DfPT4j/tI78RDqOskCQazX7aQsTFaFkLEfP+e/4EALCejrJ
+HvzkmSddADUMGL0mBhRr6rMx4BrqFfzU69UiAnvPycVx4AKuAyz9/vVRxoescP60DBkJIRewIlu
agYGd6Rw/QOYeVUl+EDMcjDdvLUJYfijrBBZwZZ7M3fVnN+0WhKcn9byeGZDn/WuYLwR8YDuWJQP
NnNc4gVQIWm64NKAkgHmtZFpVXn8sM3B4lsbEnfa2up8z75CV8Kb/HoGobAWIX+bBQgvcHMgLaRS
8UUdIl7MtTuJS7s1V39wqn0tCbfQmsBoutEc2IAhATGmLGzUTLWkhVSIvdI1XmqVIavsk9FazUFZ
BuX+8lOGXQMZl5Nj64JExeMlRong+8vSRQTIIkq+keKUnbynvj4lKEFNtVm/AmQG4iTpjhBEn8UI
fXGwb4pUxmVanBDPx8QGjFyj4h6IwE86Sf4LiQvwJ4smxFhG41boBGD0fGlG8MTeZI5sTNMXZir9
lE4gOJrACTPG9BmkxSY+kIk7FxWnIIAIaZdkVazT3SKYIW9BnalCyxArwvwPvtr209URQjoEOdhI
xOJEJjLwPSNkSh+hwj6OkJpatYz01wPBm5lJrxVz6pMaHEt3kGanSyrVDP4WqhO8DhXWkQOGaTuU
tvKaP+yBpuOHmry/Od9FJ7Lrduv+fLgH5ShQ2I0Agxw0KbuxMX1khJp4BX3Dmxq90Rl3heoX2Lk+
hRmePjOI48a0NOcMfubnJ7Ln+N0X+DbIYNMQReDHIR6AVQo8/xJMVxZBa0+X7QHiU0i9qtLWj8Rt
uRD4ZXqknxgv31Tkc07NwujhFgV6LZlxOyzvC4RWTJC77Iao1KHB8szb6LLudBwq/Y4dF0LtdAMR
9R4g8zJGWczDuhj24aGWczqVcvzoxhsDO1Mu2rhZZZs8XhWkWrw9ouxFzp/4hiMiCez52NNQJg4j
Qdsb2Dud3IJouVvAjlUEbqUq02UnuNOIUbX8cNm5G2wBENjCM76No9DhXpXcESq9zROVfHlB/huB
GnnljiED2QDuxqFOiR/IIz+XoPeVrTEFjAIQ3QCtNCcDfOp4pf/XLHKiirDBI9w0eKiSB+SK2MnC
SY9wH5y9AQMh5CQd76VV++RFDdo4v3JiVzbBRT/7G3Ja3SFQfhwHBz4yfPYL1mZu5QVU6d5qk9IN
3/xWyZZ6/4cBSXIIw4uRIV+XOxCtfN3qcOeTPmZ4cUZYxrPZ1tyZSxoK+EtySDaqCAbMZCED14AY
0F5qMG2+Hn+oLOwdRs2RB9hrxXhbT2q6Kw5Ohoj8YiWveYdrLfe+/Eia4LPfxHCuTtLTj8pg3f4x
7uZ+XfAXAJIuTigcQF3mLZX85I2bZTpCCP+14NW/txi8vNXKs9a0YUT4FgNc2BJgSB7KiBIdJDd+
fNMT11/zQ/VRYLPm/QjmGNrQv7oPilaCnvolGFVdCPc5Rbfdg6pOwywmmGr3H3Tbcr+8jkpbSHgf
Q87L3IvTxPO+Lz30WzSpF1ubZgoneAZWvaUPejKUZIlxPz7qkYRCAJlqFUpTGnILla6TxlBdnFbs
q8lcMejPDq/S6nsGJadHKAVk+8y1PgVWpkrqX+gmtVxGLEeI2ea8sDvmmvYmZ6xXawLg/meeV40E
7EnNx/16ll2eZSmsLtvE5UP1kuofRWt0s6rIb2c62h/jyB7r1oLDPOkCMNiwo0up3cZ3kbs6SIRY
3u4lPGNjFsaYTsP3PgXNQH57vSBIjzdFdSBRW1lMMeRpSb5bHCuODmJHkTHeaX+a7QFDzWuLe2BH
CECntb7AJ/nGBZBmTy91+bmP2Qhwu1MhQ4GJgjG7mNKZsH78q+j2nAcUrSDZUZOh5oyrR8/XUIbj
8LXetYK1MyOXyhYuXoLr390BerZgg3Ix6wpKpCFLq7yYiP0LbNnMSuiwot+X4OVOFwdhOlnPKDrH
8pgL9B4QtkL2lrkTNHRG12sTt2c1V3+5SqaBYrJ0Gp9NFdMCBsi5RefPg4ML1Ya3MaeQTtV5bCq8
1ilDnDniEp42esRXhUqfdn9rPrmH++5+Be4jGnKfFgq9WOnx1f/kYHyRHtgWWQgttNdTg929QGBw
aMwsmCSlfbwwH6LmsDeAGP62qh55G4DTdCw/W6/r9AePOmXx0KlerTrRdcDetZgLbtrdDTJCZT0S
U621L3wc6daXcynbDCnFPOVIteHn3CVZzNN9zuCsnnQDPbz9CeDYlK0CmUY4VylVgJhgVBsWXvB4
fqNzBQqWAhTGguNHAzeoDrSXrRkPyXycMeG5lmMkrjnsenRB6sGpScp5KsbqgMzQvDm6cM1yEX9O
PVkroCWefvApG9e2evPZCaDh0za1E7TZthNTfGCbmlg3iTiXDYEutVZgFWhVjRbvua+WzIYbVibn
nFG29m9hKJHblwxKbm3QiqCmF9UYTpERvD0w7TeWbdm4aEP7LUZcXrrRNcm9iOZXanFQKLl815W4
qTS5m9kmQGFBEeXn5dXY7xqQBTfhxN3rKvcCKtaPrhJfog2SAcKOO88cbb53Q1wc342j1PR6/RgB
28JZBdHIHQiykedYO1YwDF9mM7RpCQ0bVPpTRqr/LL21pPzN0v9zLlXfQx5ifyW6oihk5H+Z9kTo
Mouqw9Bkt9pgLk060kmdr5FSgq4hfmmXBrOxLKyCN3SlJ0QS+UmYgkLoLpVgzqBVTNZ4UqrRAyAs
B240SOhsXHO5Z5w8rRbJyp805YlNSLzquI6nbYvA7Wff7OFk3n8h/geet46AOhlnZo/6hYUQ7EaO
+cE+/EC8zcLk28YvYxARO7SBO5+fv6tj9utTmjNLe1wpC0BWO3UbCVKJ1KHa2vnagXNtD/OcsI3X
6jod16PaU80dJyEWi9Yq+EixIVK+rxPWajx1KbBGR8G41qT71dqDubm/gaY7GNivU7q89Q3DTeh2
W/TpkXyxJbo90KvrUdj79lVaQJv4eaknfO4tUe9V52Bh6GmR/IS0jbq0H+qe/E9URpb3UtB3aO6k
XQbBGwLkGUel6wy3/7S3vMrbBs7hasjQogZ2cwUa/pULp25uRM9zl4L63Truq+VT0wzmlAfrcUJh
0DQgWVzbKW+JPhfnWmx1OVo08fmm12Xdoj6uvbG+wqNKCclxnDrPr//7v0PjMmyTHcD9bUtG+Vf+
NaH/VqoR/R9ZBnH1FyZBwaSKVD6iTJR66MSvOqE7xYivOSTHCJgMM26blwlCOvXzAW/fpGaY0IqO
7lW56g2fmqkuZn30ri0zCKhhLgxew0EYqBToAL3m2REBU+bmVaUFvzO4Lg/sCKxWzA/+jM4jFOUb
wSm99CihGCf5UUxUby7Yt7ZWzuD5IElWAjfwerb/wDBV3ty+guLY4PhXxyqs3DE7kTAqXbJxAcKN
Cur28yAXGHUb3/85MUDRDdQiLbPOtyylr0MWiMSlyFXhMYqUUKNIdFHxJdjisP/Bcj4G6Ho2kDnd
E+JARy0FMAj5+fxzIUYnWsZwwv6RhGT3U+Xs+R7eK1/Xs5kGhilWAHdhlln5hz8QvlgcRBAHb/BV
RI/a9u0hxwJhQ7Z2cPFw0uMC5Z75r9CbGc6uF78J9gTpKKzjFkAE4ZmsCTLv7Gk5VnJjCTy/Z7jP
69qV0AFD9JlEb+k+BG7Y3oADQ+N9KCrVgf21wsDD+1GRJfNpHo7B3uT06yDrle7s5A70i4wKrnzo
6PUPBG/hSvP+nv1s56Dm/zdfzYDoiz8+7iG3iEQkgGlSsF+Y7DdXSR+z3nuyQRxGsqi/EfOsOpVn
/FnwIOdmmAxf2v1WyuAKEvo/k5qjtcDKsoddNErmcgo2EddHb2bDHezkPry6/zwR5XCY4/xw91TJ
uB1tYosBjjDZWHUKRa27XaQbaS+t4DJN2oV6yN3buksBTde67kmFhUzfbIFlnyIilseMwZXKD4wJ
cjtJErnIzjgnMHzKmkvFjXKz2TmDpOOoUZIt6WUMRx/srBSx1BQtC9JpJeg/PyTB3qq1NfKrCdqg
vMCDnR9Mwi2TbnUhjJ7wdQLrGxTSijScUc9QImFS7inEhMUjOAyMc8ax3hpeJ4/bnFcbDjbBsd30
czxq6t1BPAQvyKI4yvBphIkH0CMNvKO/IEAmHcTAF71lWTHnyPtex8ic0BCcFFxp3T1Y5lWkyyVP
QxmwckKq2BbvSXRm/XZ3wjvF5B+aUsmP/hTJCJjKNHxy7jsJSwwzD0JiDIn7q1f2FWe1omjlrHcy
7dMllm/JFHA5BHMR59XrP42gqza3+0qJtUXtW0gqrpobyoW4FfEYVpMD9WEQqarBfFhwUlnHMDJp
Im1Y3CT1fJYH2doTSTivxxFgf9lnXmtNfdd52/qQjCnahSpBYQoBUzqsK7010plUHavnK6iiPcXU
y3+zYTPl6iDdmtyH2GraGyEP37yd5fWUu7Rlr0vGgMerFpCQES/fFoLZe0fGstIpW5VH2nvIL+bw
jQer4dVKkYakDPcwv4OcTKnIv+dTftfxRGNfyBxMhQ8NcMvYjMO6OgzaFql7n5odqbcncy63Vqfa
nkrw8k13JhNM7+zyQDlAelD8kCX7trJ0GqSJSSZCqH5RIHNf3kDx6hgTdH3gAUvVXmgzB3HsnL/4
ptwaicLucJK8ad94vwqZ/BtTXSfpKTPKy/9UlzV0hNHGWTmlfVbwDbNecEHPPKcQzMAzrCHQVRbA
eDDmlAEttP6rfIahyBllnQ0wXO9gcvYGR+tt5OFC42jNSXfeyifCAi90SJD/CCs0aiYgtcwWuPZx
yhrTJNM9jCrxY702EhNk78jXwDW1ACUoaPB/6qXVPsEGAUVtIrr0yZydPh57Mr8d6VV8/aW1V+a/
OY0JjpCJEfBTeMfqBOsYpGfoYjSs8qtAzds8H1tLNzjSZ3JI4f49wWd9NmBewaTP4Aassy31EBPi
EaZNef+SL8Q3YXovVnqB/Ttw9DxeDgu6p7+UHUqj7dByefu8zWM/uO4DVeG/94lDeAKa8kGra8+6
pKTSHhaVlZ0rqW/Wh+OGs55qpL+C5K2GusdtZsDmojAsOGyfTpwo5sTzTgSmo5+Q/VwsVHj1Qaxc
MlyIjvE1hNgNaXNOwjYFilnzXmAsL/xORF/LsFDxgq5addp9tqfVDWXu5qDqKAUPIByyFWQYnQR1
XpD8p4mjzitCHgSCCxa36DcjYA3shavcylrafR/k+k5a+cqgQMIqMRAxdr1vYoDCENMZyhOAIkos
fOZhOASznrpzvent0YXv9B0mgsbu3BqcnM3Ul2ZHjYpBu/5Br6jyG+pzy/T69Nt9qVuwNVikfbMP
cnRJuZoJ6jRPUHeK7KwL1E5+0peOXDQYVO9l19vVQ8D63qm5pCXSpW0MCIRFnyU/nd3STUFG90FO
z4kdr+4saqG5zQHne2dBdVoSMf0Bv6sV4ns9nxA6/xAcm7/jtTDTu6YLVflnUgqQpQidiFgiqjFm
bZwftr0dZk4hDKOyJggn+ZsqX/UkqlcWPybLd9dXqjLv2g0SqfjWl+meA2aNHf53pegQlJj+W1EX
AmI022FXse0T4slLNd4Dq5Ycp6hZ8+yEpO1+JsbQsveV8iP3c5+BIwhF6DygvFoGW+1RU1/1FoF/
6lGDkD2MO5CHV498hRtNThYmPXVKAxL2xvP1IwOJ8Sws02QjP9rIDejY6Otuco2cuVq26YySV1jJ
Dh09Q/RPnTYE48KYawq8BRUV/mEKnYz+9CdFHbCnz/Yxrt5dZ2at/Icd7Vj/Pm46e2+l00J4l8NO
DunPnnbY+1cUHDSgW5MSr9WWiYTNTIy/scjlxjcSUxpNHAES7CCcbaeOiWxgFaeBRnzgPwcQSLFD
BFwKEpHS9HKCYbxp3XqtjOaAIxn+8GY/MaeAzw+06OltOKcqrmc7EO9iKdyedzz5hLUfl830gOdW
F3zgQPlekKK2MUXU7ZkcoPTa2DvCFX+DOCsD6dhXZxgiohl1K5kjO2EFbxIHRqhAo194mDuNli7a
dmqTtfxbg01LY9zPxMBPMXJm7srgSiw+5ZqnV3MMbIE8NNuKeJUt5TJIx4YXeJAX0OkJdXf4pSlT
z4eyNfcRZhimr19nkgxc8lly9HPAnq707o452forY8wY7H27xRk2NetzsoyPY7MhQBjdcsCG+YBN
v29gGEz6O9QvRCvd2QAbKaWB/qWJbygG0QtOumsTO/K/njtP7H2rbtUcpPpt76OrfIepDAfPBLSG
pOwFoVk9fJxoNbQAD59NQ8h6hIth8sHX906e680qn8nEGm8wXEbId+rmkh1FCgXFhGGOB8Kn7S76
4DzEENTPQd1jm6SOMAQuwEbXN20mawLFNy3+iihzJsTnDI+quAM0IGGV4DALC4UbQs8PxRZi+lmA
D4Tr3j1RGSY75Dl9hg5cL7bx/+qgkRMNbsonKIwwmmEQSJiqR7li/G8yDzcS9VgZfPCRQykUXVAp
C7vmcMj2cre9RsC0lQZMUD1nCRJ8DHr5lt5YLPM73VAuIm2YE/v1YKR/RaUC+T1Z5oUeAETf6gQx
qxXTgJ4cp6+seU3FcMYy6pBH7UmLI5kRzYMtYUZ6t9+WOw2L2PbQGy+dRqSwfqyloNqsUGCIePOy
AFO90Mvi6xXAmOufsQTwAmsbZOVhgMB+O9lFD2hxI5XyRv7EJjAdeAEPbIAnA7nX/aBpxxy3XsnZ
VIpE9BqTzEaZeBGRXpTHkqg9YaXPmHTVeO1taj85zDzWthvwg0JxMrPRvc+qV3Xb4XBIxddpJsKe
rpDav1cv/qA/c4seH6zXwsADbI2onIdwqVTdzPNXDgKrQWWH9lsEXB+ByMZGU3zRdY0MwoRPRH3/
prt6tKW5PQOtoHNqmVsoNOakgmleWEK0htsqizeJhZjpFLR/6hfvnbEHZ7TNsozXLu4FPxihiOki
+QKgVkDYs6FgKysgKJjpRigkO7wlzu2+OgNb/EaljiDr7vp1iXc/PiLU1drhhnSZw2IZJjo+wPV6
5c8W7cdV/tY7BwzUv8SdFC3xu9AI/mcmmHAtWSL3t7m9WvgChaBhzLbJBbc3wbkLYMEIIUFURfzp
Zj3bz80zAFh2Ad0NTg8uVU380jdbluUmHHlVLZV7SsXPVtGkbXXsTMptlQp/uYHmUry9UPDBDmlU
aMfx8bIDLClW7uBKz7MrG3EhhtXAv5XvqbOxxPo04dWLl4/xPw884V+6aOwUmCQ08fgyMb1VI7Uu
8LV0mfmttj9DP+wGftmqWc7TQgZPJ8Id5tBNBIEroltFWrul80CbjlQyamdvPmihQ17361PITMyC
amjKRRwFBzPz2H3h9RhXsLAmmvkqQmLR03B+LKTEgWfPQ1eZvNU59OjJCm1xQhvAd64N9pSx/PD+
k/rvtuWuh12JTcRlqKyCIx4AbSJJaUx3G0YPFKI14n8IS+XTis0ImWXWulVfKT60nam7HT2ALdUE
2L2H45QLGIQRfP5YPABqx5rYr3jtathrm/+Kj2mg7p/JWLSWTli2YStPvGSRPbt5zLaUvCAv1G1Y
0Bc27xLRyO+g4+1w8eS3glgCFZVkSOaFiOPNBNRiOd2x/+yXTMKl8TGmIviA4OK39dsKOufFFsfF
JTOMqAHrGwd03JLzJtMaefNPl5XqunaNdB3hvUkwnMJh/xFSwPnm9inVcRAuWWoTbDDYFI0o+Q9e
PDnh7+PzEwHMVwQcoh56RucxGsdblP7PQkHKjyxIB66h02R1GDND8ho/8++XWrbrEeQlc23F+j27
F6h5N8AUo5iUznRbk91nw+jthkJ2juldqa04dTtebgBsDlMsS/LlnQfQ3savwInATk4qLHY2KzRB
GXseQfE1MMLoxItCbH8aX64ZaFlqTNX+bopAwk6sfjLEfSVq6Llhp3sgtg6RqzCuq8ysprafkaYa
qVqeWIrlQzoyiELqGVTpB+WGljP4sFcr1L+GppVOffrZyS6Ooqp8TJhsY0WJRESepHohp9BT1a51
d6qFkCbk/K7g0dFugE+bIwV63hnuPBcdYN8LBL1ChjI9Da+5pN3Bs1NbXsTbOWIErolGeilkvPyQ
/1tIVhLWbG5JgUhT2CqZi84kmUcd16nhfqmm4r7h5K24X3kEzElaaK3cqKrfTmD6flZIKwR7AZ/m
UPCiS8LbaH82iAyFDZvdifFWNUkn6CNOH6zeRcFam0WK46ds6Yum6Wte/WpO+ZIurMslakNStjc7
LXQh9TAyTYwSLxpnS5a8gT+c6twXvhYAEujLF4EFTNlMXN+HGDWQBTSx5s3mw0PHn7a08HQrn9ZH
5BLvyY/1nC/NCbgRSi+1T8uBR5mBEa5w0pMWWCB0sIlglcJbInZ8VmdbgXNTWNb1qPUwUjYdFfOF
S1hW/vCo3OL83+64ZTOhDvizBC6imYEn4sTRURvaob7r4H/1pEAwr2RbK1DTwCvPA1xiMmb7CeUA
lNkQAbRDgez7wbvsEpBYSCz3wphJ5kN49lA9ihgBnoZo2eO/JD11quLR5Smly/T2XLPLKecT9Jy0
6pWt+BquFIFrvIR0DcKhx8gqaobamXqxUi3UJm/MDX5VJW1TzJ/zioTFbIEfSFhREx1FNAvrR6eM
zB6mnl0G4lcfVuCk+YCPITgbTgvyUC6ZEq7Cvpmbb3fJx3v53A8Jwyf3FMN8xXwaDqADsK/q+6FR
NmFlu02pvqXgbM/GNQptDD9ObofR6DIun6Zkp+57vzoArGiF4ez2btDi+0r0NVTWvdnJ/6cvXA7F
y15ROFtJNnAOAhmYRzM6LWInWDDVQMk8rf2oz5dMYnvGp+NHqKEgqLlFKl/wgQ3L7U5O6bYl819x
XT3i7foFKG5h5FaSc2HHCBNqeb5sZuzboMgz2jH5MLqqs+fXeXcqpw3Hc0z2MkH9LxZpU9d5DKuf
w+PXqF4m4q/iaykkESVPeokMOh4r2IAP4PgFqeroZcSoC/kx/AQm3xGsVtUYO1aNzRFZchRfmr2B
7aH17CyX/WtrEK+cR42utiqXbB0Hkx7g8Y/alt0z84ftv0dHYQxlmKo6VoVgnwxN8Q7od8GPiTtg
caDC589AEg9zdZmwTDcDxspxmYx6d2Ic9wghCmTdKttqVz9j8P/Io82J7ZKtteQwM81Ob64eTmqr
f1dFyU5COjJ7YSSfIEYerxlpDLmsFMZacNOeYEzchTCjAgFWkehUvePPgNdcBLmIaPeKleksHMIj
M9TJVAOz9l8QTU3B/qkHhKaxRy2UnsU60loPJAR/08/iTvBXEk9c9hNJcqHD7VvCP6ppHc+/bUxw
trASPN1bXai9x7RlCUGAtKw5VeAhJtHP4xCArnXcjj89CvA0tOglWLS1TxvfzQmXwzb9Hf+fFapT
DdhfFSp59K3lV+7ZPsycecGfufwp4DhhpLHOiomK5+hYx/DY+MTmiVDKaSz4Lu95KMjtYjhT1Hvq
u9eyOI42uuR0ECFVTsPkDXM84eg/at96u3V71Okh99IZJNcpxGNEzqqFPo+CGqR+6mPDBttNGjxX
yEutR25dOhfw8A5xH66l8R+ldUCrPIf0CU1Z+TjsnEjjFoMKDuOJp7u+SMpaTHgwks/2hnS29ifD
7+TvVHcAnaCcJyCNuRZhUcXz5Us9p3kxYOAmn1oioysuzX9BD0CrN8fdzkTUq47zyDsOPrhs2Jpt
QfHvuUBrRG0nnkpSuLwvV9UdP+S5tz6u3ZckeUtbbkOSN07sUOwgalij9evBtgX0H6Ingw5vvpRd
5XKFn9xFzLfxK91ua3n+HRXlL49GxmMSC38MJFMqen//cq62YLW1YY70fSKUKx3/e6GxVnATzfKK
XynpBfeSjImIU3DN73Nzr8pl6heuDvdikBu1WytjI4OAA/PMc2wrQWSyDdPLZNL7+tAsaaPKpCqT
slyuSD6x2K650X3eqtfGNazJbcbboIg74FdnD8EOQM9+EDfb+X/wT3eF2/Oya1j92EGVIv9Uix6d
ScpF3fFBcveRsjxLAwpJOBIYH3nenQaQddUbpAW/GRk6QDd1Xh+jU5rHxB0yblp1YRWzBYLXIoF3
7ypXX52ppgMoM0jXojGIzto8FqVgPQVDDwC17KCHuAv9p/0W5ygxLNurPfhko8Dy8MUojDmrExb7
gUbw9Ndi6ewcbk4qrW8fsXhx6eQpQFLSsHIKJ830bsFfwb21y370bTobXjcJqswk6dnmyWoKWuyN
QZo+CQ4rwEmTxEVryXPtw5+NRyHXe4xS9SuBgEcRdoVgBrs5kthICEA1TTuGnFK5dM+/TyzVeIjA
ins02KxFhB/tAwx4U1YhDXRyC33hDoirsUXN/JP2ST2IYl3y/RDa+q2Npm1P6sIa6Kr9YcUBGfdn
9gNsuzppzoYvetxtj+4zTmGgF0DtuqfTZaBt6zFT6jkLJEcErhqQ8LBNRsfRfaJBkVe9MMrwiYeH
00qztpMmBkuHVfQVSolEByrbF6x/rFvRwYt6ZkwiE/XrN9AyhL4jw9uPL2oAGggJE5e4SsDYJGAF
qzIcEPYSE0FJn3wIF9gxlFoFOASkR6DYuLBzomdNQLpBXib1JVBpsCdlUoBf+KgJEiK9F5ELw59H
foP+MYADmUEotOC+4FR5NFPc5x4L7h32zcimgvseIc026hGFVM9LL060/51MRxCTP9QUwtNa9aok
xcI/WQimZ8nf3X2St5I2n4V6/JtLuzrPlEzLCTypZCksBZSdJ9Nx09ouvFT+0E3ZM6ubtDxJjP71
6kS9hm+wy7/NnhUH1wMXTm6UfSLGUiHn72s25eeYSHhbrv8DhP1Cuu3PyZRD1LO+4khGMpuVGqbs
1zDbL72NyIT0V0r11rFRj9Y/IT12qWBCy456LITbGSQXXDc0rxAqlOqen2ytzUoNj2+XUKWMCjIT
Sm1q/QrLNP9fqRb3aJeO89lDoxXDKHsYmH6Lsv6r3w7Z+dMoFw1J9jiGYhmvaRQ4yde7opEg3vrv
qtrOjcCC/O4KZg2U8C/bj6TVkKC/8cJHwAT1y2ELLT9D9ZmrSOO4vibae1y+sxrRYAC7xd2XZeXz
rAj1l5RcwUTmPsbRPX3krCOiH4PEbDfPwLfu9UAnVvGfkou4r3I+nzPslRtRPOLNU5PzSYQvcAcA
NPTg1kEOz6eX7BY2shEr+skghvloqOd7gvtIemN+EslvBwrtGPqQvN3opg0C9UPQJstKbbQMSP6p
GyMtY01+w1kVi/qSV0p8Yw3WHmpw80avq198ZYbCzaWtERAUOHT/O+mNt3bILr9HugSsPSXlMjdH
1Pl6O8ihZ8JjscHfwva6FmC1IwBFMFpZmDKJNZO2lU1e5LA9FZBXOVavkzL5yvTyM/rckLGgiBGb
0DbU6AnPGQHtLjcI07jkTLXZv0WE5twvuoAQQk372dB5vQXYUn9gjj4WvS47Jwwb4uYF7tcVEvtV
FT/XQ9SgNZdRaNDulXQfsTnfpJeHPqL+Oh/QuWxk2qYTKZYKI/VCshearoZhDIzVZkVq39lvTC5b
ALOi/ijTJpKbcFgS7IKAwvCqUqH/plTyeCpSGr5J6uf9p29xRDNjBKHBhmzG4Z6aGinCf36P20R1
9fNPqOnghqtIb8ySpsPGio21Gzmtn4wb8xJEHsb+p5cj/YUi5Q29wPRMY1RyfstkIaKfmA3Qn+Ry
lDpREqfVEBAzf1olfSJ4Ps/7yBfsW288tM0EkDtE4xlsDcYceu1Be/FJXkOTLF5v2qL8iHuirJb4
wrs8YX8YqrgSkF71d0Cp9FyDHW6O23yibwNI7jZ4G7Ln19pBywl/PWsZSDs2Fo79OzWgit25W9/Y
KM8o/3Aw1+9QfeZBPbUETR0P/Ju3SY4gyQkXYwFdJ4off5l9CzemYuoqMWIxtQwKWHjFAZ9PVdQ9
lGbLAlA3v5hfc9a1silVqlMXPyNgLXKpc2NfFdp6CW3fosEEAYnaJyxEZexc81H1nctpH8p5SkFw
oH11nORseLMrz1Z3d/0dyixVm3fCBTf/HoYLlSZxwAxTyfX4jAKAUuzL+MvZc5AciFHPfyfMClV/
iNejQbUCUosSF4NXkSxHlRqKB0hiYjcxXVPYM9YoQ6aoUCGorzWwhpFlE3p/+gn8tqI28UH71u9q
GSxTFCb/9L8JATaiiTZXKZ2EUbqcPORriixWviSEeVA3i91AlrfsZRM9Qai1dn4CaD/sgyJ/YgDA
Qs9KdLbuVUFeCK1/ZkwE7AMUgOlKhMPtkiyDUVGv12IpUJNTgjJBLB1Ob82dmHMnji/BeuKvfa0j
sQXp+nY17GYPBB6Vus3CtqeEa6u9s7SXGi9aaa2RPvOSigFKgjA7n4Yqxi4Q5N0gmNJlt7TTzptg
4dGApVBozkx5CugdkRiuSa+Xh6J06i5jTBu2vBH+sN8Pmawivh6qPEdglPPMtbMkDOkJ42YHnaN7
r8+uBFQP2nAHVaeA798IB7zr9cOunnWZkyfawRNkI9GuX+2IcYwcr/WLSrnjTO42pltgrdpIvgUc
bGs9ojI84GtXI5cevAQJnuy8GUBIvtZg/ykCHeAlyGXhcTOQblKs9gMCFjwosnjDyW0O/6mvkRLx
M+rxwV345dvcpJEf04FodCvOj1TdEOXNb7PwM1isv2kEFIe2OpgtuEv4oYs/q0Kk4FFu8QJVU7KB
AvD0r+U1uNpokLt34ouFKOiVQunMRFTATvNCUpkaSZ1fYyru8Wft8aaaemceBJbItAyVVyIDuk3g
vy6vR6J/uaL7pJZnSI0tt/UBNE22tswpAz1Fg8BNjcARXDuh2G8ju/F89RGMGqnTDGYid7aWamAb
k+V3u8NuliwXEycFXrP3Telo7VRmgawcG06Lbz2coCvGH1NJt4t+Lej1tRXlh0lNYCb4sXLJgeNO
0X0Qa8qpp3L7niU4mABMfGHfvAGjgvhPzseQBiBol/1LP9f/1FaQ94qvrktAZ+/ykZ823aZoAnmq
24CMs4MQ3om06ojYBX0ZYHI29WeLHYnsPbXeS6r1fhTOH4QmNY7x+zAIgE0KhKyq/YS88UuKm41K
v7BUaXMml48HR2ciszrE5KYN0CNsAX1NdJ1TtM2DWLhJaETyf5TU+3PD7dUhFWSYBYU85Dju2t+h
2zxR98WvDK5tHBqIIFSmBfuXC83WV8pXptOxjMiGJDvUgBsvwq6mLfm3cI/5VvLuzOSyXJiMcdKH
D65SEtSfIbrmF+qIwIaxBY/YMObDM/nczdCOlTvwnyJgVUrryEp7ktDyLy5d5tPNPFo1pIJzaieQ
TqnXLwWfcP1bdzGKrDd/HkNKTmUaieyQiK3+zd+QwML9WXbPLIIWQ0kqvWCZq9GWPtPOQCdW5VhT
vefMvm45vMyo/wZ41hiagvd+hqjnJU6lO6iMO5FYOCo2kP14G+/qa0QBbCJiSR5JkuIjjXjm8QdK
ER7ZONb4SI7a2OFzqC2pTZi09yE2nwhyhDxJ3MpUf1sjJbBgJ+zkpHogfKdnm4pu/6FdQVYJy8R0
gdwFQc20B+54m8rYKYcsaK9SBN+vVj+Fd42137RPwMfSZpDtPnixRiruRgZHawH7zlQ391tvE8pZ
Xoegjn7GyoZE1k3zuSecrri2XkxipS/I++mFJyKW+zSaEV8xiL0XpQVFyKN97uimOUE164kTSuc4
6KZLbk6cxGo+RO/DPL7BGrV3zR2rBJuFMrWO5e6WTdBy8+dD16nI1jUp/1iUKXesb6s1SGej06CR
PZxZ3xD8RJEH4371IBfdHcCxS12yjJ8xB3ycm6H3gQY8kU/WhiueqL00IzYVMsPzq3KYiFxTsWjj
fchSjkpJ6/Vp+6XNOX+sTKlhC/MtzxFQA12IpCFDeUyP283KnJP4hTT5FFiCNHf34uRtc39QUA5y
cSjre1QI4LF8lTsQSU+amhZjbGUOIaCONEhsjzPOPSPuldlxcXnLE9uhFrAgGYDhvzbRW8Ohf9ee
CypgBB2EJWPKE4/7MZruGOzfnu/lzkP+RN8Rxkvz4wjvBhrR7jb2c4EBiVSjgLPVDJJVxKSxxcJQ
iCZgnmQCA2Db0uAxFuC4fv+YlqmlcnAwQRljN+pRceG+Eha2IL5D1o8anp67s7py6IqDlLg3e4qV
xUl+HeXu/UsZwimVKSNFd6IufG0MIh6K1K/8nsuPLzAP3pvFks8fVA2DGifgEsuVg62e6V1Smp3t
hjjWW2l80CdpyIzfIorwvCEeSeno2E+JP61ij9+0R58JuDTogE+ZZsuipL5u+M1efTixX7sZb38n
U9bNFRDDeeIkG/3vnUzrz0eP8LCv4l47TfyK7dvYMNprJtHJD0Cxx7MVymR2ijA8+hIwiWeiSO1b
X+qthseuTcGZtY3veuWVMVMhaOZr49oDkWMT9yUfrV+//jC3gKNKMrHpdtOwcPdF58tkqgbNdFLU
x+1ns8aRrw4no3Mdg7lbVpAIOiiIm2gmCfhUOVlr+SX4/2KUBkSdYgeI+2jPYLcmekq/oYV8GIMg
/HDuZKKuIvZlUievUnRv0X7pkz3HHNXGV5iQwj6K/7+Ud74WJCAWBtIlG+JvOPaSWR0v1DAYRUKD
1GmvDDjWGyH3eAVoxFi6ET4WnJDT2S5PW+qnnkceYBKrKoER/04F38TcePg5bzIA+S1BtvV44UyZ
0kgTzIZTHG1Xhx2nxsL1TxaYexCQ7M5P8UMDA0s/mxce9HUe+FUmwlwUfkDydata7mMqHUB88wap
EkiMYfHX6nq21yERAOeAO2GV7DE2+WMDWAT9YAN60AkpuSn1Uz5pB5hELPb/14ljU4BcGQr4El7o
7WL4jHBlUqb1BRLSKXajE62EW/E7YV5RnpR7PHtwGEgxScp6F4ArgcmD7IclYi6VLqy+Tch6fOFV
GUcsU+ditOvOp5wT7RxoV+rwfsXRMwAsZyfbau5T0+MbV0Ha7rJTtAQCheWIjr5oqCvn+6T1JQ82
HQVmFG/8bYUKcHYVb8moDmFwoahnZtGMB2H9v441twTxJkKZIQwZMXHGgh5d0MphHJqGQEBKpavL
XZmESFKvBS9mjo6IprGhaFfq3GgEVADCgjNE8kjmN1hez92XNNrFKaGJFX8fLtgHnQD9kGqFIY/t
cLbrWN1z/gK4KAKavVvk5YdgQVXZ+0FyrqV6TYHwstp0kNfb4ouqiUT/D92WGAVyBHWI+F80cx1M
x+1lV5/IOBMLMhMGLXxm2ZJk/zJ7SZR4TT7fwtAz7EhKEEdOvvveHvVpsGplsVxRT/Mvgk4rBhVK
DrAZVcJxUhTATldDNazbFOC7IRGtfoutmLSEg/8ojCvaUMQOQkdiijNrPnxW78jiUX+WmVLt8xEJ
yANnGonT7EiIF40aP8o1LPfoGs4Lx7vQoq51PPCebfIuc63wEwfa0t4qirehfDmX+UvyTTVUy7mO
1V7T655gngDJ1RRivOGwpna9PMGodDew1dchC2WRDAzXEJqfGfmrgiKeLW89UXDxJYKSpAfZ+PkF
WPLJjLiPvR8DjKkXDbG/IOrsOdCda2azYL9hgKjprYOtmoxtkcUQnHutXdYz2slDqndp4guGjkTl
gAvssQKrFVRBQQUj00tDtQpTYVptEGMqdy7xj8Qjo9ySgM/8tS+k8/IIpjez6Pc6H03H+05dxR0V
zym50kc9cCEFDOQ24ACoTSSCbW/fF92FfEUfwv5KCbg01IiuraOesKQW3TOMFW0t/H3kqpMtcnWy
c1YjU/JL6IOM6JWMuH2YHGL5u/Z4xhHDXMx1GfwCj+QICwYjHciM6Zy9zsMrqbF9/nrVFIIEoN+z
unSc/iA2I1Cf6BG8Mxpvk7lesyW0QhYgQ/2Rx7s+2lJ8MHHdKWk1gmP0MD5oeNGBdqp7PomlmvlE
U44r1ighBWypAYt2VYJuYGiGPwQMjg8GdmW+biHtMbcXKwcjIgyioPQc+hqjW0g6gOloK7R9PThT
wSqu5JIl5PQjvmNH2YAYyYEpIy3gy2Odt3mZa0HoZNEIOXizGLBtvaj0XxLdDbbwaYT/R64cJ2DU
lMHlqh0zxguOK+NVbnfTVNQ5ip25xa6L432rBXnJZh8dcOThR2wazI/sXHKhRaYGfwIIHkAp073P
T3hCyq9gM4GBX7QwBVQNDaxSnInDqtpfrMJd93fjRJzXNVwzXPuudwg1VDbAViSQGbo18KUL6jYH
R1OI0FvDJloF5VSECxo6y0SQin1AifhJxHGWtC07qz/7ehqGp4E6ypcTnOcE+W81eBzif4Vlp5Wx
78U/LLg6BGNBohoQh1yRoixQImGOs3eFkdTNu7MbLzxAmG9jGK7ksYEGY4cX37RMCRFO9RWfP01V
xW2kHuyPNIqcuq62IfCPFDhw1P9nXglV8LC1UDfQLA1mDPdlYZ3JXEUWbvOTM7lz5KmZI/Sv6Uw/
LvjQFZiy3Mm55ciJbLkPWbR8hiuSFFpbZ6sSbtd2L8R+hocmIv3kSp4fAYj1UXoi9xzeg+7CLFLz
f8iIDBULZBfRPj/4Nry+8sG3YXKivLMJRqiM7q+LTaZme2RRQpyI+V94DRbzYaI0nNrZM2PKd6cy
+pnIS9/qrqHFT1foGG5dnQKV/uR48nbCAq7tTLNbmNfiaHmgz89wWGzfGSDXdl71sQsZhjyIhlN0
IVSrryISFf9BwVwwMf5+8DpbYzXLhfSBPCmDUShlGTgsiYIjFeT+5kFDxrs092l6DWsSeTtVPlfF
SE3+B5P6FOdlnYQ5+p7QRRgUauTkkwVf3rgyQ7Y/QtGuTlhHiq3dt2LEEJx7tKlVKnzZW/FxVdNj
G/NnSD22XOWb/JbUhhVy+OVA76A3NB0ZU6JqoNmve1tHcD9Pk3ZDgpABx1szfnPoKT/ZPoQ87/FA
BhBCcQKx0pmF8uvmMuJ7OtdOWcDJaK1hTg2XUh8ENZdSTHel3108hlDcO8PN30wClgECyY/EoiqD
UPk04X+jT+4TAncpG0cB+6MjNapBwdt8rnD9ky5TqdTA/sAQ5ym/eeMmkmKGkftS4Ocv6Cis5oy7
P9E1CWxg4k6keJAbtfwy2vF9AfLbLA1VyVQW+S5UkoP0k7bz4rfgmeu3e4kGFE05HKtO/FoLvbmY
jEMRvEBzs4vCm6lOFlIFB/1FZGYqpiAIeFUEUAJH6y5cPyrsuP6w5DPeIgynUmTvKslFNwYXf/SD
+Ia40suzGBSjYFQ2LG9eEo6osfjg5OmK21V+0aENm5gEG6HrNkd6Lunwxv7OUKf/BHKQP/ViMGhe
Hs1TxV0PMqw/1h1KQqeOMskBf1EpnqgcIXwdT7oHynSmJVDazvbdYqhMsA6eHIgPBqAcyXA22VHK
JN5a9hxZTMCWpxcQsZPMy0xyXyGB5KFycXgTPc1O4XO9+k4zM4fRnEa6vOeY6yx2i8nHR2NfMJWR
BJdeIy7eCPTvHyAzpPIsGhcFE5pxS/+L7J/pF9Q9BcV5AbtnDXy+Pll3QCHkRXrvFfRc2qLwOnm/
yHHJJmiY6WkM5Rsc4XMlgXsRx1+gKDT+Snnrq5C1rWY4KAcq/I8K5+3nxDVq93FfepB6AWeGAiG6
cNDK7q84pG8+Q0e5/qungE509Kb/deZc2HoGOjQdZDa8FdqxyTc3/offbIDPUbsgz2ssEx1IuCgZ
ZMGIU+Cd1hHewvKd2GonvVzk+gZBhLA/yc+F9hk1nKd2Ec9ZounkauYoTekcMO4B+lKWa6GzVrCF
IPeOgBvlHzatsxdnY+b3MrFgjvOGzkb+Bnagq6XJjPw4Ijccca/w5VZHjNjYd274K/OdeXN1gBBM
sw3ESbEpL9NEIKy2sfsGrUI+TywZ5cf3yyyTTQwClZ0ZgEAvIeRCEVR7vy8vDD7jyx6tbxyrXGgY
vdYFpE6Od/21ZSB7ZK+BwWmkobgIFUAAHgzwkXxj0+vqtni/b4ojKZ3apepvnAFZUU9n8MACTRVe
Y3wYtReg0JWpcwxMYo/gWqIE4tdzvnEWg5G7wzMSee5mNh1tZ/rtwJUDNJ8n0EBeeTUkqX0+XIOl
VtBxbiqSKMA1eZtmvQMxdoY7/JJfO6LY1bszdQvZGlid4eIPqi9PAhgf/VaMp2zytkkO/mQbyn3r
ENyaWUkhKreDr9LooyI0yyoyk7wneuu9VVMMsTOx9zsD8NJk3H92Md6DQv1ZBsNuTJ8CxjRuzZpa
Pu0uY0vFZfQplZAaeCh6eIpUZRYzcZmrU16FJNlBg16mhJA7toFElfo3z/cEUsVQnoiEMY8kbOz0
Mtn0wuBFy12xWEEVs6PQ76Nl1ialk6Sa81yHQzgpd6YkANRFmwZzJP0eT/Nf3QcZuzQP+dbO3XcL
/KHtjnnpzcGMM4EZhXqCz4cymiLt/GLLtP9ARMhCHCpVYslALbqvjznP2X84Fo/423WQiGTn2veh
oN6IdjL8pOvks7h4oIM4bI9PpqekQKbw+7XOXJu/RKL8p00uOdQXB3vQUMKOn/EOSa5QRaIy8mow
h8e8YFvbkD5965Q813YqlRdwa/ymezMC+nO3PTxF2ZXWOdjO4eWjnzAtRmalxo0W6hUzwpYed4v7
71uLhTF3bbWry6kAaoveGnB8ZyoRd3ttRfB9jbIlLElrAveMu3ThTH/QtzQEFEtgQsmR2BpQYzqz
NWoh35jhypTXLU2sSsmcJWLO79ZGU0Mx/RTxaFieWCjHCi4ERQUhGnEcHWxhY/cERpFq7YqjefnR
CdrLWkT1JLrPn0SihOf1rL1nfN7zLTWlqwxilbcWxGTVci9p68eu6NXf/hKFv6uSAA/UEWOw2CXH
J+HlnAkF6cJc6NbbUISjhBC2vb8MHpO8fZpYAvIH+ZShdA0d5qyio9wDQKtARa1ZfTZ5+Y5xrf9x
GdlFe3eE4DhyCBc7y4POgeRGTxbxaafJjQqKg1i3ptBDGmaVHOR+vBfPcIlspjrBBhLX1mdZcCOU
5tZnyP1jde28ET8XTcXZ8Fh3QO2B55hDnV6Pq2fzNhNBtLgGkIBwlybzkGwdEBeC4f0FcKD/ZMAw
7TDoawOc8Eia6c57YXHJ5g8o3hibnZZfC3svbGK5mXIRmmAWmE8VkXIYuKhnf57SxEkmApb9nzSK
6Jsg/jSVdZaqcUL5z60kmgEMaIByGXTTZhj2f/HW2aXvy2YnyIDF3eknSuK7LZunJDp/JJgI3Y4c
LeNWwOaMZM8eCAmJgBfJMKkOtz9l1+m4uN8zRC+L+y4kxuqp0+JWqMNSAXArcfbzTuB5NcKmeCc8
Nf84z6f5/tG2KM2ycPjTl8/aXlfTqYo4OY5Spe7d8cQoEiiHiALINaRmmjL2yR/lGxZK39As0fO6
xFDgkLa4imnaGPvjNPr38vWotBZkXWEp7xF61016CqSOkIlredP1ay5OO4kx0lhHzUifXXzLkKgH
xsYIVG/L0Hu2Fi5xpAJmkdPvKdUat6qGEkQN9HyLNFqdQdCYUIl18IUfg/AwRudJkz3Xcg5ur7cV
Dc0IgJHUVKIviV1jBBwZzCx4sFEx26ghowwSZbpq/ycXMyRQxggjGJYGl9Q4cuDBhjXPMNXhmpxw
KNT7a+8sL2vm9K6Tr/gFId6iJIlakVdn+QoK4rWAQwUw94pBaE/5kn2/u8ARoPJiAainw5A4a11H
BYek6dYzwDnHAP8lMO0J0afuoiY4W2A78NvrUKN8q8h+R1rkyv/nI2JLb5upEdThZIsOel/4+Af2
aWxsuYrLhYQvTM3t/EdfENgWNnPu1fa9OvKjFrIZo5wW/8WQisDRZ1Yt4uPIlyvGLy+Za15iqv1+
iRTddnOcbCeQEifI+O4t8HYscIpjZwHmqtziYqJgmXRXxT8Z46uV5f76NapaBqglr8hdOWwPoXjk
KYkCL1r8xiOtxd4Og6jpG9qiE2hZ7p2L0fIcuJh216GkNmB1443E//lc8u3F1XCe2zLMDSQEfsKf
CxZdeiCje0cK7I8YGtw7LZLqHJtC7jTeFIGfojU0zmZidbvnWjr2s9lDQhTSv+rFNUHveyD64Y7q
jmvRohYYCmki2UeaiG7CLbcEanRC3vvTi5u4X/XJ5U0+dozmUp+cuQPNHPuzcwcJd8/Du2JSnw31
evUW4acGBR836VbM4qsjhbxHNaQMooy1J1lc4d2W9Qnch8+s9M7DOc3IpKjP1IUxEs7YbYjROESa
CKib13pyFTiP0Db3ApijHol9xmRGjkTLVrRy9sFsJmiXYtQ/JcvAmqvRyWRcQdEYznVAL/LXIzpH
qYtc2ILYdOWG8faWwM0RaOszx8SCkGWslSqE6b4KBBi7YlRxadac/IBFbYCxzZZiUkdBYt8dGEVd
6EFi49ng1a9CbmPCWgPw238WNbosTxLyRhDkJ6KYxjG1AneyuSi0uP0msVCgF+rUB1nlMODk9o2I
EDoo2Cne7DT70U4w9X6TK5v96pwoM9w79rj0LBJAemVPM5y9+KRRmwxPk7UDx0RXKWVmdZQ5rcV1
6XSIOdOrEIqH/A4Laol5qxixCynv8S+zOTemD95piAh4fX5DBmLsagsq4/asOMIidj0/mgmpYKJR
DdUPAux1q3nndEvn2966T60bbcDiVFXIWq7EC9hYaYLHdY3shM8j4s2gE8HtLfYfgohshRZBq5dp
88YHjpeE2Zv3zEma5wCoTPg1Mu4KaF1mhlAkyDT8IzrTMP25wA4bFcIvOSSMQ8dMO4wrcOKiGmVn
ObtyXhIH2fMKj4Wr+Wmmip6YRxKE8uoM18ySqpnIk0GegkX1Vh4nBqKQp7IJ+bu74vR95pu872xu
kK0pP68EpK4S0jhFk4TfAKyjDdW09VB3ISVzeTzgBhBgLIIjAOsa1FWacI+Sz3T8D6OJ7+VRN6AJ
G7XP/oAkyUJxxToqnF57qd9FVN7GuABI/IKd/o58+Rp3XqvU0tGJMarSpA7ayPnLzMmEe0Ek5irU
Zi/1CUgtlS/uBxPCrLE21o60roV8BlwD9WJeJ7S/OZpJ1ngjlmd9rfBTgqsKcZTBoBe/Kjq5Y6U1
2NNKu/1etz44A9io7wIaoj4d1hZBsFJO1tDoboAend4yfuXC5i+Nnrgsmws5Ydnoz340m7LNo5bx
zodzcj3TpOYypkl0ndGPzKubVmo1XI/sy0eG6UThaR24d2zSZJaZgsqoPtkRpKSGm9jeC3rshwmJ
Zhwp+bng5PQK6ILfJbWytuh0DPfuh3FiBwlsov49G8ss1o07qKXeRn+pwdvgLW9kjZA0C2VBPK12
ADTvUzotdxYrD7p7Z3iYCMAnffDgeklRfLYGRCTszyooZIgVIk+fvMxnbzGiIH1GSRtXLrW2poWz
ezh74dku4srundfO5mdHgGV8lxuBCKLzvXqffO2XNlNWTWVs94HITvSNwPlWBrekTxMu3uFjAfDv
Po7rzCb3adDeOgsmrxaI4W8ybUilAFc2848xpQkgOeUaAA/98/DsiSMTd2aqHYMOCR8UFj+DPOzR
cY/OsYAl6GBosWgpu9GF9sArn0aWKRgYGfaFedmCPHntQiNjLsGih5GB/UkC7jAyo/JgYDfw3HK/
8nLX33v0kmAZ3OJ55YuYx8AkrYvq0IigVvXvEgOZOOc95bHJLh59v9z9c4k5lVM5/KweM48B8mhp
adk2tcEhazJqlX8wo/2vyx22xpWYi8LfAOvHf3T71Wpfaiwv3hqippFYOBthIwVoBikiOxL+ex7U
6xiFLB2oNckZMH0KIeQuRFlp++uu2U9Ilfz8y8CGohoEt0YC5ruVhX9omMM3iiBzz6mkatL+u+3M
ZpOXJHc5DID6CKEBMt61OFqG+KoxXi5dXoAevB7f+bnnbtcPZURcSXwpMQOHtJepnfvS4ITua6Zr
PaiuBg4u4T5asxZgoFdT6A1ZWhztmCdSwWfEnM7dIBjC8h2CZyao4yXR9z95BG9/OfnZGfjemu9A
+Xn7/+tWO74cLGMSp/ChAdXk2OA0LaJibSRrcIyqu1ErtnJDxjp2daWLMI9p2kkhiTVkD//QJYjQ
mVwIrZYGXD5WfRmOHAr1T0woiUrm/kqSxIlIjI6/y8Lqy6hJD1HeawcV8RH12DlNfRWTDxX65rUx
YErAagk8qITYCkHajjhtKtKnI7b40h6nYrNFnWxYAIar4SbzIoLsyId6aQ1j6bexniNSH7rwwd+P
FvF+/vIBitQHkMw1lzV608EB78UQOv+BxvweLEBBL2v/TG5q5BfjA7DZBKTuY1YtaoHg4mf4uHlX
rcAbY9sYeLlUrbvXFI3vP3hJher51Xrtqsr/5kvwJWKCVziQY9LOLgklP9y5s3/op1lw6uXBEkUf
Bt2PfclNZx050+gX4lTh4Sh1zvxVuOxAlXsCl9unM1CjxljNxra4yw7IAPIuSbSQLf/D3CD3QamN
RLaDwDMqlIw+FPLuEmNWDs9eB1p0JqCAKr6RaSD2b3wSAjsWhJNIvDYgUlAK7UxfEzE5M+CNAFbk
u1rf36J41H7QvAcQLzdrIXj25e5f2MiELtKu0wKI1Tvl9rf4W9drGJ+zDPLnhJrTBr+GsuOCbbre
dnZK0tC929ZImN5T7GLIIZBzeByHT+Q+eAFZr1W0gTJzQq61b2C9FeAIurAH2asB6UwDLf4pX2AQ
wBAkLWXGl17kZEIy1CxTQ905CjpCAd2Fg1F0aA/VCZyxcAgrZojUuhoZN7Pp0+gHhHAidNmXDEuc
Gk3fsi/wY9DI9wx0A0uPL06+vO08XORCUxiKHpoD1QwxBZ+JqbSQAB8nEuH2MC/C5gQnlnOp7CRa
8BVmBE4nwUsPMak3jr+QLmEx21rXGoniBYVhakWOK8GXYtL6SCjiEWae28xYXJdpMgOBn97ibIzp
WTFYJCaj1zbTjlxi9o80SG4Cf43UBEM6Yc1468Rwd6F8s5o5ggfpxZTD846Cy3lYH6TQEb+zNACS
FDp5fm/jLSxduqPhCAJJDDXX5yCume2r12ve1FfBRAAVjdKnwtTWSCCprnHhwMv2dciYAxk4ZpRx
YN1I3R76CK3JbBKzR0ZPHV7vtve6Q4f22nkk0TFEZq+GXsld6V8B7HD5GQ3KgFNa6wrE8VDDZBBl
opoWi9Pj0TporGKbRpfEfQXHYDzSJOk/OsnfAC6LBAfF3icKCG7geA6OsCPXWSPgT5JdGLhUDw9S
oXB8OTp99kL5dxi8jOdeJU67IXJNBL4Bn0wKmmRfxeeMKTfVOdQIM3WQgnVKdmf5roKf4sdgjdAU
6LtyI9OaBJsdQ0TghK3rwQtK+khTwY2Lvmx9F+aHkegaHCXHx0/eVprFRkILjVR7qnXFSfTYUBOb
pjmH5qknY8XGijkVa3YXbhNjIjRkTCWqQP+sQXRI25jUNffo9zF9l8yPOWoKVG/nPGr2ds5h6A7J
wVezdbwYJiW61NCAgOw8BZ/OaDNMMdc2w6GPlYJqDV+XH8hWgyuiBCK7ggfmwINQx08mMeQadJIv
n0hnuOCgcotGlDp5Jq6w3C4k/XtR/6Y7jMlT578dtnqE7qRV171cuYfDDhc5MErdnASuDm6JY2Xs
rVohDHBub3YKXsMH71gtDUOlNDxC5VVryZCPgm4BMpIfkN0cwfTRlJZbTNMiseK8ol/POHY1SQd/
E5A9O5Ek6i+q+FOnOoIx2LFQdvSbiqlA9j995sXTxrNvQ9LO/ci5IPdgn5DQI86/QI6MBtMZlidf
Mgg78rsWw9HPW+1VXTR6a3sOGN5KmxEr9/TCrQyhTqZlzlCp7maZY9LP71QaPoKcYhkJXNAS8Pju
/bd8MyXzqgdVDtYg8VVSN8t++6HvYPPPVpikQPtMkhiJmJPnQiiRXNXx/SmDqK7+6suvV4XhxdK2
zleoJ1dG72Y3TOV5ReCa58aianfHEsJDiIuKpFlUwdfmvmRDsgswJKu5sQsDgd65rba+seOmAUpy
TKNq7zwX/7iVlvxPuSB7jMgxZd9HfeANJ/dyG9ARvMIie3FDI7yrKbL91YPeMDb5lOV3dUV+GoWr
gRjX/L0ONX+IVEADB0CxAB56utztzYEJ0Gs+3F29puUc8JWpKVaDOzpVH4Z1psm2SSle2tQgv/HR
RDXF1/X1/bNz1XLWX/gvVCzvNcAcAoxsgdCbukYjFlXcDZi8cyhGFkdiRknsIIFFQAjNtqXy54sl
xsemBpgLEZCcmc6Ua6d4BS9qeSCWaqewaqO7oz6LBWFnYpfiup25fL10tJqxwDEIRgcTtGr80Z4o
jfg+JpkX2gCNBgnFw/5WvlFeShO4t4Lg6exaLtuh27ABASbruPqD8xtNLBq0FmDHleDbReIUAjiX
PblQT3zKUJ8ON9SqYu4E74tKv4fBoPO/O25wiOkaSXM0FESUVD0oXQ/WwLsPCXooTlbFXeLldsdu
IDxyzBnBYjPbqwTxE4GkX7z2BB7MWAW+Sv/+HysHMau2RwICrJiexVAwFXONAGvuEvNpuztfUvof
YKBHGtsiZnj/3p23BAmxN9KrSLHBzjy/2XBGh2qEbVGYGEzWwvkn3OVHGK/M4NF7g5z1r1bwEqov
weyMHfx4qUg1jFGLAwiZE/yb9o7s7hLTf2UqUtRoTbuJlDxrDY6kjRvl5JP7AEdRnqgUxYR2EJ5H
x5qbEjqeXSIIi7fxUQzMuXaA5oKNo+2oCv/VuSgSvrYogoKYcpn6JJpbvJQENyweN4eez0xfZ0sb
oI/fDzec6srJfCIqqWWOkce4SsSWHn28zWu5UEFGGHhZEBN1KSDyWBs3R++yVGGXdWQs4moaah3M
JlPBKFNKqVnVRoxBwkIGrT/58ghuBikaOMlRvGdATk4Q7zfA811cWLtNfx3a4c4xsEdU5pcYec+f
yQr4JEmFaqvYiNrOBTujkGf9SCw1KWv6UDPbYVJLYS5tUNuaes5AZxwf/dygXWM0l5tUG3SR/Xv3
0Oc8nb+E+LXAom2hNQ12omOoaqwgzX9kQlaJYO4hZXxIaiJQPWb6JXCIltzC5kVigYmd4sOp6h4U
543WAxUGJdubRSiPSJR/o9qyinzrZJ8W3ad+BOlrWl95Up1ySicUqaSg1TuQaKM5AhyA3UtH6eKB
oGNvDef+q8bbXJbdZ5/MyQA+8NE+I/hkFmx0Ly91wCYEKABwMJC2ZgWsSfihiHuVWaCfHlvZnSe3
7LBmH0FzQij+J/cBtEpjeOEyEsTAt0BSYCVjaEpZJoAxUs/lqjd1m3MnNK6RoUfAvlsOVs2Q2i8N
glWFdBYmahUgch0af7/Kma1EAEkpVM2CLbpxFYw8sgEk0TLLT2Mr/QdEz+/VUlpHzHbyhBbe0seG
zTj5elzJ0PnI+i8n9zTceRE7WTumXnQiedJQ0N8shbXx20uV4F8cx/6ZQbzgD94/RDgGePNqB1iA
OIZLZjNeEdOAH2wXOvfuHl/6XA71MGNmJ1I65CB1ZRALtpLtrglVFidsRlpXpD3HA1GdhcOgt10+
O+9RUvlRf2lUgxT07FLpV1fuLB9Fj7p8awrTcItjhFv2ATWqn+frwwuki7atVAX34VQXPTRPzW/a
reiyyRfr4UezVzBo28vOoxrKV6ctHWXnU0FG2/Z0o7KhnQkWSLCo0z7iupMyfAbwxtf8fLnxsLw5
UqncDIWuFolDHZe08VRjoy6jOvJpAUB3QCFxW75DxGMjTIW4phoQvjdU0ocwZVVAVkZctx3YGCed
apt8EFBbGkVCjde5yxKpFJ4g/2697t911Zf53wA+RRPoqPvE3ArhG6UdfWf4/iqANiB2X1PijZL0
jsXYUQrj3cM5wjbuWq5kR9aZVRMP/4xg0s5a6x+y2/x9svyVqqdIkQRmtXJqze9B3d2e9gElICMO
ZG0WRw6Hr37P15GEo0QVKmwDD7PoEihqr3dU6v/kCJMakQcMRY6YAz5zHp2bCKYasWMOsvp/8ZHc
/84s8DuKjkO6Puo+28U9kJDoITQCieLVTUue+e1Fvxl9iUXiFYFk792neLZVlFz9urD3pI7KAcdU
ycPgSJFTA9ZVHIcd+78XAwlGpSIsADazsFwJRf8XrQ4WRyeXUNzvKSrMu5z/wDS64MmK0oIjS/oH
S/7mtsZlT0B3B+knsRleeMUv+vP/ks3zxqSYl9vINp/Yd1jkHfMe8IpUAfGoIUECXmiChuzkdkEt
hDF2tfmOTSTmtXDWuar3qUS3TiOEoehqACZ4LyXmipwifmuhml2mlU3zcV8mnNglEIujozA9uwNP
o3JRDOyCLuLq/y5mq3lo1DtN+enkJOvg+0ZN3bs1T06QcOKr3uHL+198Yq+iqxu2ZktcOlU4YfHr
CtePFiqVsTn+b2Faq6rzx0EPr0ncMMoIisF8Sprmo3PqlfU+HZm+2cU6rhxs+WTt5O1M0P4sjbQY
U8f9gv5ehwinbNeZE+pm+W8K/3Yk2swybgzze9JnjkKAX7czdJ5Plnzh0SIE6ILPPvLrGlQryqJw
KyXMUJ0LjMAMb0fSL5ZDlssvXUnht2m7wtYKs5s4zapNdrXW2X4o6AOAdc8PP03/97MFb8aasEfT
AU1yT807FSz7hUxwo9vQpm6PPb1Luq+CJv121KsEzsMZB1HdQWaobyHYWOdZ5cj/7GhWEhLBcO7w
4GhxQ5Fa0GhlGACoppD84s+NcySSQopHE/k0H6ivefYZdES0CwYF4w1kxIOb3vYQ/76RxqF2LEkG
/WFUbxps5ktKfqbT4TI/QVpzkE4t+2gUOsI7J+9uIW1dze/XoKFgedYytbtYQ75oWjtEynrR/xPU
f8wR1JCsSJkU3+lKy6BnN5KMyIX+ke7xcQUdBzG2G5aijJehP1IWF2lOZCiZ/9zWB7N/t8or8Lyh
RYmqQTB451kAS5hqJQd4WhgNgBoNtEmD+xv1/yV4oIXno5+NBg3ZGgR68KOIb6tHLa/CJQGLaKk0
eE5Ge8cZjK1koJiphLZMC4WwfeJxHbELrvoTbXUV7/gYteRnQpM6XdZjDjIgL7sz/G+Emm+QRVmZ
x1K2xWB6NSJYY2qo8sTjjgZgGm/xL6CjceZt2fDlxFyLTF1DdxzPtndO3mQAACTJ1E75GUvfPx7o
VLbGuNQyws2fmiK43Kix71l29JSmmOlDpS6cLnB/ktsr4K7PI+AiBriORTFuAi6ByunC1ejd38oe
TFudChTv/Sp99wShMoqpZfI++JXUvtO9oNvcxp1D2rIElgZDmhwh38JedeIY5UaBzgvPa+74XXxj
zqkYXG4E4K2Bb8wu8CTd7b+qMHwmwB8S0lrGoojCfS7o/e2LziVnBBmZbK/3+x7MhGg26b2zfik2
iCZd3G8rmYwnNY5pvMZhk/23vQAkt7om9KZPxQ9supPxd+Aem3tPFltSsI34dyBy9e6tw4PLLrHb
cX6qdax8gkY20898oMniG9p7p2PTX12OSMYkF4YWWM/TfsuWeDAgxBooafq4bMODjPsN9s4Hv3rZ
bu9WJ03lI1togUGgXhE1kTUOPQ12cWcqyz+8tcs4919jtmrmrKQ4up4QhUmFrtNgKj5AKgZu5YAp
h0NN/w4IBPl1P6dOKx7P6fCQCOsJ29ZUSFvqT8mvWhcE3gkicuEQsTp3FSeIguaU01hfHKuwnABe
6AbSAjHbUSQrCheMsUtnSYmqGaaOvfjObikGNk+t+D6kGrWn4IxSAdUYai/zELi5ZXkoLYQYuaVd
nXaXh9FHTvzN2JIUolqsyUcJXvunQpc7D6ixUUR4nyEEy0ZYCWFhIkbWEKvULIePSB0PyN1gJ9Xg
T5p5JLI9+9rJaqN0ibj5zZ+y/aI+88MgWgzbadDn4arIoQ5y3mwn3NQ/m69WwbY3QOpwmmQi5tkU
sucnNpVWGA/GAiv6u6IJQpuXIHo93PmHm0E+CMSdPbtIuTiHwpmQEV0Zxh2lJFyT6X9LYlS5UqoH
Adunj6ECA42dsgnrZ6WYg8WPS6jBWkE/5K7fZ8bh4UIBq60NexfBwevOGDabB3O+RAayDrjIIUSc
K98+AQUBsbO9zWgQugZzJBAhffZmuqRIEf+dJdyR01i0P57Ho8+wr3pNicsYmzK0vTGOZL7My4BR
fiT8U1shdXYK2n3iqS6YjbyqDhNUs0fvpmpnOjNF/MN6qk7Jd3HX3pGXdx4He1/RELMlm+pIemoh
sCH6ZjUndWi+NNBo3cC3yEKNXZjKV7kQaBrjqNIbRasam/sG0mv8dZvR751tMGUs8few34r2v07y
M23Ub/sZltdglTPCAxc7dTEbVIDneqnUkAkTALMwF2rVWmqIPMNT2Ywu5uzFbw1HT04Jt8UGzito
M9lSRsRHc1ZATvA64t2jGzX1k5QiBl4cEroQnLhaALBE6Dv44XVXl0VdfyB40Wycfmu+/zorit35
HW72Q9jmERZa1SSKgUQPR8339sqOSqhzeioujufL0Xcj1kUPkvx38XMJSaN790cWK6s/bKXA7pUA
zwusi5jqHD90kiQsL3tkn3U0u/d+KXKTuaPFvF7scku+ISmd101UDDUtIPj2qb6VcJNM0FLXal1s
dlXPqpCiQL2/rmN6Fu0ftyXr0UCrlmniwOs+cgDdD8o9lR8Jk7b9FbAFWZc2pHdp98yxS9fNne/R
JPh2QmlYetJdYsleFwrLs0SHya9VvPhM0U1gFsIUCFVXAUoXeZjjO2TipWgBLyS3Z5Ed36C63vlH
YqOx6vQihjFWXd3zly9426I5oec2kuq/vte11sxoJ4aNzl7ENPppRBLJ5PDKWUKzmjonGH4tQW/A
akRL+obw9wAyTu5tItHeIyFdPanaQb4HURE7I4O4dYzPeIX3ERA5OzWWb54aMdnny9ON487A6fNX
k3xS2CddaVEc04iNIi3sz7EoHfr9vYfY7RcTxeXsZnQYCyveL9rSUp05oTx1RXQ4HqQpEmJ1rtBy
PxedL8m6WCo7jzSKQn5WzS1d0h1YrEgpxH+GIPZgVHrT/H5+gGFkXK1vYp2tKMNP/7FmayLciwL4
4n1fmZNa7SBSp5Moy6SXRlru2orkxFwKdTcOVn4XzzY82wTJogwxMpUATqgPbDQXT/qGS57r2oCt
fNXROEkfCAiyku+X1joCLADEUkX6g3+FI1me4sJl/PDrbUqT5oQEvnDjdRgfTQwLbpGmQTqLcaw2
6+SBUwG9Pqwk6y5C2nSkuG8sxAK1chjXkUrOWusSp62UaSHO2XLsDYMbZAQ5unAi5tOZ7HloxujX
Jpphc+4YGuQRK5D3G0P2I/gMum8HfF4jQW0Gq0CJt0vBTOZW4ooDFjHdWO3zdxdpTeNokXr918dc
sSScFNOm6wtw3HhSJswVxDwTrTjRLovRhSgmbj1a49NLyLBo+imnhBE01H2OzkjKM4F7zhGbnz9s
SviQAFeR5Asv7qghPIe7LGAFz/BZJ6eFgtpU47/uayP+IvY++EvkgzBDZ6Z943OxZQyfwpPFaNmH
em+T1+pZcPUG5qtUlvxkr7GNEp9Y0x8QJsl0EN8DYvGpvoVP1TMQSlEk5Qukfgr6xsUFPPHGXUqP
2lg41CbMRyDS0DHRwGZaAAsOg7f4DyFK4ssyh30/6hcuqFGYon9RcjcVU4yeOBztDII2fvOq8ZW6
vyZp7mnJRVFJihcRW75G93mTVeyJ9jvS1F5JLtoydbaUglDFm0P6VgiRsRK7hkbyA0hNQ0wDHcdP
f45NheMn79UaihYEkJsgpcgaCsHP63rd37VvZgq/andykkOOvNl4iWUsaj6FHW5Ptw+T/hXwU+9Z
nDJnBhDYNRtplRpnQAwaBkMCK9gHQWI6quZiOsMTuGJv/SP9Ho8OSB32Si2t100VvTq4VT60Iv87
JvnF7599BGszkktFYa2/TGHXWjoaTw1xJ5HAXHD2gO8Gj4XmyR9SVXaiXUbvKafNItVUeL1SonCZ
bfeY66SkWzjqArrQPz2pwss1xsNyr2uwdrEUeMbjurY4PLeyGMptLBLqFHGFpE9b6lN1VHazcw+M
jhvD4vKZEDAhOOtzxeDpUDPuiwktq2ueQibO7lC68mc+T6IZ2YbVb7dTpJLt+NOAs4xEiDcCt/TX
2Sbnn/P+zlxiUdP52nfFxUHWit1MRsvCNUgA1xQU4dbtW71/SGNIAb1gnpvntHbBfBa5SSTfwQs0
hAyPC3ELcO0RGTi7IYgi34UjDc+Hpd90gPnkCwHr12CH9Pih9y57GJxN3YA0ShFvs+0jj9ctoJam
9EqHambltalYiCJtXZlpfaDQt4eGlHtTEysGKEAJDJ7K12CRpGOej6QM0G3ELUe1Xj4hfwyQuXqf
TtV3mg5s3xibjNAcq+gjrXix5ztF4gu88Y2YIDzcgDDTEWV1EdMxw0LJaE5uDF3lMcrWK/8oyoLt
JaHSpk7z7CiTlnk29Lq4/EeIZuObrEcWWrLbWT1Gk2W3q/zMd3q0N0HmTv3NryDAwG4Jn7F89Uu7
w3bjMlPOOLprvQtYnfoiEpAPkDeg4s0m6ghbYqkMuhyq7r42c+nu/sYRd287slZNwafCTqVxx6Hm
1zyebvWfbaUNBJoJ+iEZNvtiI5OpT3AkoQ+6FAtQQ6QFphuTToMjzitDGrrV34ZI1WRP6Vccvb0H
RNzdEN9Sxp8NRJPo+N0xuAyVl82qWViqlMi2jQ+3B5Q6y9Y3yqhoZdRztIQymHOtw3jIE0XwcwRf
kqAdDuy11Bnm+ZcEWZeSrOiXTIT5v4mMyhWjsCeri9QgjqolKoFECTGAdb32AcfNbA58vYr8dLG5
4zW8hUUnxP77EHMn5shfqUNJa27GmOyPmmeiSEeq4MIAEbWsv/SjpDY2IcjUNehM59yJJn6PzL78
XOWkCAXVRtKl9rKX9vrGRlIB4ydvtfYq5QRSOHtATBgh8AwO6AM+5ZOSs2Uffm/Fo6S+iiwzoFTR
kuywwpX3P8wgsZyjL/C1AcTiWW+0hYk4PBCuq4h1W0F3lLkhJva0y8XMRHcZQAlFTXDrgyiR3Ot3
Mr+5d5bEbyfL4+ewYdlXd/JNdPwWWfvCk7J4eYMXhCuU7lS0dLZpbgA623hhAT74fZaUelMP4H0Y
3nAMCHSPtIeONSynQocwkSHFZfMoTOAw7hWZJIgZsTU9dAV6ThLAtr/SW5BqSAcjkUpmKZhWo+v5
4chsHEPNSfodfpwubQoSPEsI10QEqY+AVIxcQRUdgAQTFGk2VmZCj/RQD/QI/ONvfAZT/dUO/jvi
UbxUluai8N8f1kHEur+ShHYGAfjXxmkJye9iRou49WVEZhiIRbxESx+GEDXNFq6OibpR1DRaXwZk
BYLXFdh2pg1vdR8KHBbZuB5ppgmv0+B2FBCfXrmr2dM43f3KdhR3uXeP1Nxb7+LY4ZO2ZrOuS+1t
kkghBwaK6UD89WHwboQcz3zs58EXlFSPVcbVhMi2+h8W2SzKJfEJ1bKjQ8QcnIee7MBUGiYc9HRI
JpEAh53I4ZQnr9GZ1SALtiqIFSPFWNhdOEQEBu4sMw4paAZnPSQ1vF2FXLRpylPbqX5J11V4X2fx
pNKwirKpMUq7yZ/Sp0KG3naDHJ4qRtmPLVvdrOp7j+TxDcGyJqzwxhm14sGjrC0ghdoj1O8oibyM
zlywBNoRnB8jTaHVZcZ2UIpLAEgx6mHQzDrzFgeRqdFtRYFp8IqVhp34oETZHnHU6x/nA8YpzkHl
rroC41yhBzEuSuhnOPIT6pLQiivO2U4toJ0qK02UrtjHI+1HEfEIX73hPLMKuWOZCIjFCjp8pbWW
fkjJ3Gd36rcnyTLAv0VrtXmE0k9mGmo9C0gXJnz5R2/0xd2k+jgHnBXfh4STIBiSa1J0bFJ+VGp1
farp73cQ0ennRhyitVUPIgaqdUczhUsHZk4SXNgIcljz036derQJIhhHIOvobQdObZYlOklHGbvD
StYbjtYz/oVyBkZjVWG37wNXbCPZnpBX74oFX45Ggei5pkuH1zhCMf8DD/BCFYxtm6bI5QnUfMgd
WSbUvbwn9W9S1sCrRbEkNpvPCeUVyyWUfncjqDeHFpNl74PwXsM6fO4Cj8ESgjHC98j0ARyb44JS
bMZ47jiepTA/3wc3hylS5ajL1cetpXDsfIUCD+mG/vq07uG5laZ29DHDqo+QX0ji00K4UhHWv1EZ
3zxnIFJWqbI10KWAbYyHEe3OSW/U3vY3gB9ZE56ENbfhK6B76zPDgtTUCQ5dasTMDtNdvGzol0ip
14SiAOXWDNZqZA+1apjlXVrGpTHG+duJYG9j2F1lj7+eBAR7EElqz5S3LAYaIuph4Qx4JR/uRNJO
5+Fl8HbDGsoJpOcFsrH030sRE2Dem5lf2G0iap7qePKVAWXig2Z4FK3d6Mbh5ApIam45ELqiTOJr
SNpb9BWsrRSLc5K4ic4m6vVTRHXMgt6YFeWd/bvEdxiJ1HeU/rJc4jctfKa19yWqHHAFiZkiM9wN
0KNyJxptILrd3S1670XItZx3M86QsGiV4JeSjfTTEtfD4/wkG0cU7/lKxXu3KE6nWKWrkV5EMyVb
+LbyHMNmxJLZc/EPkOScejjRwF9ZLFET1aWuF7OvUvb0hp4YBodW71nn8aeokWbhi4NgsmJMf9b2
7oQXVfsDHuIdgI8EgQQYd5lRUsKZjeSnTPJSpLr7FPaDUf4x2xfVOOv24nOHSWWTuQorkWJgnLE7
5EsyWu0xLxCuQWnq1ULyU6J0LAAsajNQMhpD9FnELZTlY8L2Gvu583lJ3gjgSxUp/b1DcD8CS2Q6
cg2LDeZsf2xnikydT3YppPAEEw+68pNfN27mUS92yoAeaP76DROhOrvcOZYw7yMO08wtNYalgPE9
OZBbKZuuBq34vyATUF+w87j+U2IGLK/dQlEeGrSeOOQZUbYjinQ8ERwNUh8TIbRjXQGaTknX+H54
w/hu8Jw4fB4HexATyqxgD4qkSBB9prTtw8itqRnYGkGyNpAEUiqLchNtJk2rEUx1GHv6wqrkXCrI
lXQwh8obbG8oztbuBzN34dWJanoorTOcjwDMvLkiiA80J7ftA5sdboCki9Vf+4ZBB+/DOPLcT0Gt
iYwm7vOX/2vBbTGnWfxeom0kBhuBpBcCaRoDulX9c9ONKqBVtdeWbFy8qHuhZOy7eZcmh0dai4ys
4lNdixFR/LRp18a4psl+iN18vSRM23+7kE6hzRX5+YwTFkd4iV9zttmIqMCj+tz7+/Vv4PwMGs6F
JxymsS6Yzu3aoGCbA+cZb0vsK9nwnxe98qVKLsSOk3LylvAmE+BT0O+lVqx/zdpygXPv83qLCE6w
gMgn8fsmR8wchwcybsRJWwxK4zpcakzk9j23YF35DGQt2Dq55IFmJ4CtApmNm+8mvePgJ6lp+fBX
7klWNyELfFIY1fYZl8GSW9VdiN/tWjTlMVzgJF235ouDG5cPDLZMZ5SwoUae6yBeQGtI8KL/wrfT
ofgq+sK5P7yujutLK+LhdOBFTtOB/aZPOerFqVgqrgMpOZkYaoV94eQTqcM5XGkKH8ZmEp1QuP7f
/XKrz/jpJcXiQfmtZDIZQnAJBNrVPqantQtXEm1o9Q5l2w9VWqAoQ5i8H0d7D7hS5sFVsPKgo5ZO
JLG0f1E+kmukwtOJWjWGyV/0K0w4FNzBN73x9jMAaAv9xXYGM8IfCB8qmQLBIeiakG5njKpCsTFs
hGYgBuQTeP0hhqotmFdaTBQcqocmmp6d05OMMfK3w9TQPf99t11gJbidjV6m2YzgUg9037qXlb8h
g+U5q9P+6xLkW0w8coPFkpCPycBXh5R018fbvLBjABThtByloeeXvqjCl79jRhvptrjYM/4lTmyg
1qHZFfKFsTUNVJ90pGtJ+5i5QQAlt6y9uZSyhLFclbQkD7d3cLBKgjCxxNHpRNLTV5RcX9YUbwQX
iGWOZU4sRYjWAUvMsB1Sa8K5tmjyuAFXPYqJe9QEagV2GDOR3Go9SOm8IrOwC/CibPMRrVftfmvd
v9i1NltNEVUsxLwGmQMEieGM0gBI6hwbnWxVDRJasrQcRJR7LADleVkrdIJV5AFIeLL5tHkGi/p3
8f+/B31ZHxRnRpQ70z54ZdHr+Xo78UCGCITx029moqn1QbQcQRFTkMW2xDvQ0fkw93njaYqje3PD
vlDFmbIjrCg9mFuVaxdx/olqiHvIh9fR7u0/DccvzYqQjwGuEKlDfZMYG+hIavOhI3zPLJ4ZfJr5
+LHDvHI53AaS53HtRneQSf1JVFJdzIYBfrOTsb0oJP0pC5jaZ0O5gqtzsVeWiONxZ7H39W0kUsFB
Mumu/nJrdmLIALm0pY+gI2xWtE0fv2zKbPUrbDQC70IO7OZTlwVMgx6gOgu4B7y7sOyV9n+SNOAc
v9yM6VNg234C2TkxH79NucPilQvSy3bSAFcTnOT37Nn/5azNV5lGrsN8U8rhnfTf27yDT3UWyeeD
pe3b7ZJ9v0erzMZ8Ic8DQhMN8Sst3pF0E6snDZH5wAR/yiOgfYsy9+BYMlfhJnEPevd+Pw3s2ytM
qPi70JgkU/KAhkueP4XBbhBiQ6nV2QttLORROtyeAPruC6IU3+3IzF3R3yIG421/2P/ryKGmbd+f
Bubdfs60xCGNuJup+DnKDQgBGZHneNYR6E70Q21yKULAD9GqfNXnnNDCAsSJ1zueW6piVugy3h3b
Ap7lOst6Qk3BF4JL/bDaOC1v7dfU7QG2+aVTMRNlKe5evwwmCBBMMpECnuXml9jvM8VhG2UEy8++
5O+53IV3NX0uowYUQesArCElwZtDONUWMcOk9h3PGcgaeS1ruV4VGjhj6ZsbicwY6xrSliIDDwom
8HN4OFGjzq+f8Fb0xV9uYUHGkF1dV5ekAMXAg3+RqUwntVMfmMSam7cP0g7aoAE1lBKSuj2crfRW
MG2aq/hHVs7WRFbk3LzWlrDP3GxplRusj8l6InQJqqCifyTuCf4vK8lSsk6bBCIdB0KtN3cHuiiH
6v6XHOZS75U4sltlwS8gQqUpr3YHV1S9VhOuoqRKdxO8JPlCBzuBzHiEp8VIL2F8BXgkNTf6cehy
15L1Jv9fAZ7rr5D7NBHC3Q3JP9jpfXqPGL3giuBD8bhlNn9DdMBE1SYBoxnNUkbouuzrFKwVMsh+
HSZ7pthk/5fpA0LHYHrX/05QKvvEw8vI/9Q/FAmeny5alE2IVLUdJ/2tIA5WL2mj6D3lPnoe5vkQ
mCSARzgeSQdHBkKyidCqCXicExtVGO34CGCFZuXsTpMY342OZ2jwTls2ii7V/Ebm6abHoBkJJJeb
m6oNQhuEmD9D6Mo8/jDozsRzBjW2QflvmRjAPVfmb07bFM4QDEUvdE9+kqka659u3S/6OdUkOWP0
1P8n3ressDbQIdhCY3234zgdoyUaqwm+tcUGS7Rjfwvl1wVmgcN/XiE1px4gwxFIYb6zuJCr1qhn
OWB9E51UdWEETu6irSUxFJWOkqtc2l67+CK5e7jHnUaO+f1Lnrqfxcls6m5314typ375jDfvvuEJ
3CSyPocVTW+T/DziTVST/8njf0xvKs/FnUhOXGyt/cx/ac9ewTiTMFKmEJW+35JIuvC18nxZ0DFI
Hw/uULsG6xnjrjkfybu7RfCCk3p0Ey+lvYOTwuDAsznTG5JL1LykWjowFzmCfeKk8knjMbngSSzQ
tk2PZ4RiaOGD28+pMpv3xERSqN213uvvk/AhoiQcleyYe1MBcFHzzysyMifDbaMcMq7IGu8tsXGm
+VqnIPdNTc3jCey5CCCIZj0Wc+f5c3T9MQwyHgBtAdUFQn5BHNCOCa9oUFLpQY0kBNiG1ssbQaT0
s6Ibq8FQ0RE9F2l6dsm65pia58kj8vzwUloupWMz3td7sq2oQ3CL6uBOLu3SHsm0tQqS6olut1sE
1AcUn/oai2Sp1HX/Ut3uGOMosOxrCGHk2PB5QZwHmkJsNoMHNqOLHJbWXQscvjP8EXooZwsn6n73
eEve6a7IeTkDBbqE5Z0HN1Wu98arincI183fZ+W7yr9LXJfbdZj6fJxq86L3Dg4TQlrNUHSHFht+
nQWyzjy44SXXviypt4RkQR+KXasR3LyXhxsc4fXUVUqorDqT/uz4iRKNFY5xH42eJWDVpsIpYBLF
3byW6moNTDgiBs1p2eB6idusnqyEetjgRYk+SdcREVT8IBTXyDzWVGfaS20fUzQvoKzrKck2cko0
47+i0WfJx9tlgwd8U+/IBJl2swsI3nZcW/kZqgJ8hjIv8xyWQ8EIPjc1lhjSRrYPNQ/MRfUFkhJS
5sRJWoSySmqogEEDvGxEtU2gXBcH2kxxtp9Ot8r/ljJ3fktgGNhTc7YHAGRYj6oQmXJNw01NRJ6s
q3hQnVEld9gqa5+TIkvb9I0vPfRXRLdisS1O7ZlIOrBdIWBmRhHeBbA2o//HdY55/gtK0W+7L537
vOD9R7S/xBvihUSTwoxYKxBQc4r1fsovApbzX6zfsAAAmS0b8ca2NzkY0usrc3/oJKunnp3za94c
NVzRrTLCcwWeI4K4zl9wZI2Cj3atXFYtM89ZG2NXVNBtAib1L8w1kg7ONKLPV7ELvjDnoYBg3gxm
1f5i/TRUJlkYc6QItUd1wFEs61lGoj1jwYW5mWII91MCKZrx0G1WuW0Hayf/iK33py0h7JbsV5yH
oJiu9ZN9IRGH+emN7ukzyVfZ2L29gFqydWP92D369vNdOKRUTzSE7WFDyvE2AxGXhVyjH1qT9azz
icX/spRetZnyPjPfh4EgQ7hHYzKMiEFgnDUujjQ7fPNGd+kndK72lVRw100jjo2coNVgXdqo2TX1
QU4MFnc1FZLC0C+4mHMhUPqCluBV2MnGkNweNxu1sv9CXG5UckN853vBwOu438xyZawz3lcof/Lr
YXt1uU/WLTwdMizTOZYWt4fxGJR1skFB2SPU7oJK3RFCwGIPf0KRI6uhdc+7dYWRZNRutM8kEHx4
JVPSu2QwMQItlMnW3DPWdPNwvjBpAJ25KA1UdqvOV6y7jTIYfoDG0DLLvxnjl7MLcAJKEnjwTjVG
8TdVlj6sf6pT2+acGi9tx2oeJhGgj0xm+b2dQMZs0qbol1YuZqLHIDKzjKFm5XGkRK+wfQNUza7B
gIpPA8PFZS+X3Xmlrovv6an7pR5XHoUeI1z8q6ZsW3MQOgcKJv4bUHASfTms8PCobQE+8biUaaXt
GMUhU45jhJAKkyS5Fh+819Vl7P7gkj2e9WqanN4d/Ck+8Yi/eVbEVztu87pP9YYmgyxU6sRYEAEC
eRw6rR2yn4CrcSQZihtnm2hw4FN29ITUPIPFXoQXcK9EoHrX5wybogAJ/qJjOH5Dj5nKnI0C/sG0
CmTLiPU+jCFw92biuQWyREHjOYwU64Pa+6eSXivanJH625vQfWLTVIeJTRrW6S/kAqlhLn0vkkIg
h4VMnYtwn1hUh/+866yH/fVkdxST1ai+5WWa+xuTuYEaYwmDD2kWSsCy0PW5En9Ibnz/yu7X82x0
gwOPoes3BrxCLxj+jAU8HGpz3dXvqQyP8gCVISuSOf9TsmnIfGIS/SXSIotBig8YwMH98509p5o1
XnbXvwFURZQBQTHBPE3IsN5HWqvVmDmTTD5bxJcRx3Sndx5OxeBO+M/DS1lsp2gWg5s9guiFyy8q
QF1lr9wNSB5bEZGkryRLRJqSlDRDjoJXLmXzPJ5MTGgMKFj6c8Xs/aqGl82oLNKJeiuzntoryRkS
vsxLyyPCEG0+KmNRRxyUAl53XDrqtA6O0PryvIfv8Un94Erd9c7nM5lJzzqGPvvX/xgi9yOwRoMo
jsFM7lJSWIr//e+wALfzLGYOyYmtf3svaKmvkO8u5w+OjH8BvgKCUhLzt/Li6gRh1VQACj0v1Aa0
pfQrrfrtcI06MZbmXfZJtMDoe8fjmGC2P9W2ks2HwcwFnQFs39zhY0Tyxq9A0qI7bBZLAUWH4+kP
p7bvx18X8EY7JfNi7agumA1VZK+CYQrgf/jGwGFYQSON2hQgqbBrzHB8v7dj4O8h1tsh17HBaA0s
M02f7EXVGQK/SxUVJ+kcsIiXYXj2nnKX1gR1uiwS2xPZ59GgAp5eJcWGulxABJ9Gx2FJ6olBpKNE
cYarM/pt5IhNwDG4gX6fB/Gtw1osCKdm/BxC0+2SQMUJYo6LjKb6IZU/J2u+GbycjpTacm9nLjaf
Eemtfy4/elXrz7BT2XPdnCgJv6amt+0pTcs4eBeDSSfUdXvfo41P2x5gMGnHp2ImWG1XKNXxn22L
j23PwJbnH/yv1a54bz83Ld3O0EJUkn0NYCNSELjPRhpO31X29cc/XhpzqGaTD0txwaQLt/VRetUE
c4SInhu+8lSRWb6HAf+bB4sYQFNsAgVDnp6DyPJf6Ai1dIzQngD2sAO6C21fWD/B250NUGoX4LAo
Ey7qA8Ihi56zETkIyihJbDCXerM5N9cx2WlVru7c2d1fLXio6kVwzhujxTYCPSusdjwrHwhtMDFP
5x3X4205suPF4Q95DRvOIY0X43EQI1+tnpXH/5Ud0pTkZpLJwCjNVzpSHs/fwEVhp+Rtj7AgjMXj
3qFyxKKNBPinuslkekQmIVxwqjdYGam7F5mUhDjbSlP73HX/ZBRbxCfA7KLf9PGQqk4YnOJvDZbz
mcoaHxwPLUMXH3orQHe343Lwo/y3NCwX7cW28jY9VC6FNTZpGX7ZiJEOhCYWgBuPGvbPPZl4Sjtx
dc/7wYtsRvdsfr/UBeTvBoIqmHyD2tpNwDN4EcC3r5afxdNjhHtMCj6yLlhMYJrJQYCxkpHQPeIF
yAcf0nnLClG1/KD6UydXHT6+enLlQXu3FOCSOx7y9kwPuabOlaad7GvcOb80kvZxg1zcisd2Jg94
yOaGu3rUJSHWjuNnIXGYjaSiG7lVwXR+kyXK+pH0WKF0C68lvbcg/lfr1O4aNk+JImzKwrxrgeIH
oaY/f7QlBaivTqUDnDJOkoXu3daYqZqzL2OwCawt6cLJmocHD3YPaDsG1ch3cJPycyeyP0Xn55XA
F9Dw55eTEt1v9nSwgtI33Dm6IFiqGL3EI9Wd5iszLCXpcQaurIZNpVUr7Js+iBMLHi5yhjo/VkZD
EV5dlC1uEFd+Dx9CaEHK+Op7Jm+CqtaLL2gMYdRLH2p6S/RIfS8fwf2Na3IFfCW5d0k/GqcRh7l2
1b2TgFzs9mlL+gNVqwdChcIsPGvVVjfLf/Vf0zNUTR2sLpVeUkn6AQ89lQMHuvhSaLGOKR51NHDL
6mjoEFOMt2gBvHOJQZ8S6WdNgXltdStk3iAIXh4nXen66b/Rp1eqT0pZ6RW2L/MyFA0ko06D1khW
O/nVSIiv9rDINm7VvMS1aflz1KiTqnOXhIw9RBWH8rY7RuhzuGDNoxOxwVdpqrjXcmYqarRUDCiR
7a0EEE4lc0KNEiwkhmDdo8fSG6PfNEXY1p5DmPmVcbAt/68Q2/58vZwpK3g5imG+YRwJDe3aIw4D
UEyEekRjMeYGBIhFMueoKjCv+T1LBbnyJltITsvHeqeaRvmjJfwhO0hIRc8j5LLZTTQVhiN/yoe2
/o5UzNVkHpWfrRwkJgs69E1MiwCA/P9SKjucOCLNiRSuktbxo1+ZaiDcH3+wVXzmrXEF5LgkkzbR
UG2JiKwE7yNmUAVuU9RbKnUQqilkfOHzTFaCAw/o+RSjOR23+Y1D3dMnfnLUe2OhbtqT0kIPgrog
eNhyvqaqWx3BtG2tzXPLic0qp2ZHMxwWeXZChXCjmY7d/VZv5msMlAxwrTnE5ie0rgipRs3IIyoZ
Gn74l4xR4GMcYKV3AYp16sS9ZIsFbGnITg2uhF5399Yl3m030H8dGQnvfcKMreNW6JuGfKpDXESZ
jjzIcmkR/kNY+2vYnikp3Wu4wpz4+g4Qsmj/7VoJHreQZhN3EaMQNhW/oL0wrojArPk4kHr4hKR1
FRD0nPAESIzyjilt+MKtOoZcQtGc9VVluKGpeEAHiNGNBXiuNeMB3RCTz0azbPDh6fWMYOU0kcwV
LWQlAJYfSo9THcBQC24L2OpSeHzMs/GdGCsgUTdPMTGWDU2KbKi+HhAsb9y6qbIaFhIS5tYAKY1M
dGgbMa5Nc42ncFym8svslpILOPiZeXaXkU4iJ4Tnlvm/PODV/d0si7F5VJHLBvUv9lEGOF0jYWdK
U6rk3BJyCrPJBVjWJdjIRHbUYwelwTNWDze7lwMd0Vy+rTdP+0xPNGS0zUM+pJJr2Ldn2mLC2dg0
ameA6SBujKK8s6o7zORYRSHGCr1R2E45t+2Vu2WYEiTnjDd0B6XyVqXUDPLpuU7Bzf30/M+Zr0af
Tvip5J7k6sqHst43Vm/9D2JcXukuTeb/rycm93YVeuOdtYv5+kImOkOg2Qsc3y/vCABrBA181nhJ
1tYS0ZlbrMv0Y1Vc5ryknJK/EcWf8JHZUCG75ix0cI3aUe7f96bYgR4UgjGACOqQ5PWUfH846pHb
PEJDK6e4+5ZzIq4K+trr3swoRylfSfiCCVGRrmehnPMLCZcqnk79obsbqFHM93OZV1C6HWyrQzQs
A/LIqsET0Aujgm4hmPv8MbtOrQhXrvNX6i1O/1st9RO3gcUrUrOBR+gW8dC8ea/v52LNpriPnkpP
VOT5T+OLlmSfbFensUUPJUn8SHvRTS1QoePkskwD3OI8DU2nOG4NDhm9IBfbBecmq0PrKePCcKzt
g4oGSJiEUEWtPWoaCGrxB0Ns+fYxCJMW6L4KUAQj+oA7r99amG+2LFFIbnFXwdJAfLxdqAZzDA8x
HemXzjeexg7JNVXF9RaXTHSLpvohg5IXA2nF92zR9pyAZhbw1s7XasX814H35T/PiKduoQeAjOmy
L2JHo1Q576vo5Ong2He6T9GpgFs9V8hyUGx0wYAKuV3X6VklFKFPGKlOPIKmWSL8SAhnP8BYNoK0
Kq8bKPi1mlrTARWXNxaAigkrPifV28kwhwKXDg25ASWo/bU9pMYSLpYYL3mLDmb6hDl6yMxuYxxO
kJVR94w43j7+wlRM1gOIFosHgE1UUnjKW22nkf4aSTTvQRGG3xsYsPqTGD8AkcBraegQXD8nrY1A
NDdYXc2nvrWkQiss4XYWN12koT6wLpok3ggc7LCcxSDFC1jt5Aa79DMqPTZ7xjTxh86GR3xzMMsa
LSjuK74w6q71pOdgx/mDZHG/fSTpEJTz9/vdH7WfnVSpf9ZNHWUrV9rstJz7zWqwDt1Rw9upNsr3
Y/Bjl9HoMm6WvkS1hCwZpSkHQr3GJOop4GZ2YHedHBvu4YvC57i0Osq5pwB4afjhbztRsvnnSuqr
EiQX3ygPL7krvbh8zeMdw0ncrvtPD1K+RtkVbDAy08ncw1cODE1yxvQpauV/9+gfpXkK5xn3l60e
pPnrzN5MgbwLYOfpOulKnL7F76SfkAe7URlqT6Kia3H09T5yXThBO715il7BoXFnwupdxF+JPTrf
rB/qzFZIkTICnnQDnJNzkcvCmjuh8cTpUDwekIFGagcrycfZLFegQYoyDiVXxaSDEdzS3tBW6WkB
Ix/Ei/LE/PU4Noq7Oj1g8ijPgPPksI5bbZBrmHaaATiqA/M3ge9glnrOSc6R9RMt5+ZbqAJQuwyY
6IgWond86AYvVjdBHua7g7YobLVBKWkV+HPzGBAX7LjpQvImmBW2zMd8CDpBQUzM7uyDI0Ddz+oo
qyPC8SfqsGKCShXaTcGw17sES1hr2bY4VgQSmBAWzSksBqboaGbmeug+O5B+QSlG4v/axrYF9JDm
7pKTHSIHYrpeO8YzBBABfvPMio/5/r6WqnXJPC1fMYIIE/6+1lm6hcFeDBpZWzbOqSuING88/RGA
CHBTIWuqm7jFXfSW0AR4eGy0qGy015C7QsMoGS/BDnfEGuo73PraR2Qeyypa1RrtsnK/0Qk5w/59
UZo4FDFeApBk/kelVserlV8iIkYbIY7D1IND8qLW+O5PUAtCDDuQcDlodJuhwj99GECupwKhFZkz
DjjX4YP9sfWuG2KlfGz5+iUpntjfnAQtkcvbxkYQTSuBawRSWy8Js86okRo0cJ0bgJQfnYFtxg9h
aSOG42jd65xhjtb8w94BsoMpKtskJJrXwvOoO+wBNdgJ0noxSWZ2oIEzzUC1QiXoCebajl5e14o5
JAUGrW15KWicQVcblmtHCsNFNF3A9Ixr3tOmZHjIxPMCQFszs6m4b8n7gvgIvpTnpKw9aBee47S9
dIqcuWgKLirS8Vb9mFdvcXaOAG2MZreeu79g4Iam9J5RBAzneEmu6+XhrjhNpt9Bj4+dazL3rX1A
G4klYki5z52l4mxpB+l+WnX7OtRdx83KND/RKYUUyPMDc2Okry5mAP8/chtVdcCmsmOyxUOttQVP
6QM7ljqp2z3fOrchktCpGNAeLiAE7LkgUM14fHaHRu5sRhii9Sfw+4ol0/Ke3ui76IhuO9devBBP
d/n9CxvlvOreo5p1rWi0YCo9ZY3GSoksV8GCgcknmYEu49MNI6rdjGuINkI3/oHJp8S8MGmHL8N3
i/Qr3aplIeKAZPrngCdpR4JE3NdCvnOvReQT1dqWmAbL0pLMGWMQSOWWBLPanh6tI4+haf4+fjBt
4ANhYX6NHMHqM6SIDl2ytDlF2P6P0/IJXxDXpOh7uF6CjLO2Qdp/s7jXNXHDIRUIOZsa3QYJbIul
9r3CYuxwC0fytGrp6ZGInKW6S7PKZh5QUvyz5q1POumlCmtq5dsdmwt8HPUrsF7zwrOirwVs8ocA
GQYz4KgTJToFKo79Diiojwriwf5cluW1Zh3/cAdg5AXHzoyjkNMfcPZaAVgH8RMBAJ0lp/+ieo+r
Sk5j4TGiQvAJe644LUv5vxjJFP3pzSACV8191SETZJpQJ6K5S+QZj+JrsDBkEnnPvWm3UghPpngD
m51gmaJmY+ZFtLG5YS88fj/XQckLSR2nn8mxN7v7jXV4KcoU2Pg8jartxTOFtUK5rtbnB9EXjqdo
/c3KdnsjuHT6oHNnHgrItR0pF2JihOEHSS6VGXJa6oiaewzLA3rDmsVb+pnvyzhsiGPV2pQXpjJT
SBw/NFygNs9QZcJBMO3DW1dx0/05hGwDir0UXKYdjRh8gIAj3VJ66PDn0fqcNizyC6tOSLbelEjC
RH97Aj4/kYhDcnKkhfKlmUrtUKnljYxDG4PrBSVacUgiHTLD/8TJchUfulPGjMKVWQIUijIhnLjJ
p/udeziluF8u0OXYdumG8G95687Sy1i6yTRhyO73nZrczhSJIXfT4UWkDlsKgLGjIFRQbaux1ktS
Md3BZS3AzPxjGgG/c5VklwvwMyEfRoQh8Jg6TpicmntJQw0S/jMy8ZLNcUeYO3ut9tL+gJ0/szOi
GiOp01rKy23V8C/3y+vivkx+vOKvAd+im/TC+2Y9gjZafByp7Vecvvp3dyieBxs53VYqXklS9r33
GeuUoGUofZmyKSSKKIUj8KkXyGsYI6rL3yVBaYenlCjEpDHrKSYQhsmaYR1VzLkQhsGllxmzGalU
V7mBDfxZRZGwz+dVA8pv6iuoMtsV9vGhjf0sRLCHU/B1zYDBae+IuK9ye9IsFUhN0TKGWl4hF7dJ
GcRKjH5PmY6o7eUms7mVMeGREX/GLUajCCS9GU7KBd5GH1PxEoxwruFO9WLojSRSNq7pV9rSsQoV
XOmDy9YZrxDElgSxWLTVVczEEnSRm3/tVnVlPcrK89xxaah5h4Es5zd9z+QKl58qpMimZncLEi55
5coxM6/EyKjKgdK0ycJAxY0MYAtRFTwO90BFD1iZIqL62X7QFpRjS2csIq4EoJTLuruXDhvsH/f1
Gk3ZZF8MZAz4TcblOWYfxuomOEcrn0l/mqHv9W2RApgFZNFGE6TiyfgXg1t35L6Vbku2YnvhuJ/1
07jxdVdi+yhQhSVYdytGi1qJvS5RmCfgNW/qN/fdPlenciy1UteGgARLaW5H7uk7iaNJQULfZhpS
LrExwltZpbAKfTCBZmlh0H3YwWCX5JYCwonKngQmeDmSJRlO24an0hagjF3jjSE0i6GUu00ZssTe
9nyGNzjA6BauNm5QZB6xOhE+IlsUdHilv9VxtQVAPzHShgAQQYO/vhaReBZLM/PfEqwcRy4RIq1M
S3kB5JE3vlisjCKUyZJOeLij3FTPJ67gxGnUopOxxG9eURTdG2eu2vq74q2q4G0VJOQZqWabGxmM
wmNJsUA0lt4A1/6Bv4LP746xhAXGMKnb0j3BaGfGmFaQKz8aCSnTIfNTwxq7GMAm5btegitycLe7
hMhpe4BJGMDFn35AFi13gsoMihptY8tuYkvdL/VfbRVmP7HY+cKeoYjL8e7y7BUowW1LHxTYDvHH
71igZKrO7qvU4VTn8a7sHB1/JFhITXv+Rth8tokE9I2L1sqxRmUh1H/HaDR4zrKhLH213cuHBvzm
ejvZoD2Ixoh7pczYuFmp3dpRV9hpzobVRxlCSnKeYrw+DXoTUKHWizne/uHIKs0BlDbBFf+jgP10
e6MzZZrG3moR68rM2g4VoHY6rX4Oqled+eJ80Hcme8WYvzPWdDGRsrvua+cRcxOzXeFI928dOrg2
qr0oAPO92Lq9qKJ+tWxe0QoZXsxUz9P6N0TA+0pYwrcHfRve/KPE4w+RbJYhtEhu+EAD7KmUEgsf
Y4E84XQpeF6DRUrpxI7NL35R0yTBIJTK5yKNw3KhW6V+QPoukcSEIL4S3I+howAlTQzSSnC4tj7d
Etm3v4DV75GKIZtua3uhrWTjYwGu8PkBBIB1Hx0KN2Sj6jlTLNOCbyi395GSkqfREYs0NL9HO8mq
iqd1DpYLDJUywm3tcloDTd8tmeaXlv9/cNZzONFqrLtQCZSAGJT5Kgp2ILUL12dZw1xWr1cNcacj
1biV7xF3A7WHf4t2/AA9Yb/1VZj8vKf0bOLmeeqLy08XPJNmeDbX94Dti5zYYHMPm/0E9sm72HFu
akRXdPBt9qj0pTcWTm2TPguql0c4mRyp9ETvvXMDIOCQ3LFBM0lmBMNuGj+CIsl7sRUIxUGaWXHr
Q9SyI435veCO/wP/5N+2HfYWaikaQiLy+zD/U9NGqC09Ba7EiexpXDFKbbNx4XXYEOGSbuP41xbS
U2xu4bDLuH9sqrIC2zmoExlymu/T82zqbR8ZeBBwRxn63xqG4OBNBXBeG3ga7mQcWDIZ3vdtYETk
TLDvnPIGNP7B0RXblhjrvq4UGbaqEj0G0dbayjVoA/cdDvkJCAtgbsoi13I+vLpFsPaMc8FZQeFJ
IZ9YcpbTUit4y2fglc5sPkV6maYDXosaj4/jrc4BLzj8GebSgKwnjsAcig7YxPNceyJLwXdGAvJZ
cFnd6XSv0BcCSoahmwU2jOUqFzeb6W3H2vVF//HOxOI+SkxJjCJESEW7BTS2sDqEjavBL7wS61FZ
YRTBymygKQH+0WSDsOwyK91YU+yLl4ghnwMkjHv9Rx9vk4Pl/zOEsGiWQrkqmrFvAmrIoao+/BZ5
aq5oyDVIqIfV+uCrkwksjxGmjrfgoWimiorAzuPk26M1/bynmt5xKSZzutsbkR/gDxCoONGN+DYV
7oLX2JJrFjNue1x9hY3PcDITfz7nTAZxD2YFGeB4La4tE7NcMQobE1CFQQ0kVXIORgDrL7LiCqS9
JC1Dq0Yuil/anQBuxvnNDuMj1Cbd7hG5i1Rf65C68+w85GxB1AYjKjeh0CfIVsJwMPc15UnZ2uM/
7yNF8OBKAHM/yW9lYGebD2w2Vcm7+ugYEaUVxck40HY7Z02TRS0XFCS6mzuqfQEJSyFQjdfBJdaE
BGPaMWHwJwK+/bkQPKChXbrs/ToY9dkXRlzdZKRjF+uJC+u9dtPdxeO6ZUb12lzKTEVkhtSObPAt
aDWX6GQ9f9kfskyPBenhDm8ORZ9pqZaGSoGihpL1I36knjQ/15xGPYq+wnHndwyeBv9Z7SRxXyu7
z+j0/TawutNUIlLcMPodJjde2pNZJHbHmZnRcT1WVq+nx0bTjTA015cXu+TiBvo8lIII9z/rJ0Ju
37lCFNpIl6rUVaMPR0/FzwuS44L5in76CjjWH1RJQCCHQV45XcMaZyC9U+KAE2Z3coDo+kbxvY4M
BTOMQIs2oZ2SQONbpTfDUJIK5Zma6+OIPH9vyaas9S5yycx325c2NqaRUr7oPWl+VMCo8qcwPVSG
pshnKJKWQafIsqgyKNBhFTdSvxQQIeudZkFyx29Siw3n1liQ7LBiydN300cNJhcpIFLGZ00DF/I3
AF54c+roz1mm/nmYpSMUsPU3oFZ7OVzQaoWDK0fPu1tYNPQ90nYGkfVqBi3Reu0GwD9IHQaC6fx/
qL5dobR+Rr+atW4pCtDxWcgDxVZSYy7kU/XbRcJ0lBzIarE2f5VSGw1ARSIonJtPkizWBpjXZuJB
SnIW+2XAcuxr64ywdBD3JpIaQR6kYPTlu8vz7fUgTGlGP8b6aacwrXSLeI9kpBgvgllK24jWvWvz
o9z5MuivV8I8ADnZfFSFYfNc17si95tYUx/+w3GfBoc8HNfiFWWM9EYqIlZZFtcsB8M8K4pq8t4x
mbR/FVhdBYd/+Cqota9yVH0oPndjDyXDtkveAnLgqB0aepl/zM/66UYrSc+aDzqhHCF3y2UpYiKK
r6WtYYaSP3uTlXJhMAIHxpO/89znAWfqQ78Lg7fH6eRLVw8D7cyP2pTcGhtxj1l14tUfVAs0HlAr
iJ+grU5u0pdPQ8BwzSbjfAH/KRUbyRnfdapxnS3UuNpp97piCeD5FdyMijTb4eS7CVXc0hhW15vL
Y91XAL/HDUpdxP8I7xSXL+Mh6BrYn36JFrR1iuC13olp5sYvCjTOcIvx60OW9B5yue6Qq4k83BtU
Q2xYjB7x+ScF9nc3ks+W7ymGIpHlFth4bqKrzMIiJwpU9qPiPjo5jgkdsOMc6cK5O4NuAseaI6n8
v5wwXKoET5qvBMPWhudXMPR0tc93EOY3/GYNqfpwU5yIxFxD8ntdi5+3tqbbIMHgu6QmfT6ELv/P
8hIWV9BxhJ1bQzNQ3nIXOT2RKKJavYqHGmd5cEAP7wJzkp/3zuW95v1zBugDPrQP2bG2fFtR6L4q
05QM2lPC/EEIumZqbR6Hjy3B6W7XgR+VlYhrm6cXTkvAc+4DA8TT7+FL9TWjXRE2dN6RAxXcuvnY
OrVG2fZJ3p2IljK0rSr3/Kp7xEQmjdkrIYKdCQfb9BIgM+QRWpe9oYQJXxQvkdUzyU4TBxVCsQRM
kouhK9Icb0BJuwz3Ne3MLMYsDbo6CbQmffW77AfoybXkrDBA9yGPU3Ue9v46VuljmybvVdAjZ86Q
INMadOw4K7RJOCGBvC+1HYVhGUvtXaSdu9DzcZA8ys3Wf38Z5u/eNn273x6T28Tn7nA7f4T61S1f
Ny/pz+RbkPsLqJAVVcmvOMgW2aFd5Dr21oUz8h3hl8j4kPnWjsctDxUQvN6d4Ed2HmhvVbnXQZ4G
g+8KLlQKRqEWSPYCjftQpNZIqLmCTA/IwlpUgl547eUHFPRG/qSkQEXiPI3EKVpnpqvZ/VJAgKbN
EluK0xN5hxet1Km7F/V7pLIlsE29SJ0WfxIqEgmvKcNI67j9Uv7p0NJVr4F196JjNjNEC0I9Zdjz
elGwdPz1JbJNgPqQJLPczOMyZN/aEeDbMiX65+Vnje3NZ/3bqk9XF9C/ak89S+7epWrRDOBLw+4S
sld2iDLuM5i1Ira92j4teobwG2JvKWe2pVvV19KnJAjQZC3Eaxyuv2NfCD4OG0TocbaHgDTRNNZl
ihT6+XFVGxQl3dxexUxsn4lELYkSsBFqHrc+cdULajC2YuktZqu6Rhbib+fEWgSCnoQzlNPrx4GK
cwe0deREgw6sfZeYOmOKubqCVwQK2ofI5p9ZIC5gXjtKU3biSwG366nl3KTH6OcUT7ohMi1fo7k6
6f8IiuGikuWA5SvTV6DM25HWnIcRShKK+PnOaLE0gGcgOnoCVyPjbjshU0bwCOJxsobb7vfvDIU7
KC6bFdokekYNK4ikITFGcW4fMYic/4wB3tQgApSl8rAF7MOFzYHDDSkSloGFn+x8VRDEPrbNxNLq
3lgMvB652AYFiMNPIGmbdfKkBUC6Gr9zgHs5XP99Yv6xBQsWGynYfSkC6laDcZOXhqQ2FFijTgqI
dZ3toQsKimWd7EtnCA4zxT4v0oHKYhhR7yrsmZJqyQp6wSkvqo4fmO8HmLvkkm+ygl7caEF/qIzy
fdG5Ps8iQsgda1CrijFA50RDKfWMed+YlKHK3/EPw8WtnqGAksNHvzfIMta2hKxaGcy8knvH/KT5
ChrP47HXUZ7KYViZrfWxJcQvfTnEUxE7HJx9TdTbwbsFTD3ZnrnPldqHsphxqQ6MqTDW77pRJNIG
JLMQ6znA2r9KGuOnTVrQrVGASKC5GaQ4eOqyER8AmgmFVs8u5rZ+S1Vu4ofrQG21fryFpLg3Qalx
VCQHAWJ1LxkUj5gfbe8mmRl8Tv4P7hwtDA817G+v+dVi/18rB4TqdicuEjc+V6PT3mgKMFZyOvOV
pxwwzRsuT1DqjWS2v8zGNdy6LAQsdbm+En+Ure5gal4HA9X+cZvqFvId0jp+/hi7QX39NQOPxt0I
CEfYrBb0Yt5ZBc/KFpWe39XZF5CD4GukHTpg1TLIHimkgnH7HPp/ozlcHB15UVXMQ8g7W6PHn7qB
YxAJv2fIMppZhP5SsvedXx0rZHf3wQvfCs7EKdCJgfgee2e3QdqBZmXrMysnGj4hkpQox1tYZhJt
ChimZ0916mXan99SDhSdi+sNldzPBA8HfplkrhioJpUJ4RL/2XRYQ5tQ3t4f6/SAsyrRzKB61KFQ
OyJG2syjEKubTw65vOq+4xPVMgzadBc0Xdm7/mO7yki80LejcsfKmq37m5IDi2rFPDlQ8ybK4m+W
UOiWbWsXhU1uar9bnEe3a185pILhaFUy/mBDUzyRBro9n0noMzgtkeueDZcqNZEBTJGRJOBuLyBi
+omzzy2Z59y4av1WN6MLg2M3sn1ZpSV/kyR2ZL2H3vQgeCxiWUpasm1u2aOx/IlLvCagSMj3XbDk
V4DTre67bFStVSrBK0kPIUy29BFkuuEG7vQSOCuXvEWNvnAnejtw/X33Ctzjw9ai7GmsuphnbKCo
qN0T7CyuXEZvkA8B9YvOBCn9SEr3q80ae2Te+BaOBaI8WeuECx0HMqRymIqqZ6pmEDAz+cmEfLec
nbIdEvzcCHqpUeh0WGFw02bE1HFleP7KMr2q7HoW+X/KasTkAjtfN1Qi+QaWiOl9wJybPRgmce+f
08jaZ6IETJBdw57AnK2j1B4gxY3ODNlWFGq3gkTX2oC67//77eoq4dIHdHJMzeFBwvwecVMk7Hsc
l9oEr9ZUSilUgtTWb83KE9R1e34Gg0/XSd40Bun6EnOQbSh1wgF1BJ19uhdnF7eFpMJtVCd6mu7t
uKOO6AkxrbAn1T1+o6urAXwJH9+u/av7Y2VzEvhW+/M3lUV798jX7qKLCCXsLHutBEnEdVkYCTsJ
3XWQS+fKsk3ooel4exycoa8s53oH6wU/DzXbWsAzEF++c5C82bfLOYMtquq2Kx4ObSm8VaGzDFV8
ub7vWfcrhQ8YJqtuycB16JYd/8Y5Q3UecZKYj58zsydwz0vDKcKb9ZierWTR5LDpVu0YBDtIMkjl
GGiK05MC+Y1fLrl59X7gEeBSg4S9L4Ko3z2Ks7b62mENFjpVunXeDMnKcSkPjjzNLDYlDmnmF525
481yeQZq1VDX1A59lfq5qiqGVv1GS+ooXicIpSJGkFSfGr3uOIjBtHe4YbJW7DpLKPZr/pGdF+AB
oUDDOYmBh2VpNxvFaz5GIpbBMjS/h6yFuTGMGAUz1vIuROofp35UM8Rcg2CV3zu8y6iZPur1KTX+
0m3RdHmkun/o7HQ5pQiAJ2luASdQ0ARgiBqGUl5ul1Hh4AmJlI6s02gtm8Azp+siVDTuZOHUlBu0
BOAY+JAGZSazIkqlIRXzspwy8oiTXxDHjEE41DID8FsWizkEKYOPIvmyGTAKkK0nMSaQHVjEXF+R
qqPJf7r8QzxJJJEZLEcogodoTWTkW7sVE07pLEDBe9GCrLIbYNWog6LvRXMzc9h5uIfX/7Jqnzhx
Pwwg6Vi7LimGBkAKc0FL6YnJEzWo4dYyqOmk4t2xx3OHn2F0SLdSBt+VHjUFitsfmkB/HvL6sZHI
shd40LVjTiDSP/cu8Rhq/MuL7hCoPTseSu/317ZpE3XHJzYd9UnYUZodPLedz0Mh4YdN5AmB9NOh
TJpUeQz1mHq1NmWbXmbC24MBm6jGAV+GmytWXL5pFrshj7jPfs/0k2AuhaItwQMStkraIiSdEVBF
Zdzb74OuLyFh9pUzFNRmw6+jncvM3JaD+qcDPoD/DYTdCBU3IqPmJgaJizQPFhoK6hN4tPQdQ6PN
hdUQ5bAYE/2q46UWDPlKFm1CzpTk8LiVWZwUEbwS/C9lfx7qtxTHklRosq4H38EnZjwrZqKiCeNV
+om0eofmDWvFHwp/kqsFOp2TtnFrq5nfZTcXPmeZyP+fZDXPoYvriP3q4S/+IjY2G75cpYQ/aAQb
bK280FKzseUshmuIiH6PbhywubUl4RMVYj5BqwTRP+Sg4M5u46S75lR9TtHQr3aXCw0inXhVD6Rg
9df5aR3IOPNhmqorwOp//pWpTMVnDFrft8M9q0cHLg/YI9/xoIxBrWsKFun+pSm7UozcyxwAojnb
W7WLwYzToIp2L/wr0BgUfFoMpobdND6IT2XctHF41jf5kxmVYP9jZ6wTHDVQqx6GZIaMOz99KQ1D
hjVb7djCOw3GhRYAaVa25tywb09Wabhi9JgCgYTN/M5c/8Pvp3tZcQdRBk1Ju50pjeXhae8lqZ4E
DDAmjCW/U85BnMIw/nCu7K2m6Ca5tEYSQjX0FtBWkQ7fhNKmQSHrKDY1WtBi02wKiQKlqSrzEVCp
H7sJU0YGkETnPPBZ8XEqi8Stpkdr15625BwVEs9Y1qLU5i6zYeyWo/nRMTd9q/+Bqpihs8ZQ7VDi
NX++5sJHFlnhst//ukSXcf+NLIyyDlHxuSWcRYWDC+vth0FJDER9EpkrNUtCODSN4G5brSt3QW1H
3lY6gmWLgLa6dLPfUNmKzhU1gpt144OfZ7pow8dPtyIXX1hLpW8DlyLaGp+xpmSDABx7mPCqzHzs
iQlSwlaoxk2TmhLu4+kmJUqxioJKzjC9iuKim47WVoO98lRLairh5/t+hFKwB7r+lQJWMinCJgSp
ht5+g5vatsOSIx+SLsUSlcjCfMigrOJ2mue2aFy1R5cXdNOT1tzfvhzzcAHaHJ62IDzgBh447lBE
prChYGjfVAGxCNXRczSVMuhyqSt8Je7Hn+2ErHb53/YDZnUecmtxBgfwnA1fJrRj+ovGXtznsXXK
lE2TNM+VYVWLo32FtDdT5LFam0EdR7VTpL7Kk5tMuf2BJG3l+zi6cRBn3aSU8mnbMmDHLPVUp/dD
Io6BBW3cZVxPbYFQH8hRbB55fMKNIc0xnrNyvHqrPDWV/WmB5gd13MV+ClfvourGSnVDY6ZnejHX
OZMh8XdFF+o+UsWIYJxTeDjSCQVmykO2AMzb590Gt9U4GRgbXJmewTONRPUNzzNkMizguUXUxPLl
rpsHddyawqkElhkN9lPaC4zwkTm2XwVGiACktGhLvd6dJ+9l8RQRc+aKZkYTO9Le4PBYeimrY/e9
si0o8faRHCoYKXkV/9C+xIR9SNf0fs2bFDQtMItWXA4WhfHnrWJdyyjhJCcYmh6LBXFJ8R8nsteA
fMJK/JCSTmaKiu15lSsTFlsttLuoEKsuy0L8iRXjVgQELGaB/RY2pXCbV1gBQ7YQXBeHBpycd9iT
ftMjPjdwK+/YA6Td86k7NIdvB9ztWDuOwEV9Pj7/qVCt5Npzg6YX8vd1XGBZkpfQT3UT0sWUpa4J
/Qj7R+VK1WE94p1/rJTvNj8PRJrA8DZwxPhMU0oMmUCP3twMH4eSQatv+Sp7ByupmcZPQ+HIWDQu
nQSRBJcObMSMjr7h07Vsg56bh1O9RjJIzVcnMu0SFjTEAVB7XHB9TuuGpAHSu+DjUhHnbaOwdixE
OYmBu9I8VElXUiE1XrpU8l9tJq+I5xMawQTk85LFUnwHe7/IXfbJOpFc2OhvM3HC+RaFwDm37qin
Sttu6wF0j9MzdD54lRSm6CKliW26DWObqQxP8J6Gv3nv4LdnZEQqDKWICynQRzjHD87EvN77gf0/
krSPNQZIacci+H98k26Z0+BLNbUXDnSC6xJ7HnTpDWfNGaCu58R3WJb5i59FA2UhGF1r7TteZqF9
EoJmcUsYCtmqZgpq95dZXfeKdm1WSDCEfNYQ3VK8U1zH0pzrxOH1kEqr++SooSld4Tes20Agdod5
cNY6t/1wsuUANHE6KG6lpWEPEH1wX/CSflhfp5Vf7yMRG/7MGIngP9zbG8TOL6tQBEgYUdij2BWd
mqmv/YK84eB4LV0opxjzbbNydQ0l8FlJOeuQu2cABmHrc5YiFnEXIqLtGwo1mEvFNjcyButfIEIl
eq3KNAKGRZEkqiqIXJFCmGFF9eULWCVefyH+n+O0DWa2mtq9RISAQ4U6lJEEgG1YcIYZx1woPqMS
upVuWX38VhoZDbVHDuz8qpj5XHoZ1QG61M7kOxF206s2vRfIWiDhiJJmSJzTqVq6AL4M/qL6TAlw
K8FiDs+SLStB0H/9+zHLUjH0pkVpKkhddTOTgyTMbIt0qzkGQyhvSdTwch5CFE8KPuw+FN4onSmq
OpHoGsx5o5B2cxLBA0ANoxM2V31c2CXe/hUDEr2Ka+6E3PCglzwYJr31Ia+bU6qiGLWFOSa/r6JP
Uvwn4DhMb5097EuOi8+XUAFIqeTJMzzTsjH41WV6rBM+SDa2f4xvi8I2rxiLa5qQ1R6/R2Lnn4vD
I4nSxKmr7MLDlTUx80h+t6QW579BjKpgqVN6MMqH4Att44qm4XJJg9fRhLb9pZaAHhbYZZmqYwqo
oppESTawQfEvO2UDGsJ8JHhCgTUKm9xU3Ie3+B0IXE1QkHrcQuc8lfHDvvLSoAibLEFHh0zoitJV
MLW1cbQPs3b9l5UqXVNBTcig8Mgt+o315aPM4ZAsOal8+K94itwUeBGpQQ0XxnDQL9Ajl00vgjqP
3nLgegOCnXavt3gmnEjloLKuXiXEHgZGNas+S/wC/OlhPXNqyqmhetz4in43TfNUAItfiHrx6S0o
Dcf7q4LtdTrgBWseq/mfBHHs+RpWwQprCHqisedHwASdPzhssrU7mh2xP2e8D4Pi9jCftbL6OF35
iJbnk4kTja0wkwzOYUQebmPqyO4XZi4I9J3Ml74/4AiKK+9z+vdB1t7/ulRFKrTcZy25u/r2LMce
RsAhe6eeglmuMnSMt7O2UjgLRXwd/CQ5kKYVya1sG3eINdqRYsoEbQ9R2myzvupTT5J1ncT0Grzo
EF5RjzL4X3J2A5u58lqd6xrY7sRo3sCO6vSweStTt1rkc9UWDimuz3dCsnamFiCrtO4ToY7A1Q7J
oklqOYh/YYAveELW6U+crWS+H7fh9wiljneBBFNXi5aDsqAVVj4eCGw51mHzAxCVEi/M7/QyTb3x
snfxcVpf15ELakDsWXiTX6xe+eYwpi30yZxAYbF2FLl87cArdUEqbGVyHDTOKs+jGDhweMTT1NGd
9inK83yLuem7itWwhlTzSm6Jpl7d8gF0wHt1yNYF/diPAijHw8O0dVi1yIVqhC3ggB92XNHDdYKZ
s4Zxs9UdS7yen/GqBBdjtiNdnV2HuXzkJu3ZGGmrJTI5snpJ8nQZH7DvZIOcERIwFisOlNbkG0GY
O+cIP5P3VAPNWnAUfk8KrDHp1VSDxVQzr7yo86RODrfe7KIF7jjH8uCwkgdYoyDjqLoKsOgyFYeq
VGnX1K5ADANRQPJWNb3XmpD5UttVublQFo4hck5eZAhwR6hjgB7N7IUvhIXaZoIO3jBOXaOSQw6+
gUVr4+YJmdTYRKgg9ikj9qsSCVHG7f2QTY0zJDvupilYeXmF+xeQPnMq5GjakJt9v99swC2JCH5u
Byq9nSztYYszEweVUuDH/LfQOAeVfes731sYInsuJcZWC2zPJIF2G422+WhG9WpJ/+ce5m03sZT8
lqJ/NiHV1DPM7R+qhOpHu7uSFEh+s/9t2as0BS2hc9NdXvzbNiKcVacFF4oC8l1eipyowzH46vdY
wMSC3WqxAIOSP4sPATEn6yFdo6HCkVxQV5DyKuL+eH72NiBDcOb4J44F7LPP89AJd3we3Xs2RR1P
x+dPVZuHQY52VQ/uyU/524MPHdHmuDTGcKjcGHv6Ld78rKPlgjJj43NHYKAF3nltFG8tsXRQedm2
dJ8idH5kyccG/FFhH1iQOnQ2EiVGGNgcJYt1he6KKrI7C3RdQHl9TqNa9lgy42lDYnvyl/x25Rms
XPqBbJ/D0QpCjvd4nCeja96KJ86Vbrm6eg33+cRYW+9whJOVvCTPw7gOMa8MV0vmqey70ahYfa81
4EG+8LJDwlDuocl03TXO1AeuoRqKtvH5wrXddVzfJhBlf7qJvrkw8iOdTje4u3fkVbbQiru1qg/g
mEmiLVG9AncSTUuPfqy5T4ZoDS2eMktb8LMvODYm3yT+fTzraE17yCwwtoyuwWBQPaE4lx9Ek7FF
4B2z9HQT5I9Xrq2fmZjdbHQbad5k9GK8gjT3qplSYUdwiBnB6IMO1KdK8+NAAvkkg4sLoMQuiFnA
nSPFFPrTJ0ohnB3qocdj26n6qxncmvOME6jxuU0bLJy+oS/r2xA4Uqat7YDnp0LDWOmt9OGHROGP
y4BaR2xLoFWynWo4CgoG+FlxhiWkpBlO6A2M/PaIU0Id90w1eV314YYvYWPMLFSIi2EUsT2jV1Co
EzdgK1Rgt1lDeoPXg+1v37pO6wvvQgjHlSFp1I45TTXawNOcbDC0yS7Q+AxrvetWRpg+IJNWajCI
h7eROJaTDEnvarRPXf48jwI9c3DDBAAcxlyD3m/e6dItaWv3Nvb2J0CzvY4Kce0o+W+50VsktfWy
1H178Iasa9Iaq7V3akw0+bG3Wv21uCd4HtFxk7kX7PZy2iVMA3vHrr8sq8eK15PJfttG6joYzGSc
BfXA19toFrXkXus16JkETw4kaYo9InaKldXHLvUd8qnrYZI7WRpf5ekONVmJH7lqYDwVl9ORq34M
Y4FzEj37eMrACc1oJwH5xpFJgQgtOc/fXG216N/bB/MTjxOg9K+CL9YNyM8qSVrFQCb1io9mJc4S
fl3v4mMs0nhALtwLT64XQMbDQfrWj1Tnbg5O8ivDLKp2LrH12Jc0BnmgH24MoULjwfuuM6LNcV4B
K+SOV+sv+G4isgJjVywzAAbmeuSqb3L0CutKUhvXJEyotm4U4lDlQNQfIJ2ZPcyNDSkloUNHrz8+
TcLMy01nUl7g4UbjO4hn6WbHWUNRt/xxeq5DqKOiT5X8v4t/CBCdyWDP2EXoGX96Th6620YTP939
dWjhY43obM2xxKthflGzaNbhKhb7ssqzpJmO0R6mTGlMInPkucHy3BC17MrK8r+OqMJT9yhNbIZZ
Q77O+fxBOxsl+T4S7f80clhNPL81GYDObR0NIuyEC1Sat3VkFgF9zysIUB0J6F+FRv3lAnfUVgHs
3gALQtfazr0dzkH1i533ZSOqfHbiwkE755EnMzViVIK/lN20Fgt/fUsmAZ2YjV11/9WRrwmpeVa2
hI+wZRDCesMWJNXpawWOEmKOvreULhmMWGo8WCJasN/4utFc74R8KLIPYwXyEBGsX8SnZKWdOPKq
aIhlwt8eAM2Tor9fQtkMsj5gyKkoVZ7X4pi1AFEsVTkCyQ3wAO8hPHpK9eUv7Zl2skQGkKL69xlL
M8hvxMl6R/8vTxJwFKLTeIMUYY9DeVfK98nGe0m924pPW28nNI9EhGKly0hM8gKdMAFJL1+bL77c
6RAefcqPqyQ+BSUW3VMcxXjiyCq4NZO7dudGXTzFLsKjZ3LT0zk0UXB4OYhLOGtv290npuOZtvEe
jEHuHLnF0TSJ8T/IrN0dj2D5IpxorpqLXs8vXnDaLZyNjOo90BicJMbZR5NJr97DzTQdMa1SUuqc
Kle6Tv4u45XAaGVw+ye/+qPcVfgQ7bCv83rZI3+JKaWQyYvJbrDGU34xaXFsXVkJtsrIdsNuqDao
zcWBhyxjcRsM4fwRJES7ee8T/iIyk96jw1weTaKeV/BcdrPtbvTdj2QzOrMb8DmdPgdmZD8zRzHE
t1BC55Rowt7hETIb517dnHv8mKQ+XXCqYepMJ4B4BBIvfhC6GT+8McQsA29A9r3Jyy0NeSxKasn5
bKhFFh3n02JhyfZ3ShQ4FKDNp7bVngpxeqxSKhRR+Z2JbaoPmwVi06zuRJnQyIvePbZuXEBohQ0l
bMXhMx7NNA2c2RMo79NEDo8Zh57Uqp3HB40fLIY2UZbAouLZIqGts9jHd6kpckw4Qn9q4weT8A5U
vAL5soa8tW2sZmZeOVaLqLf5lMMiUryMrbVGp7ekhEPmJ1oeW/Ak8jV5a/dcMwQqIsUAL6B/3scD
pMrjDRJrIMqKMpbb9vfsytYnBsuxcoot739ZIPvagrn5SeMYMEnBI0pUsZQpvSYSR22Fr6vIGQgN
o7oLzEK27wc2p0JYIhOLaho7kXcBdWhkGZc46Lm5dW/7+g6HgszndwKmlZZcAakUY1plNolNdK0a
zrpKJXODbk41m1mPMe4Bd+W+iZ5S1SUleXllEbrIB9/R2HvGf7Z+MM4WaytZUnNJCK3gs6JW8lTz
Lbo3PqkYkgdAVuZsdQvs1u5zLcG9mvQUXDuJ9DOD8sSfChH+CS392XGXnCseJNOeY1tBgvJTF7np
n8P/M24X66+0QTOmNDrjEYgpZmI1Gc5WBM56YrtZNqVdlYaKP7l00AAP2X1WtzbsUtIaJnusEnB+
Ouvd7a1UFBMMop3zKKg9QoNI9MJv1ATzzFcYnz/F/Mol/okMtCvu+WKjCTSDscXeB9P4u3o+Qru2
JkTxKe/jlxh+yK35h6JcxlGjwYZMpFX5PoVwqUyi/M8qA7aQCG+j1t1G/dWFafLat37mfYmBlyp9
afuTKtxsk90RYyckQXM2yBfikgxpD4neN3PL3Zu2m5Rw+xw/oN9XVjn6Eh7PdrJXrY5WyG2AAttb
FPezw+DD4kqR+37xLcBtem4/M+8kHggweLOQrQ7VCsAtXbBuiDHrWxQdI+6KlDCFx68c7CLUQp73
5OIbRpUfZgwFpJrKkZD3VZlfSMOn0j7k7ShOQJ8gbWVzLto+O/j/IdnheVAomFXaz6KiXAglTZZb
5ehlh/Y1CjqrxFO+ckNEVBQCaD2jq78QDC7juhF0+b6gSF9Qe/j+QmmY78HV4n5nP3qaKIDGz4Pt
5F+eUmEqLSzYBSqb0/Bv/N7BTyMvWWUoMshUTxxK/JCdp7TMet2v9RXDKxP1sNMvdlYOYwHKz/gm
7xyga6u55bj8+UuJqhD8gCwNFkZa6+Kx6o1maz4/5McoVp9E8GTJF0UrSokL+8LKgzCqtgY50ZNT
F7ZsUMosHpxJ02Q1oRpLeRJuLOH79j3XhEtlkXd6u/41Q61Iq8fW4Z9/auDwqqRUOecqGRrQamWl
trDTX5+RkUfweND3hwFdnVL6VbpjhBlSqjTKI3mO3TfXPCXw4qOX26c/EN73rgXyuSaNAyyJLa2F
vafAtkqI1eXqM+2C+K2sbNX9G7RLtX/suEOYwJreue70CAIJJHbJcvhFsxdJMZob3maAIel8pW98
T4olqIXHXDeNbE/qTniUayMm2p38dFoqALebZk4Xv8XbemCnewh+k6bEYDhT/8ypC/oj5bSwPgxX
ArHrN1BU1X+7q0u7T0/dHi7NWAroASYKVGb0ZlFAbTjiDLDqosjqBA0SQNCSLfMqwW8Mt264YeWK
es3hoIxWX2o8SpfMgGc7NeRlTf9GmVaef2HfVcf8HqwjW5hHDcDxKQc7TurayBWbwBX0PX9kKcjK
Zz+dZU66Ks/x6Aaqh6pR0i7u0eMGx3uMRwSEy2robhdSwwskEWIjKxRB+iyM8/CDufgn/HZzlLzo
ubCiKXHJJLeA8oKGu6d6lTSETzm3V2euHFUfVrmzRg4t0awEVSHjUhTTaF1oAFQkksGoO5aFIH+V
nhw/rOSzv8cz5SnIi4njQjQQM4JvxRB55ugTTtZvuVGuiyFuQ+FJVSpaUlNG+sqs9VU6rs/qEdO2
t275gaYrKo0KVprrN6LqSiFfKowKUzb4X7snerBRSm/6UHOaD8uZysbV41p5w1Ii7jMuJzEz9c8f
84nKIElDekiBh6u1UdGRf9nSXWZHHBydi88o7PFCVeSskxSFBpPWo6W6zWhQS0m+KYLABN6V6GNc
Y3RKZRPf9MK4eiDSN/3Pf1q19RgSgt8cHBe64DwvT7iOulwmE/JM+r7ddpm9Dzn8joUkykI7u5vf
pWnRvW6+9miDlnpbTDtqo6iudnvcLohDyfudHIz3zCCymXDRQspSKnt3AYadoZ171IdvMejpy7xT
EIDgKKC9sDsWnKqFjelqVfvA+ZBTxQDAuItm0g2ntKB2YdXyBFmiixu/KFxj0TfKIF7LfH2GGarY
hIbCx6smAm04YOoXXDXgJo0vAhZgwNWSew1xMyolcbZg97yEd2KHmJ0DVcPldNIPgP5RPpCtZaHk
M/1qO8Hala16zcR6KQDL6nscgdiiHSBGcB1smoMnc63+LDLR16RRYLWt6Fyzm8gP+1sMTIyl3u91
WaoN2ZdfVT4obU1yfIbYt3enqbUob/KRiydWWTubGlK+Hsh68ajGLTAEnlE5wxsd3yeMD0jJXwUC
FtMM3uVCwu/m1zW9qZ3vIdFJGkC6DNpiCwZT2XKoBB8LAYSw47dqqIYkhh5MahrgLbDjxxeGeRgC
+Ma1qBoWF2qMc4SoUPGziFwcqDXLtRLd4VtrU970ya8bPwMKo5UiAHXmE01eZi6Ik0zniVLMU/uw
SjGg1BRE/kXwwTdKVeB5o9JOK0/IqSX+QyCn4hzuDjwdyAXA8utWQBQnn8jtKgRmuc7emWqXrPXI
N9A/ug6tObPnb8cVZCdb4CvBMCFQEOdDlYb8Szj8gpGyAnYQ7bkF5UzaZ0d1/3VNp5kSsSaCEW8v
PGngHQcJASXVXL0dmtAp8j9UOTwzyZciRaEDJ7bMwsoSwjNtUpFf7gMmMH+Xpp4sN2uorPnTW8k5
0lSH3AJidCK+mz8IQ9kAx9WevWSPaAynL1rlj4Xq8LfOvsPaKnNK3wflUDnH8GiwCzgvbh9jnezF
VjyE23FPz+VFn/I5V+Ahb8jsXSVtlXbnmurNeDGVuRcN0D9yzLmR1Dz+rBfmlHsYAEb6RroFsZIU
0ByHqRBgyvkf+1yIOs5+a/LvcbpeX8A4jGUQm3tnMiej4UpB0FSQtn0PuFGOlKd2DGRYJ+fEWiPq
uZmX2dKJXPZSqZRk8DEn6CuRY5F8TLFdh0Pk8Ikz/qT6vCrWJxC5niHtHu/oafLRPLPlaDlT3b2i
BbMDM67wsVTNmOz6FyftCMgacHfVBAUKmkiOSFdiZzErBnYU/pwkJj7RuJpMN5RyQzRmjHK/bP15
8K/6d/DDzfSCnFe4eAoCNS7iPWUbtoaGwPk37W5ZrP7bNQFqVkUMFpUhych1snFbaEK9VFs7CPGx
Pv3d3nAxlKxfA8SU+Xe4o7pkfxP41ryJbz0gBxyirUYo0nTh/ZnLGVPffopZVG9a4mJp9z0GdIbE
I9twNbe5aTKlWu8MiLjdxkb4V/eCypvtaILHdjYUnLYv2ZDImrd10n88FCj55bZ15EyQc8Q3ctHH
g8Gm1s5Qm1qf0hckJxGzX0QLI+7TM4HIjVCdb7KRVQHi0sXsEdTrLOE9WbpA/jsHjZly2uSZogI4
UymrWyMbuPM531gT6w3EhOlWl4Nye748HTyKuOXHdEDFLI4rXRI7bnm/JwvF1cd4b5Uzrlpz5gOA
8aOi8SBu6EpAaYLUoNrbx+RhmwgbjROak2wji7Wroi9A5bvWxheXr93RBo6hQp/LzVMvL+WvSpG1
3+X9ROG5tFXd7KzsBq7fg59sAiYDlO5qZ4doh0XBARKUU/f5ycBmy6Xq7kjZApVtUUbKXRPB+77R
mzPaPpYCvuiYkYh33yXy9b+FjbbSfYTw4GkkSiKnDwe8ZDvv1V9FdIvltfXUL464wcqEF6DBZ/+H
C511ib/2UmixzMsaEgFk818tqzNyj7T7u+7AUW4Q7dbuc2feIEJhGjQ+sgAwA/Qw0fY1zM8hLY65
I9i80XUWzaFyA/R1OqQrVxHtJ2O6Jv7+gX6L/0a4L7Gzb7MYL1U9ysqWNxhVEs18MEvdPV8jCmls
YASxzQ/8YyLvOhmOLr3mVN31KKZQaH2gqm1NrVZrE74SR5Y5BZ0WHRbY6zBHNxVp5VNx9Go4W9+m
7AokbLvWVlK3apoS0Kn4qU99Oq0998ic+bQuwQJqqr1dohyWDEXc6QpxsSNTNgjQf5DQnl2qLofN
pQ8aGkBPH+Xwz2HKSE7pyyO1Dv9j47dS//ucsNn3ZXznoDK/z4LmqvevZfOqxrxn0QRh+shsb1Qb
LPybxA6JF3fco7MpHHZXFE157538Z9YDPB8v8MYmR3YoN6b84bt6Bzj0epJS5t4j4QgHvRiNdp2m
icpvq3/c2g+Nc97Z3GVu5gH6UnmOLMAdYcrlNLajUHyUPWUJt49gHRNSaqJtgOC+qZwVPVc9BrEW
s061jLrcFiDIlcW2sKMubyEaVfAu0ITLVlISFO03EINLiAV8rUs69efuxTupMHL6IioGSWIjKcpk
Rblxi0QljX0V4NbWLLMLSCl5+rfV8R97cgu7VB+zo8CxowmS0Z+iOAkoFwC0XTjVyMJlal6I+iV5
VmA8p8cK9y7VDpd3YQo/o5SZo3M8c1JDE0J7t/CZWGOta4Aaovpv/qbr9kXWsIzI8T9kmqOd8As4
eY+3fy82jPP04365WFvM+OF3zXHeyUJyJfagUDbVbjZZsWfxpZzjldKWM3o8a/bTAQm9WjzaQUHp
xW2ohIsTrCpgJwbCF5MB7oysJleUIahF1hUccIijwzvhYduWo8615mqPd9WZQkCzV55/CcZWUmDz
2I265DsUoRDW5MOLWHt61sf0GQKnm9MfTsnR7cn2IwzJmRMMG+CWHD8kCGj3DWVnJfFJAd46zZaL
QOj5Iegk55egA4ZnEqBufGtr1fbqZnn+sgA+VmmCw4LA31nKWv5aUbXnSFKpXi4xtXxT/s2ioPRW
PNWUL66jiFD82V/ecTr+lamhPMqJv57owVsUiV/W2JAextGAT0zIu79Xqr+OPNJ1Q0OaOacnzlCj
3MQZy4O0Ys4MoEwHq+5jTaUn9vaSXEzxXyE8ddswR7Se8Xa7Yo1ZG56y8BBPTjKlweyYh9qBIUgE
RbwTEzojtZGT3Tmy+kybvoTi2/efpHve/FVhHMzQAVmMqKBRDOyANiw4cERf7u0j+6cnDOgJkaRw
Dpc1DVgujGH/lfudKVvddyEaJMZ2RviLMlUKkoQ02Z58IWI6Nz87RoaO/rtCE4SDCWYiaaLDr+XF
ubMapa4GQuIsBXePI3Y12m8NqKMSLFbQ6fJ70zTSr34/WhZg6uc/5FCzIqHKqNHsK+7PPrfYwneo
xOIpwEHcdGQEyHqDFtF+m/QyOQEuktl/K+hvACz6xCrrQ84Z0pLAR9QdMH0rBYJvlPnD4iiMG7Er
BE1wSujkfLsqKXGsA4mJMnAx/MtW81KX4dl8TdeBbta3Wd8YKEnEZLrJ01NI8I9I3QGpqCVx4FSw
h+C0JX99x9QKn5w/3ffkgH5982EQRQtyHacgrNpK0mC4jT8d9gltskHQtg3XkfKyzSiNnu+9RcyA
gk5LDb4aJCQQOFcRYvxq6iTMNIyUrVA+W7cXp4V86JKrANHZ15xn/3fEPf8AjNwxyfX3BxwS6rIh
wdJRUA5X9j27/v7APGb8/pWD4d5lJZXk3IPgEBK+NhyVf9kgzB6jTqWrn39Mckos5j+KH7zBu40B
0dEWFv6RRdD4U3NsZrpG2M1NufNVLCJClgzIyOQlfw2El2rDaHgLD0LwRBiu0Z2tCbD/jKY6ndYO
CC1VMQXtuyj/8YSB1xm07sjtPFkF/Q8nvJ8RTbIAXo0VEF+DohXgNAPD9FN2mpCJRIohav0+Kr/U
B4afWJn0gwuUM8XVjAyK/k9A9nwYp5f0HBoPGzYMpuXosCWt69mEZhTikod3UUOtrz5w9dX87zGp
0/ct4sYgzdr8LuM7piuUFejP8bRNqMlbFCoIydTT109AA28N5VUKGNxydJuTFTKxc1vREMwkvD7N
/7Yj+flm8N/lqfRj2gGxD7bIhbx7XuJj7cpi1nI0E97i/5Ur+7odTiQAYFq9xN99KQi9AfbVBYyi
iJHbQQTjDoyoqxjB5q13SJr3enZ1WTC0CPnfcws8pdTs130h0B7/6pZrgutc8Dd9EKIxjO7GFlKc
tnVK6lTnIGvyDgy0/NV9BVcusPQyGpL9kEJEhOy6LgXc9ekXDrLTZCSpwXkEaV/iB0Nv9jjjJ9Ci
PckyQ3E7zvOf6+adyBJkVsuJ3uk2lsX7ePxuOQXbxuHM615p3BTZe1iTixJTINyjvjOYu2EOcS+i
4jCgeQPFuPPgE5x2WvnHTUlyRiBuPrYz8XbUwITAyrqfWT5b2sh5upoFOZO7AJMF1AMUal4X18cs
7s+NoSRNugLPXt76k5JcAtQsXQ5yaQW1yv8T3Dnspng9WBGzbt/919ye9ioTTOTgXGFSfZUEYPx9
anDikM5+vygvK4rP60HZNFoCM6UWxCaqz8y1sxnSfXGd9iWFmYHnscd47NR4CcEU3SgZmZrMVMR8
kBOERBpyXSpr5tN3/XoVDJP+q+DEqb+lQGlZJmwS/0wmH60a3X1wBV3GBnxACshg0OEdSSjLwhHv
j3HP6eAb27MMxm8ExyQ7uGVISYyeJTOknbCNEky6PLSGtL9yIb+AK6zGV+1V75SlWrdz96gQY6sA
FGrKdcGfAUPDru2Vdqu4FafisuY0V3r9hpdw2rRPwej9pjzpDliIGkYclHrKaorlUQdQn157qcGX
nb4iz3MAqCxjJ7qiA9IgJzGE7YmfPK4X153zWkfJxXijgYTHpVD0lZgRNWteVpB/GrPmNf1ZffbN
H9sv6F6L4HevV6hvHBhD5lu+1cp1QORb4LGhnHsQkRnbMZZ6Z4ZtefGG9skq1r7Gm5p4xy/9SEbU
HoSNbR4mld5TLu3ibLufcXP0vny7Eqgtxbj4Zq5jr+cYM1vQNvRfmSCepUBCSlS0nfH/mUDPg4IT
ARP/bVlsEfWZhWsW+f4uKFAqXpdZF319CPyOhg0qTX2z8bFxzr7rQ3roLK47iYZ8pbSqiCaoJ5Yo
J9GFzHPfyqU+jndX2fvihULAV59sH1/9OkRugktJPxYSp48D2e/rWkQjvVTQfvqA3mH2zoQsVpom
OR9bXwq01KhqOZKrkTLRXuZRmNIW/0JAxrWo0rKNxtd7BMSYtMwzD4YOQO7iJ/Foqpw4zGJYJRaG
/HqyLfoxgP/kAjpQLQPJe8/ckMj9ucPebZ0fIUQ70off6aHSUEeodv/slPaiTT280gBGmPiJspj7
5Li9lJjCS4ylN3aRY57MenutAE9Qxv9CAK1k93iRSOOpw43/ejZ8FXM3jh+k4orbqhUY7q++SLb/
vSkzWo5ToHQ5i1zftVVwzp7UfyySA3iUoNhc+vBuqx0NrSM06TIaFK46u3KTiAhEJwHHzEaCGDMq
uWR9AH8n6U7UX2HFdY6YCLA/qT2NbfUZWhZaDfNLU1URpAGEzyNe1Ob8+yaOHJlIGuFsF+DmmLCx
Z0Qt6ZUAY2TuDsjRVEp8Bpx3w6N2djWbj0VvyUEGlh91plQ+70Y10BveCV0BE8+LSjvn7tES50Ky
FZDd1H4LknuQwEceSj9bAHupTcp3UCAl3iUKcEHFsMLHKGFHIYBUMyXqqweywiJUKIdKnoojV+w0
hb9Cr+s9LYugxaY5bFsKFesQ3Fu4mCFKP/PBs5b+Y8zuOSoeIZvvk7/Yytpo5ooKnWXHlxDA9anG
4s0xb55YZfIA0LRTeiUSxbClzmt5j5eZ1ZfK017o/flcrnpgq/kRbUGN+P9800QH9JA3cfJNc9ld
QH33GRxcswiGdDlZzkzTglb+2Snxl49VmHwvW4EbWsKLuZmn2cVOcGO2NSBHuVKKXUjVPzZjqZDl
sQpnXv4ohdJpzC1uXlkwhopKPSkCqYGoowOccVVRl26SU60ArB0+x0Bu9UF5kFGJsPJtoyCjBllQ
nSw3zBpc/Q+cAY9dNwDhezy/wmoJxqlmJgO/DU3KGuSRlVWNDUWV3xwhxmopICpigoaGx9wWS7k6
lIR44BOAWY7MqXRlGksBfuKtG0BFlB3OUB1kKISaPsNiRO2j8NjQrM31XuA1dPvJklMW5/rXp6yr
y5S/CNNNux9tVZB9UTT6u3zOUD0bLdBhOarEJS1v7FxnWSz+0srTYP8grvZbIA5Bnc+MJxZhaMBk
2GR+woY8lBgWuIgkq2vqJ+PUBp/hd0L1zxrDywtWZ2uWRajbDTQVaLxzVFCDwDk/chLwzNDvqttw
AEy98b7W9+NTTXXU9Tch3Um0zag3HfpseiVB+BZ3/2pYclF8BvnUobGVonVwyb0RKefMVj/+g4Hf
mZyVmmjdi6Q0McWGmsjZ/y1CEPDbKF8LvOWHjnyxJg/0VzTqshQ03Ej3ev8PtRIDbTEiXcTFlWiN
KtoQ8xvLPmZ8hGYyAbGUT2awswzkGStE9kHuaYsOKCxmr7T3006Cd3fI08/FuQvQmGqq5cxsGx1o
0ahKBfqL+411gn1va9mHpqe2dYghybuo4Nu2rg5HThwii8IDfPy7aSUwL8yAFmSIYzKlZWoZU+/g
wy+KbMTheBzW0+gpAGcbDDSFBn6L4qmvFs4oT7hyq2zUiP+Ai1Y0HSVv4E89xjUJNGoIlsk0nR76
GO2N84gUjWOMK3Xc+8KT2dWkoHx11seZhwcw8HfZGTbhmQlhR43ukhZYn1LntG1CJB7FBLNb00w0
PQtFWVCv0EoMxSD3MWekC/eKDWFRmIJaWNJsTV2fSnPZ3eBLnSLGAscP0fliDbfrWEJ5dlDhDO9o
c+80y6rilAOl9+y42tnDI/VPwNVxqXzx7bsBBv9kGro/1NwCm5Nfaid9g5moTl5/T/6uMdTxZ+0L
6ej8cNHp8aCSK5wyeGjhQ1RbtCLNA/vjSN6ANIv4hHaw62U75UK+lTEO5RBNeZhchv9jIOKbvA4E
Eyz1crMzJMk4T7c32GPnn84RQVYPrs2gTL0nFGMPlzM2Too42nZaK260mesxxjzZ8ie8CkS06pwv
SRpseN9GG3npSVU4dgU33/2cxW8s/7DjHtpB8fackpZviGQvqxaU1usK/bXKr7amtQdRRZd/3xPT
RlR56UwqBWUnIAHX04VvgRztJu+Zxe2/hgiPkallynCEi6TnKBKseegfMHJFzi4PbJWo/F7nlN5E
JbJc2LoZ51HpmS+JjldJt8z4W5bZc4o4ToCILb1jkf+7HIz+k40DVKbQpeMXirYkpy0eZDPdR6nH
t44T5zn+GLA5HhYvFMuKk0qvJxHVj/A8n2zSpW/mzj/2TzH9AzAXbuEW2jjnjUOGPSuHE46VwvMG
wAg27DNbaYgnXbd1KlYAgXhGEJcxlO0114G6LMSIH/71seovZadhv+eAhMBpGvQZnySqjz9phe+g
efPuZsr2z9GQxN5Tut/uo7p8QeGA5mwDef2xte+BE0+Ai4hX5mHyxIjZy7Tpx7kddlTfvSHOaH9Q
X7UmjN818LoG/BhYFCZlHv4+rWjPOFBO1J8bMK0dB7o55b6SpxI0zVtRwDo21O+EGXWY3+ICcV6u
u5Y3mFbno+aKaeXwXTATtTBkKGw1AeOGv5OiKq9dt5CEppptvAeC1Y0PGXxz2uUMnpbG4pZp3TRj
EMfBYr1VnHuX+zfQADTUT6JDL/oxIWGGi9lCxSh+JXzoeb2S8O+IbkwHZ28inimKw6YSIw5f2Eg+
b5KYQTeAXjFFW1I1OaT/Gn/zKQ4whe2jh7cPx/eGIj+ML+xYFXd15Xm5+d5vwvHppgF+3FzFReF3
SYjUYoGjSw2fISkT9ytxn+ZA34IMwyOAsTPN2gyQYGVVUv83KIGXqb9MgmUXL72e7VIwukrsHFQy
lh1+T5k52f3Qxu+YULaXWtmalcUkE7edyxCuTIv6DnFbQUIXWa+dAZHK1RMmGr7j6eAJteLSphPB
YeFQwh26zGOq5rtql7X/55EEtNCr7IsdzSCAgo8toew0g16ObPH/bqLqqL5dm0LHbznzd9DULb/U
ywACfo9XqwRFtf5H4dykET0Xdux8ebdCHdxc2QDl0l7V8j4s0cAbHbfbf6TQG+3nVcKTrlyaISHL
0NR4Xhc4ak/vA3285m6Sg3NMlvh1+kli0iu+jfAzhcoGPP1eijRTLAxZ/JKlrzaqw+6FcgED7tnj
8Jme+MFvaVuQtApVA2DXF3hagA6RTmEo8RIFnNvM7yfA6Hd8s1kDkYTATC34IYUAhl2nFGzh/SqB
o1kyD8AShLDX6U1NOg6h5jj0D6l9Diwe/3EdK9XAllS6Ed3RtL/UfDEFLqLtkVESLNuBEdGKRokR
WWitKQ21H3l1x99YodNcz72ois55aB/4ks/FOj+ZhkPPUnoQrmniXe6OoeErnQ2ANP+ZG8b5G3Mr
kvX18dKYRzkS0syME0eppvrLPmfM7uAd37B4wDz6cje6Qoanb4i7XbqOCWU6LtK/kikB4Gmr6F+2
pMvYlqJ71uXfBlqZ3i569HIpVl9wxn1IZkFOjtnzRyrVpDW8uIvImj/4yTDqFO+SQlcgtAbrpc27
bddw7qdoLOdmtmywpw/dZvYxhIF46gig83TQzVKVcUT+fiyNbnFA6Dd5d3q1sV3INpqApXlfdx4e
Jur3ONY8qBg6UdfE2En1wT1AvAjSnmxud1I+sg3ZZxcqYSE0Z9oUVmkxdUBhfZY6D+gJGnE+Pof4
q+m4hCDkkfuqOs71b835WzRlw/zXnowozVoZRzjSEQGQaND4ESClJSnQDQDsM35qT+Iqk06ORcH0
KFKCl+XY2fmzKSy4Kb2OxBRyVvDv+5FC5eXLo27dMlyiYwUsOODWy+9Ukt1V8c8RDgE6QozoWFcJ
wg4O8ZsztAF/hgBtCIFpeQHmBsnqc1VjICDlH973SDe0v4ypgwpyDEI6d+ztoOWM7EbGFV5TVW+9
rtrj/O41pdD7524iF3C7lC3WWSKmmuqbxkH/iJzbvVwd+cg6bKJrmOgVBymyQszm1AC3xCHUnOJn
xsih513q59USoK++KT0WGyypwUvVpJYYbuLBXSjCr63lHwMYUkOTa3qYOWAzFnvjhqatj7qnwkps
Y+bL52sWo+RB0TiQfsc978LdNTKekrAvbzXIzmFk0kcxa8DeMMfJGfyQUu4uqs8HIiOS7ybwH4N5
wSs6QGYdLvkvi+bM8lUHyhTbEWPxX5Er0+ipoFy16SAaYuGZ4W1K/nNulm/C3QHkoUta0AO6nfzJ
zz7xiSJOiMVEMl7BbGh7gduCFBCpU8ZeP3ktiVl3rEKIubqkg/fm1cE4QujnJni93nf4bZjHmNnw
xV1Dp3WuBkPhWKrtUBKG5zlbCkRy+pQVi6MNofhVY+0ZocpdKf7MIoCTqbgbEdVXBfBi2Bsd2f2b
1zgralT3Xc2xVn+2oEEBJJeZ6/4ZuTQDNLfGGjedO76MXH1OMfMKI5k6aXev3swl88dP0kSRUUSE
Y3ZACAzSEQJwDtXFOivslHjy3Jg9NNEAxmi+LrPmUr9/SsnGpy6XYtq8gBNy9C+jUyXYZx0L09iL
PvTeZXxFbXxkRhEnsxozOLub3HNPgpE7U2sYjAldrnU45heLCPQJqonokXSWT5c/eF1jAqUNSC9u
yH1q9Nur8zK999P6x+bpX/Zhjenp5yi2ZU6Edjqt5DwqIGX0uxDIAJarcozk328U/ODVo76rxDmq
1MAYPhp4iwJgAwHH/K8wZV+dJgFHBQI0z53jEMcXkA1baNXICsKdZvZEaQXDPjFTZi2kEai5pnXY
VqW3t/YDZkfxw2LW2fXwr01L2YLvkwHxzB8kAAX4O46aqJe+PDGLQHgOkAZ2oa0fVV2rrQwB9sJW
m3BJGB0gckykHU6JqB2h56Anp6u5M5i7rICf7HXQZ1A1y1JlirskkcVOcQdkWllDblcY9ndOekZj
p+jsq7XmPB+2+TJU2rz5nypX9ffe+qhLiweRio8oKebtgDlIJ3sx2ZU6kTfCwYwe3Em8QinjNKZV
Fo6QbUzozBZl22rVauPzO6ZhR7ft7V2uMS+xnXMxn7JTqxHw3IooQLz9Dc+K3N9cC4hTYZg2wA8D
bVhtcjhgiuxIIvPKZThRPmGKRicijOrQc+sJ3RvlAdim2TuvTRKM47gJjKnXND4CFB+3QW69cUO2
nHuo9xYoyzJxI5K3SV2P0rywNvYQdPn8B2jzHhLjK4zFgXSS+OhFuI9E0F8LZ6n3363t637wmI6m
fyQTGe1FHT+hmJcmGC2QefaNRxKL85Vquhw+1QbLoH+Ryzq1ft/j+ItasM3tsfnMBVaNTGdjsSUV
/FVOT0eFWTMQ8jD3CtTdH34ozG/januVPDhGgb6ZZ1Bml5QsbC+io4S9gj01VatM2AySZV0ig7x8
Vjgtj5iz8e6Bl+RCZ61Rd6PrpCUoHOsSc9djf8FlGeaWm9e0vEJEOyZoYAD+NJoK1lvPmh9prCrg
2W6Ge6FlU5ajYM9NTsjVGo2ma2Aj1TMlJsb0QSeKnxbZZEzDibbXPBGDMN2qXzE+BvkLgj9U9/VW
dgeeB4Yn0dEHt4epziD+QRUeWB2lOEzTsMKrVP2v51YCh3Hh3y55rw37PylkvyvnLjbpwoglzC5Q
JMC4rV26B9ynf4j57h52yf9lX/7JtKek8vyuHSEBR2dQ+TEPCbHXE6rK7gtlPr93of6a0jeYVv/m
94oOxzWpf9BDdGQH++tl+hsmr5yp0OLTso4s2wqPS+hOjxn5T0hq0INCILXvq4QYbxMl15aI5D/A
vRqfxgG91a8i6lW+PZX5H62i2AM82mhtcRYN92UA4LM6rYnSsoup4OKKHu1LcPm17Je7D2R4lsOj
YrzLToa0ycvAYrK5qYkelGCgUEuB71a2kmzDu5o+52GMUsArlYZ/lhiBWT4jr5E6AOVAdhP55Vcg
NRSeVS5jreljqfcZFLj+ruBKF/1h7BCE5EToBXRKWbnmA3H5L2uP5uiWq80Cx3nm3+M68rdnzIed
mP8wCUyvjom2iwFNc1v3ZdR0BSlaU96U09KsxdGOnQj55xb6afsmcng4DNyhyGqiva1Fas25QChl
K/pRW0xCC802jIBbB/43YDxU9Pa3O5npzSN63Yf/uxzuQgkrcHzoZbOf7K7ZzjGAl3PN6xDDnRKe
+XoMb3cq7EY0Kvuekqp1N/tCWvvYYwcXf+QueJkjRbCFQcGZtTVwYaREB6VV8etV7BNIZLI2PgaQ
zYyXlmuN+8bvv2ac7LjMhweraN/eq1AEj6AVj5ivHigOyODhG+/mlwpLNmoH5NTFN4PC9N4yHEA/
hmXsaXRMT2XooUaKWXYPhlmVLB9sSfJLPa4uQPqM5+qkduQ53H01a8s+PGdiMv47a8s1245c0FBR
Z5wqDpND502CiDnZ7si7eiPSFh3MoKba1VLXFJnRzmve6/M+TujuQ0OEhdEqfdxorl/F7hEev6gJ
ref2OaWXIwMMKjJu7oIuYQ5cciT/Z6xZKqK4orkmiDZ/EwrCgfU2KMIGilLTQD+7ObpLUuEAGxq/
jVU79yQYjWjf16xai0/Bqq2ZjhNY6dgRIFcay6GZSkeAQWyHCzW4sr9HtMTOM4BaiUPMhv57/GDf
4HgdXpFk4PGfcFDbBsSCAAi7JUJ5NMZI6IYzUcko8DPl3Hmk4oQulgjPL0CSdznN7Mf3ss1f6XZd
OHa54PCzndrnFDzLI5BrjPNFevkIJHXHSoqVQtxmsOV7s0Jg8Jlnwd3Jgqfi+btBVYjoMeFUbncz
OREtcxLTgAuan3UnH5uYIH7sIdy0vYFA+o3oVcNjJ6YXtp8ndGibcuO03QpT+J3LVJAEVYNbk8Q4
iqM1F4FAeVyeK0GRFABjSY9LHuPRjtfLaMNl2yDHLesOOgG0tsW+VOu/X75jrxmePVs2vSLsdbGz
1GpMrkQUZTbxt89tnPsjtoPapcPazvWsJcdkCJI64kXZr7rbAePoMSucIwL9e2IbPjLW964Jjiur
UVrHnz9hWepn2KAkG8G0D68qMYmZSW8xz6rL8Nki2MfQMQ7l6bbmXbrt4jBOzc4gO+WN1FoAFbZB
r+DGRPXRtxgOb504rxaLLZ2+dSJPqYoM2pH5GQlJ2JgNkr/yShOLcYIegGyRQBWcX4QOV3aoM7wq
605DIYxxBJm6DGlMrLLHiOviLr6A6nTNPLOVUrt3rXARBNtzVujNgbuHI8ohu8RdjyxOsbfp2OpP
CkQPFQf0R2L5rsDy0ToSpHYzl1XuQnNufD+Zszxxe4axWHxQXPc5/9TZBHMCT0BYRG+VW+cuTM9C
WUcLXJeJlivO+QEKEYwu6nBVsbMH7ij5NswAjQaHjkkMW1KP01UP5L1HVnfKP58t91aWYuWF2cSP
2InHATLdUP+5b6gSUOy+bP3nvrsb0jguEyWasujLB6lZU6fl4xPC987zJ9Z2kxAcgZlqemB/tSLW
KXazyhehIvJYxQTXm8f0saGj3ExcMMMKJJLr7fEhKRuJiKCAmWGRR7VfN6BKmt2OjFWGtZAEZ2V9
E9gpVz4YhNginOUI9SFx2lGDW0snqv4h4rCREHi+m+vazTppvEhaiDLBOKa7JAsd7tK4hRYbtsQW
5RbfS5cAv+e2trv7KLtxdyFUhZ6alk3mrZmMU6G6v0bmqDJKjj4KJGCbTTZNzRbDhFDbETUedu6G
mKuC2Jql3wDH1PheVtzwCb/xBvMwNTwkIhnfi2LJqAxK54iU8+uirJXEJIFqZuM2DV30IHZ4wIDj
wSkyc7Q0VLg/9Fze3eaTASAc8tEltKvpWqHprGQ2m5fTlbywRb7x8OZo3CXnJtDnPgec8T29odG5
5tvSIsjV9KatOgcF3+zeLsGv97R1/aKz9v9dmgUIavOMK73gOCpkb/EML96yDM8WY533hVvAPBNr
PZlbFSyzrjr9mrjTPTzfqT/6eLOZfp6zjbP4XH+BFEFm4KdF29RV3aFjltMObyS1dDL6egA7lx9I
FHMDqplI76blpwBHFXRMxUTT2CI+0YR+J5XSIsH/lswYX/gyfRYiYSNQFpPtI3131cWAlM6MB4lC
Ifr9BwD0zMV9fym343xeYcQ+Hbg6wvf1w9AimfBi435B5zyT3i2oHUE82hCluanD7CyVDE8X2ViB
cydOG8wX0sNOvR7Aex2CrEqbafKsjBZWiOCUwgglCTU2/8pi6VcReRmBOoNf854emJEC4kN/lIE3
GATHQeKJplo+4qJSHVO9LlsbCvkUeCWxSM38whfWQwF3ANtYaGA0Lc1//mkYXe/looRchZnloZmm
/kRVy+UF2F5avjz9LI1yhWz8Q0H2S4oyDXaLuSa+ycegjbRv5l67n2YlD2YRzOi3XNcSh+hPTeDp
/Dndsjwnj9IWTAsPbOCsdaOiCc1Acx5dkM7IgYjzrYjq0FqLoBPhhksmjcwy1xCzUFnPXBEj/wLD
39maI+ByjSXfP4MI7IIJGOPfbC7HHvP8L4zDpk1MMeR/DC+vo6ClB5X1PE7V+qQwaruMQHpPAUEw
qnSmcNLLOEH93FVSJWOYb/dof+BA9EkUAApdQpKBFfjFFwp7MJshkbCrPd+ghCR0Os3Y/6GY8S8n
+IlH3M5H5lpMbGxtPLtuIOVmCRwAmnfRUtNaJVXiZgQk+sHPzYmHyiPsSH8xxc1CB56ZKvpjQdv7
9YnOzMhWdgLL8rnws9tHagxNYDDkFzQTcm723DMxd5umbhWiy0JCvtmMxLPSikDMgsFWHmhq3iPE
MJiBbyX0hfvY31KLIxx4iEVOOJU8OFcGedu1aGqWDUw/U44GO34kySgM0gAKMJV9W96SQHsjDTtQ
T/Dnz+l/1YW4wKke2SzM3qZ7q+jrQdANjrDZHGRfRvlHJYBFuHSuI2mlBS62LJv09P+J3n/KK4uQ
z8Kg+vIwKlErKZCrz19Ck29BybH8GSn2BPJAFjVAbDXozAse3DWA9T8Zgh9QmMiRjiNsau5Ke2Qg
yrbpBqmMu4wjuPdcZP2oO30NVoWJEbVAeIQMO6tdjIEyGtayjTK9cGFjgaGggilAF3h2BtwIqt6Q
modBvupZMbQaSQ8OAUY/p2xXgFy4Dol32KeGiP2yF1/syYut9/TGqgrHydtDCm7DFlKBhRcg/R2B
YvYaJPC4jgMBilU4zxN9T8SMV+hnFssq6a8jb4Xj0iKZ4p4jl9QRJfTaLlktvbquqEYEWXrxcaDD
wbgymwxInqJM9ZmT7gGukvdsORED5xJFX8ofOi9misR1TBlOlCWCzfOFku5pLvJfpVk0x7oHhyuD
cTEIrQGX070whIruw7FrRluc3+ri7G5bGedjZWnfhqnolk3Ra5iRZb9Mw2U4PRzkkXgavYS0V4pq
QgM2yao85mHji/VJQlcUBsSQW/qtoo5UtEGhkZutIV1IUp78dc3wAmEVkuiurdguFTRwnO19eS9W
0IcFN1sQ+/FimR5qLAuUEYMEdNjuv6zljXU6MIApsrpO2/4TtRTCqMSzvpfggNxPCfcIfB5z1Kl8
Hmtq7ZsAciL77bFsy9iP74rZVi6ewXdmdeDunU5ncXvYfrwGHycEv5YahUuwN+NO5rJoOd4v1T/3
uLXF8fdOx2gH7r7W44IcCUTBOusUsAR7iLQRyspzSOEvi9Hyrv5FbJHH5wIeABJ1pOtnnmd7zdTd
fPGGcqaLnOFCr/QlnhzTvK8cDdq/vopRjioOPk4WyaURmCTH0DMuQeccVDsGIZSPNgiUsn1LY83E
+Zd959N+4yhZGMKwqNggZ+YjlGQByz8Hnl3FKAdryxX/8L0ACVuteMWBaunnN7YZoErX+8DVIoxb
2DtsHSsjLowiIpZWggffkT7Be4Ywu91w7UDsggINqLUvqbxkuK3ZQRpQcPaHWAHkt6Y6iJ8t0uUE
I/qeUq+wjZzH1pB8ljgOuAopbsulAlPh9NzL+W9TQzQE8McOd1QyqOCRnX4ayKb30OjpyP/3oWQ1
aW6tcvPF/heHAIbldy7vmogQOmfYxoWc3wipTZz7+s6Hd289g96D/G6HsyNeC3vfGQRm+GpzKlXq
f9FNAXC2bmUrxbn7dPXd/sHZVzr+x+JpSpC8VVFACraThA5VKmS1qiFOM388JA6ptALhGiFjBNQB
CL6KKb0oF2UUm0G8GnXh0Jeu6rIIX2BwsRQFTdKnk/T1Nd6wEw9fHmSTt0LliTTAsxvWOX8ftvB/
d+n9Nus7ebcz2zNDyEZEvDxysY7wga9lzKks6BQF+g2NmIFR8bwyY9eeMi/pJh48eNhrI//vQAOF
Ymtgs+om778Hl2WfYtRBhgdmY2p7CRSCyhoqqZdIObmTkv+Q0OHNfVxWb4R+W1J7b6WMjezA9e26
Q6OgsrTOEI3Yt51AQvK4ZZ7mGw4JKUmD8RbfoehYB36IJNJl/z36PKyZutvAvCbS1V/9klDG03Qm
DKvLwZs6SXQlrgczg+RmXPHLQdQAr302zmGYKSin65yDxrUf7mVOhUVEKfksEyV+KiiRS/gsqCEH
TmxtAgjX1IRInfQMQm51gkBgzNUrh1Kg4uqMno2DannEeNdvxJiYMnVTVuq47r7Une6SQ0lJWc2d
MJBoobm5ZVzyjFLAoYdJmpdCwOn27r8Aubn0/fBBriMCUzwpiz/s2sVLKqou6F/59MLPjHck27wF
fU1mpT1JCA5NUmXVoPRQFJzLjqaY3trLH4iyv6XzsSbbolDMZSnuU8l1h8em41PfhtasrKfirODJ
HhWYfKmC97XQz9zzDhCe/9MOfDrSROMYDenmY98jyH/CC5gi60Vo24hVdrvJZCmweayuCGorm/S3
fi2by1VIC+8Bny+K3nyCRkAi9sHjKI4zEedUF3sb2g91VZhOmBT5sOyc//iDTf03UbebU1HWpYtR
kmmNk+TrJ6d0GNGZ6AufF1LnaqacrTQma8/gJpPpdJ5yzOcWALBdVI2pvkw34VFYoEVJwXol7i75
Ec7N2MRcwTjbcdfcg/OImyvhz94oxv7Mg5ME8NUHtC2tYXxbrv5afmoFKBeimc2YxKcYbIv2VMCp
PwUEBVbR++IrWOPBpRTudmCv0q5OTPhcjhBLD0JxjbSZAMwclQpmXKu0cWt2m48JiAYr3aR/K5Vz
A0iKuwOspROYrW9KgQEPklWA2E5cPlJPWHrTXLx4tWb9vGwwqbJd4mgd7dMuAmxpwA52Hk2b8H6S
HDZb5xEU2/A5yGzX7LsFSPRZrdFGlPFu+DprOAGts5hZiy45FVbgI3bbNHt/2O7P+bUURkuQeYRI
T5xmOV5G7nN/ARtbl7abdZMrTIgrX+UNuy0zmewex4laf15IrGALOVA5hHU+fBgwMLByveTsv6oS
Ape2ECq0Z9oXmLhcu7t0pi+VbZssWtBWu5s2oW4roo2L19Edg5OjanRTZE3NyyCNN/ryY/QhSOU7
Ez8KhUZJY5+NxxV/8YlLca0wXw1qNIrW+zZF0lZLN1hReq5UBZ87qXO5+IqRLgkYMkZ1JKCEbrIr
xk/J4pkAh97atebgwAFYeV93DQGQfUtk0h/CbRybDtw3QPUcY8zvm4BXHk2xCIrjN7KA2kKbRE10
/WZsmQRyNH/gtddHC1y2H55uuxc19oc4LizOUWQ7NKZBewwmA1XXyGMBZdbO5h7wyZ5GUK6vRnPl
w78anUnG+xYFcfZZxG9XAO8GMdX9LFfUByZQnXE2SSPpv3vMtb5rDAjZ92njo91aoKMOz7xpKjV6
dFQV4srDX+ddvhKE+3Io2NgrSqDU2E6vVAfuduCgf/scLN3X5qGu8P9yi9skmV4MvXO8nS9Yv4TN
EOKZS4M4W/eaHKeRt44makiVfzOJMZSX3O4/+5W2eVf0fSBUKgkTa0Hx3E+63Vj5x0//l6AAHMgN
aGmC0prKTHjEi8HLaCOafH0Hbw8Q7bpa5ptb1MZraqybG7QQyU3q9NHJq41BCpjNf6rGkiW+YVgl
qOvg3RCzKsZR0jSlVDrux8ulsjn+nnRpfH+rtQo04wPB2JH0AQBKscij3fsfy+OSJwm0Jtw/JgCh
Pho/Xt/ml1wO5wW1HVzrK/cAcRdm5cHaPmBmsLFLr33Eu9faxQiPkO142r3b/JUgZf5AQP82EJ0/
WtrJyMuErBiyNalDQmp9SEC7d8gQUnT8tJ5UdazuV4TaIIfP10P9GhhBeKVrym1xqCg57rYY2dyu
k9/fkHKZw9G/K8nmQHWBTLq3EDbAyjK+6K22EiRzmDGoK9A3X/bL7pU5kbAb6xvzRFWXWs2zxxYc
8ggOWo9ifwGDTR3wVkTD2SQW/8YDViMPJH9KVIn732BQ2fRfyvI1YC/+2ojk1E2jA/s8iQJAro9W
MJPNmk7EOHg/C9rex/r7PC6/jpN7jPri875wDahvMgkpej80p+h0AbrIYKtWfbR4XgL36JC4r44I
yGCNp3D1oj3dpk2aJ2+8+6CGmz2XedVwKXSJBh+6Ffmbb5J950t1mGYnyECj8V3WYPrFASrrYMZf
ikOfFdd+Yx+edRsN8nYgTvPmhXf1FmyZMgzf4ung5MZiHx3+JRXZx6grK1Py/g+hc9Kcecrky0lv
XlVPPTtsDeYysl2MKhQMsFZwHr9w2bbwYDDIo0F2GKYkVY+Jr54/We0UIcAFlxOqJzne9Fz6Ybgl
0NtoI6LlfMRGf0mrtmovUEPeHN56E/wRcipbzU9qhLsc42svWr0CmMdWFLs8R5du6+P1+AWGjpQz
s3eDzArvPzuhDAhEiN/GJgxjjv2mkfmYSs/K5ZNL2M9eWqbpzSeYuo4gc9Xi56Kws1m9D7WeqD7P
Bb1Q2y3zsNVstnN1Ebjq1pY7D4ikJeM2F4b2snagpBN6gB133Vfpa03GkZ75a1SYH653uZEwqczq
KocWqnfr9UrF8UZoGEiQZcKuVgkI+gwzMbH4YB3AJuZDrTqCKYyS4oRvin6y0t0iCz+TE5uCZrJI
Sa0kHRgoRngz7B6N3KY8psJjBLS1bnyoKu0+Vt82FRa5+vBoaSpu0NmjMz33OLYT0FSnVHYCssVj
jRGc08pXbTY0rCcn8nYLEkzdvIAGKFlnTXfHnLThqzdLLT8/CGjRDLsv4Tdz/DjVbqyITUDBZnrV
7QLIiXSmmoAmf4boGVmSAbMOXc0xQvr8ySwlHuZRkZj8bJ1Egqb8IxYdPSFWRWj3qLv21RhR4nP3
4QU04yOqJAfo19dY5XIK97lYnjkbDiRLHPsm6D4rPlEM+o4UgcLD7UwmdzQZQ0dxEZKJzTYfZ2d0
mZUxQOR9yS6DtFKQwRUU5u3ZY7Nr85PiaDZ5b8Z5GQEct77axJr1FrPBtnALO/6YPTO/FmjTd1ij
K79NNiaSNWFxAt5h5W47HFNtAQzt04kcWidlCh5QmMKOy/YJhDcO64BqpTClgvbRsFPoWuqi7CAH
GN1LKPfjaQShgL/e9ELrzQpMGj1nHrJC2e9MGkJes9oT6mHNHCVO1HhNhZJ9jRfkHNTUaQEgvmH7
mclXMjDB03nbFKx2tP/xAfmhQnWw15JxdQu9I57IzHX9iQwaeM0H53jSTPIDJNqlwhuoGtTNoeqx
+Lxphis5fj3eZ7lqlmJkIb6ocSMW/b4bDeO0uYX12vMRmr5UKnla7zS0J2yUU6Vc8orhzoBS9ZMU
Be3IFRhFDWYXg9+owNNaeMfZchow3AbRJaBG95YzBiXafzPzFOfYvczSZabFX1jdSWj779SIB22l
wB8bAczzUsiDLBCG+NXqEsE8yYqJCuBwIFkJZDrrN+gku70foc01QJXaYMbTldRBVe11Kq1AGewD
tczWSfHCHyjPIsQMF4+Mu10rFM7iKrUE1l68Oo4BwsE2lJ1U3X7k/mbIjL1dnk52MAsiJe4iE5FA
t7UUFYyxpN3xoY3QYgHu7Lmv6/tub8fWk3mhzgb8QZGB2ygY2sUsB0PEOD/Y7JJemLQte51mxzyP
6GZ8uzi892y/3sZdRZle4IxLaXfwogp+JkrpNmg1M46XXsKlYbN4c8ku7fktlPOy3cFz6uIMoyJF
FFv+llbnkNKujqwWhEWwOw3nxhv2xf5aBlNCSc1eDxruUyZPGy7qM+uYJ3vCv6kP19wspFvamYfy
TYIBW1qrXjmP7soIpylYKwKGcwKCU+gykyUvq0EenJl2wcofAnBsFZYZ8uHkSv+RjJb5o/0heUaB
KKVcH/Fb0skMOJ1AEW7ujD7bfzkXcmCmLj7v7EwCikyVdin2jv3H5CK9xZUx3DOJRpnQpe+bHCcS
gdVQLC/qBMvguwBG/i4FszdkBmGuvsK9JJO7b72zkElTF2RbP1oHBXakbt3Rtq+tukZxxFUI11ja
P0eOHAQbPsKpJmjvrcYaetLV9i4dLrwGAXS8KD00c52Et6LcOwlIhfO8o9iTa87oqO/soB6hmjal
DkS/JM6Gb9+4E93IyZ8K0ZAwTLxeHdd2oHfVDa26zEXTfOxLLJUMol/l+ca0DHmaA0bPapw6jLmv
X+wjYSBnaGjaHrex4+zLpD78gZGw6bLsZ1V0T7zth3vdeCNbwd2qtTTlcy0iKOvS6JoCBlsR6vYT
oEQ1B6ZMicHQBIJVznCKbJhFY+v3oCHLei7Sdp4oBgh30/RtqGmQxMpZ6cJFqzGoWq4BEM466M0y
6l0oH+MHlj5BJ8pEBc4LR6FL07XgccLUeVh5Uro2C3hmo1cLF4CPy9cDenLB2AkXFaUnFQ/ifX2L
IUiOPsUO+Kf/lDn3/2ncy3Xnh/AbTPXRw5CMDG6Eetikrlccvc61lRqCyU38TzDAYmuHe+kCZDLr
PPNg07YfJZgcPsFeBXI8JGBV4yFnZEiyo7IiVsl7iu0MPwnstehxFSPXBBrYkfGXOMweyQ8Xd1sp
rjfb5fd24MpIvZMZJhnlQsRP483arx3ii5ECBLBOquOTy6gYM7qf2Ms86mv7f0TcrFOfGlDhShZh
S4mdtnyUk9yBrFopTPrLPQkQ3wcGh8ukd+Eg5asTXlpPFUSNzgzKC/JTAR3/b45dPwQTiwZiopAk
Ol6j8Dqq9DMrA5tcvLXLE+6Mz5G4M1fXJMf6agqLR84D5NJEtg+N60NR6oHOIDDM9r9hxmSrHESO
L5EJRke2GTEt7/RBozl5YRocLfPoUx60TgW7Ey8N1h+LGRI4oQGIWNzIJsC1zWvuLHgiBVtIwnYL
j0p0/SZSUYPhUUFkTBZY/Ox5v1/ng7Rznt/yy7MgcdtMiPD5p6m4gump8bgMZpzNCAoNuW+4q4Ie
GUnDI3l4nqiIPLEKJBDqQw1h8etZz1HYgNsMbjpcy29k/e6t4n22H7O1LqDoJvLk282GceIhDa2e
JFOZt3aOA/83kGydEKVlXpwfIMLRst0gq3jasLqs2WakUyEAZxJQl9KPv70MgONgZDf1xMOKKYaJ
l4GV5vLDdZ/3cb5JYMiTkYo2w2xJ8iZNxnGIoDYk21S8UOTS2Sb+Uzur+Xi9RSH/tSo0UiNbRuOh
J/DJ1F1XIx+Vn56vtxhdnv5dOSlDvT7Fx5PHGSgoIX+u/QfiYM/E9A5QvzfzKer1s5+zb2ODwikl
uDE9e4sD8pFdgO8luCJqjaLUaPKHhgf8NgsnoJ3DVNKjtretCgMAH1xvEFupFgrdzY8sRMcO3FZu
UHHqfZ7F8TuXAFFhC0RfOYi3d78V1aES76ND63swvS+9U8NEW7crZJdtCDsV79U3qkrrDm1WIcXV
657X1MLctIpnR2+JUdXiZ36/5sx6v8oFp7rWtj7jCak8AcXlnkrrj+ZYIdL+9XxBvKKIyqD/QTnK
WRYhOIAWkCwI/qgbkSOjZdoR01ONNqbnyf62n3qMOS5sU4/mJ80TEX8e6zqTnlMijsy2iN2yCYOI
zk3tOH8Pzhd1l8HX3HlXA/9yKvL57Bk9Ug26YcrpIkMIc1un4fLhKf2oWG2qq438Z9DCbfETEb8d
EkbGjOn1eiNbCR7qhY7vn/Rtoywi7M0sBul369uGeiUGkHa/PLdKa438DrykSzJDNSkGC5S99T2u
F0xylH4nUiTSjjWs/I7eRAw+Oggu7hlWqN/hbPUCP2UXXf5chzdDDdb9yqRJ6hnryONrQk2UwQ+X
3Wh5appXo8gZVJdXpANZBpr1bnNkf9eUNuC87f0gGAvQf7OncEE+7WGFNFGPdgO2Yc70m4ZwJx2/
+p7LygydtQjQoFG1YUKWIBbYVusAu4VSgChXSeFMyNuqr5Ws58DkY16TeRGwP8+J+K8x9FpLYQVI
/fpxPv7vvBhhwNJxUs2XmTA1WvjR3C4AT7HTYEM8d6q9PNgScexluXvudhTbkrorSoPXhusuIuk3
s+jccmm84MYD3PNUv2i/H47hqtg//XSLNcQEExPcuoj8pKtNpnCRCOoTG+POEKkuY0xDtnakE8q5
ejfC0rrBbKje6xsLU5/9RcssUPq5k1WY5TBzGA9fa+II/H2IwVPRYXB+xQvvEqPoq3OOf4avwEpd
laGHM6gA0LXHn5KQrN9n1FY/yyYz/6ZbVCwkXRssCYegHD7fV1/80haZD7bgO1YiyPrzo0sXjtYZ
CDT7EN760SniRMjXIWLBMFZbGKDxXbzDarfZdcgsj+D/YqTcZdQjqxg5Rzog6ij9d0a2ZRkRtqpg
6cwv1hlnfoB15MwLuuez9NViTy8MljUJeY3UOSIA1rNxETFmEzulv2bFBdoXrWNh+qxzpVgvoxW0
xJ3XfydiOLygffQt1pA7EcHJEHSvUmL3zg63uxQ5R02GMaYUFtxuhDKwx7vIX6DkwuhqP9Oi94hh
lNf0gB4/PkxGjqLBtBFGWEhSOXZm74lsNNSrSfW7wJXnOUUPTJQz+Q5643OKYA6IIFzzwB09hXQj
iF9vj6wrxQSZh/BNufqrWS48Fry/ktcDxkwF7vdQKApW6aGY/SrGA8JVsprJVA037Zp6p+z2LbCo
aG2C5OdpodEDXs5ebdCCqM04D5ghVUv+x/qTNFTCK1vWw6C+aGeK3BnLAaHSNfcEdM32fpP/b16Q
ZjI97HBVTMVpfd0vrQ0NUdb02oK/WOBMnFiHLw9HLlUW8xMf+GQB16dMi8zLFUEy1+8vffwjeBm9
Rl8hVGnFjO5V9ctQ6LeFhDuL98Fime5n6NxI/dq6fhzdNqXZB5nRdT1RVKAvAUyH5SJWE7MxNvGW
O9bYWeAAJ8YwcKk5u42CcgjJMWpD0N0k/iRmgzp/V6YMePgZxau3oqVXy+FRIbOpJq7O6vobOjAp
qliSKDzRMTvVriD3SIybUrwB+mnGIFFzUZ7aeK5Rs+3W2g0z0Qx6NyXx+2aKTOhydcXH0o03lp/1
wHqT/ER/5Y8BeN/tUo7jCpbUgmrbuJ2phphmRuFQOTvqbDpr0zJUJO5LQouLZd+LHSoiulRkEABc
c/0poRX7yVozlLKbnSkU2791XBJcH3B8ZNLGsuklkkX7cSllz6gyxrp1pb+1dtNMjZX3oX4+JUTo
3eZDIwn8Ztcz+oRaaJ2/LyAFrKm64oPyxHphooUHov8vVNqpOte3lZY8/2/patGFnEp6152wPgMx
5wBUJ5ikpF+OJdwjAGzMeVcIgWkXL7vr9NTBEVVQChXoSAnWRIykarR6U4nvtneIjESCnhjHWl2X
n7Cmffxpp1+Bpym6EizbCU1OFbuth1LzDFm2uVA8Xb851K69M4kWd5UXHO8dFgMkqG7/aQXrUHjQ
9BZlrNBCLYOgpnDIsxUoxkgZyxPGx3FxzWJX+R3xHYYWwmkANIV+x3gUGVhv6rdPl1VXyfONzAw2
sbiOaEFI5LbpYYeC5cToejblvBtWOriRrl4aSt7wHaUd0FQA79CDh5FcN0J3tmv4etachwiZALB4
Lt2pH7QqnaE1d2WxIxRo43qggc1WXx4sTwuN5BpYgU6RpzdubIIaJiLgSrqIjN3gRWT8q1Y886X9
kwPXOyFhiP1J6pJhWAYrrrY+3UnnT7tFIDjm/FMd8Wpm6HWyZXxve066+3IUdMTZ2rgjz9XFf95T
zqGpmNQ5wEp+1noFdip4O6jRsul4khCc/ccVBLeMKHPBfF1U5QpabGhD13BliLVLikTUY46v7ocO
Ln8wvDH0nmooxp8RQ2s0ckGXhJkmtEjalVCgRfdyWjyG/3NIyoHKAJPaIK0Tmr56P6nBk5omI6au
mmcXcpqOXqrCbw4A4y2xYTii2UxeLEB6uggJLtfP9CbMPtvlaexTqEwmLQgx3vrG8D7bZxfxoltn
1yhOe0wUjmEjZLDRCBh7dmSi3Auq90A5tEprN2zzhPUq2NYEOau4oCD29X/tI2vPmhV9kQ7jOr2t
Tp/ZjKn9CAy5t2FpZlGbGFRRNkxKT8TVKMOvi8FkHCbX9sVA/AkkDeiQ7C07zziRuv21hMZV2iWo
AeIPQxk7avWF8KMvwK71+v1hqj5PFH5/3gDSH+MvCi/m6uHltedfiEAvOLXnBHXYat4gMHG83eKT
z0gT1vtwvFghPSxmwh9RKu7W8jmjhKAjRRN5VGKMeDPbBF6UX9xSRzfVn65jI/h0VRopB+n8CqQQ
Hmej7O0ErOA4q4fUn8wgkxnJEuA0fCQJm2mn6RqkNHq44iKrwHkNAc9cojeghZ6hHFTOEHs4Ya+4
yJuhENvI7HerVAzlTIcdwTLq2cTCiQNjm4/u/OQ+dlNPtNdHFJMKh2fest0b/GOVLoamsutua5wN
OSHfyT2rWi8PP9hjMoIl99t/KHLFVaUt/GUtoJ/yclYLYSV4yzLzyySESDsUhhK7X0wvTzJaiHhE
D2cPloIxo/fyM1LqCWPO8UcAwWqZ7/LqDJupydaJDZmYYE3DZoZG1ubuFHdZHP77i59eeYzEv22H
j4nn4wrRIscSR6zpYeJalSFT1VpRyowXPKt0wcmw0qlAMuv3rBxiZIWxKU7r3oA2zDBYEQzGk/tA
6nBEy9UdfuRai+97gnIxp0YW6q9Ycem9Pnv4TiitEZzO5WP3ebvVqS2baKCT5gSX+Yn+m474yr3T
xds5HTmQtafssfn4ctpx/UXA/ewatAsg8inQNchUprMGKD9lQFSWlJzGbGwiiEZ8IwZbKaAxdxI+
efes+QpLQtQnHrgkWs77rDgpkKKDaxMPkHee4P+JqCe/h2jvgKSJcdqzlcr6NDxuNmlPpTO6AbSY
OvDT6X6JgJot6iFi2Ggk96d1/tX83X4WEo4hryb0/N40xvzkmWlW3mxdcdVmGC7KX9E3qX9/q9FK
cWDtXQYOC0NWBXiA53PbeB7xzt/bMV5LZnSxBUZ52qyjSkRvy8RJfCFsO3gH6okfG8kKzWYCFhmg
+jbZjMKte8EhTgDqY4q9iEWpAIm79YaeQ/h+WWNQqXJxQAVru1ql7kRerv9VFaEgPvkEiDrrjRwb
najB3bfP96fpRoVjXOIOah8IjOAKWg++GLiW7MrBGYY2wWAKq2h8JOU96CWjFw/KFfk14QQN5kws
XSLC6RvkPAL1BEzlJoF0fLcG6N3aXKeZN5v0XdzvOgUVXJt3uBmNvbJ5Usa51Z/T8UoMNxdQxDSx
fRergD6SHg4HnV+e1xL9vhV/5xxSmmwLOqfsqiybtal0IAFk6+jDO0GQ2AOrpv6SSxowY/NO6ZYt
zLq7tKU/P39vDfWA5ipYwHmWFLDmYoy2IsroL93Td/gbbFBqRYTEtt2mv7zT81qjqawYNTu/LmcC
76fg5SbnafpRX1L8sjnrz43j3ANAJqbKt/0iTxc26xpuaL5uqed0uIZkIF62CCCLN+BPexhwXuia
ICQg3Pd+6KkWyBA95Dgh8/2W4tk50NE/eywDhIm+xRt4JxWLb41Doy4ukUEqD5mx5aEUSWTkM9m7
Rc/8KkqzKJO7c5gH0ZqLnKthBVOQb9S52SwO8MU1ijOZz2ZGWCzYksBlKXK0hwm4gXbmSW4c9lyP
/Aov6bAhXQQGoeCX9YYvIBW1azGQ7xqbljubUCMvnn76DTOAfRRBuM4D5YzsBBt1FFlc0+T2vBe3
jJhkOW1Jp9bIDngd+jCgT2yAaXqT1CROERCIn1EH0bja3J8pN05ax9hfIi9nbKVJdsEInLv8GgUb
4jmy1JD5mgGE2pxw0rSoZda+htJO7ilSmTZ9FgTHDiL/zXGP0agEuo5ZajEhcCoBTdoQYggJR0SK
MDQLk8DuCvIti2B+D8f8Ws7oR7JiK99lKiQxc+yquugPpJNHQ2/o5z0wZJZFpXcT6WsojsPfjEl+
sz9k5aFLbduszVHbcc+kppaK8koKYzFCOoAxGbiHS1Bc4NjCM8WO741NvAFQg8Dz+Uk9N5cxD/L3
ZjLx+4wsphdgOqejPMXX/Uv2673byJ29HuqDj9qHJV07OgRVqI/Pm7XeQudcsHkoJZBPock5onMl
HUMwysahXIXg+eAunHuztZeEeyQBWfw40XKuwfyJBYUyF11SuzOkr6p1EE8OrGJOucGhZZHhXMJd
ypJx8zdqXyXoMFHPps+va2SdRpBZd6jlxdXb2wnO+KQqoA/CL+sSyqlR9rlTihLuH2ibISEvD2fq
W3kHoqRMbtGw46DXJPAe6mCNHy61APl7hOY1CvQnOA5fza173gYClozqgJLPW0XoJT5VU71pp2IE
7sTg3Od+EpnfyRvwUSgQhB3vVmWBf30Q6wUppSZw1lM6oGuOKnvXECr3706KeP9xc9OKGB4ybCe9
/zetoY5k0AKmC5A+QwQfiPZJIowOFcB7Ba3Vn5O2e9aU1Un3VRICMLmly/nu5NOWfmBRdgEsrdEe
nFvJ4dx43vv7CIdeeHZmDS70eGeGhYosrmzdSZIGByiOj7nLwLhynYbl3WgPNMkWwJstDWB06i9a
ipR6Hiuh8ZNJQHxSJXBQyRlSN7VbtKdDSqJipbQxd/G+ZV15bRP1z3owEoJ+yIftxeEQVkHRcgge
GNEJXG3OZnJWEsIk35vAOC0uVtG5FIK976kdZgo6MRoAFVqRqFZLbtTfY5pl8qtWRhPjdz+HI6af
a1vTYEZ/6TrMxZDfREl3OHuxfmF+Wr0iZFt/ACm4Ar1eGi0R4rwY7fSTMaRJVMTKWCvHULfRVWlE
dlLjz33LB5LfYwlHUBAMKGnR3hrYjVNrZc+w6i9vT5wsRQfenvDdqu6u6ifV73tAp7mT+VcqZtFU
rXwfu8fbeHRauqz7KR/a3eMlq7un+1Glp1H78YHcVvOTFPYp+B0rgLGUy9Mem8LReRvrpyHEWnYX
FDy+e3Qk95u5IRgjxKeHc4WamgbePw5nV5QdgTifoq3SywTjl8ZZQ0W3LMT72JrsRA9ubAGUVjAP
RRjuZ8H2Z+zy/DyHKUGzYMzWsyQuk+KYqsMkbQLK25lQaWyMA3ZPUKx6CS7mINnsypF8lWg9QIRA
Y9MpuDwR65A/YSqZCxOoELwVBzxLUaE8ApH007hqcIuql9aBhKZGMAopPkJB4t6a93GMnD+kPKKP
N5L+9D3wXfW+H/fKP1Han1cXfy+5JAhPeCtFaRlwOHcMH6kZ+rtPO9l2kgZB647udO32NSFEoD7c
4TFY8gq+se9p/S+SFy2gzL2OXWbX6KsyVrQtyYAD07Kv5ePPpTLULxrf2Cd27KjYF/sGZZdRqChM
ZoayVxhZYzu+eIPxLgeu36S7VASJhdlW0217L3UWQWylxe+3G1W2QOtjAahFB5rHmwJTGmptn8wU
WWpx1L1Vq4NgjLbUlXOXP7qtJURJKZeeuh1bMKIURjTmxwfERPq4D5OLJEwfJ74ymQ6p0qMoYRfh
FECHZjEQuXwK06J7lTgEgvyPFrtyIVK9Fes+NhxFUPaVFEAXV/yb0zKhodTw2wjsdr+9YgV1ONie
lsuqyeUdyMySZeezEq66W0kLT4JPZMDYM3qJ+FVOyKACs5+KilHPOkkgP9250aAe3xwwtqYesGC9
eWCk0C5GM5Fb0Z7CMEreZYbsIZ5TpObiccyCz/G9iIcbxDj+JafWijSYLEdiKMC15T9cP9lZZSzp
LrAHQDIjGudzXrsHnb3N14pzjdsiMOSY0ql72ubb2ph/3pVQVUzHRJYk5mxhQjW/EQGPkUhUtSo8
23jpxAU5URF06EkGzHqUxYr0+mSwpFxijAupTIbXSS/l9Or0uj5oROlFIsUQE+pk1pxC0FEMwRsZ
vt8pdcyA7DL8MA7exKIJcc4jMnis/uwSY9MfuWTk/BVTfX6R5qX3Fw5V3C8J16ZYF3up5SRMHwvQ
lkS9tNu8MFSMFZEZbn862h172GmT8DqsVR+HDekeuo/NhN3B6N3tm9aOhxe5Zgi1qxVkwC6PY6rI
nOXxZ7xidT6+eIWt/r+4IMt2xVJvokNmEFPDcq4XN49q3EXbbjPAzCElUj6+Fs49JNQqM5lSe0fg
lNoraR0HX3G9bhU1Slxe7DFqH+Dm+yerWfBVMYzGNH9VIQFHvYbKyMs7f82AcoBpTPlGJ+dvgjxZ
JYRA+mMZlfMcjvxaSdzGiFeOnt1XDN1xLCmiUgxrcTwJXcmZrNAMmteVSwlS1J/3tLdri3CHELEW
zQ/S2Kt5OnOLIKV2hhSp3JlbT3iLlfE63EBG4QsXfPVZjZzi+CcjswwFXVUoip8sa32KgaUDa552
Q/QV45zjJZl1n6rILDzbDz6cpUvh3YjKFmTCNLzalKQGkgbr3cDSd6Oi/80HZPwHChCxNA2rw1s0
33c516MshdgKdgk4d0seO27tvOgdnMc13O6ZA28rFL1TMYgyI1HdZuegPQ+HQ8BGy5b6qfPdjZmR
LlpJ7wR4gB2ZSPRrsQwrTV7euiwN14a0nRUWbVV4soGuNlLmNkNFXEniyKsLWdvyHMDkhVQHoeAi
iqSFfflMgMbBhlkdfC8R4K9sbCnBeAvZAZnyVJbXgDNj9jhVfx1us3Ho1v4RBt13EDf13/R+VVTQ
DADd6RXlCQYIa8UPYo1IF8njhZQCsB5HOCL2qnRotGLXutqVyyYX1OEzlOBjPYL3z4CqyTrAOv1v
3+XY8bD5R8koXQR8JPKVaOyKEgTATGFSyCyD7b0iSqgR2xsGDX6UJLxbJHaI3HQkK+Js/jCCH0QY
7YtJzsy59rPdxsxvd/AEj9EF+zSaSuUYEa7vj+KB1WJob7vwvVuoJIRI5E8DGe027/4JdbrixCzf
IYYOFoc+L8sN/I6ZtwXSuTHJu3bpgL1ZXi7UOJgoZv0Xpnc+CflHOCkEL99+51yOQu1LVrDKvFyH
JUKgt9XgzLtsnVi5qHPiunpEAvH2irNz3fk7MY8BJ/SxdXwtERzKn3MrL91fSNjSay2HaGc0r9T7
/2GLmpiOi9kfAWuz9JFfhtNAghYd/oJi8M8Z7QceTJUvEEBBXJQR4gjY2GawXuGurCS1Qklou1Gb
317OOdLy5sY8feBHIKciE/h3PNlWKx+oj5Bu7SPR+iMaxKOlwntpKiOQSbKOok0QJSRDHbMF9zPd
DIN26S5bExlyzlYGr/9rRyUnxgxuIHgO8natXRaaDBtH7hWbH0yTJIjiPnWr+dreLvWHYDgQXrDv
9COY07n7ZGMkdg6RT9NQg3fwOcnPSHs1D3Be551z3SRlweZKe6CiWL2lFNTszOns99mpQLgst47A
d0E9nAL9iaHvsmaD/OlMjLUgmkqSLDScB0yh96Knh80TTAGc7G/Nc4+ACa2hejBU1gvO5VJbk3sk
rDVGyhv66f/g3689dhz/WcXYUVY0z6FLNzs0yyL8MA6VH8/q7sCuADGKxE3ZXXYI55LeGi8UIWE/
/U+ZOo/sejah0w5SqMVLnZxcFCfMKD8oPrIaASPtyqJ5BYHapjIfpGyzD1lpRHpCzwWe3w2+Xy2Z
Xir4aqGzLe1mm4PAVcCdzv3Z8uVmRuZkp3mWOVVYWmD8NtuK2tcUKh/vGBK8r4G1kMm4XAPID2BU
1489VCs1Su4uCms2jEnSl96eF0B6aXHBMJBFyZhWumogi0mci5BGYoAWSHVTgE2dTzelYQWPXC1z
jdAAgHP+Dwbx0LNzunQZxnx9OYaKoD8X3ssx3Oo/fEZPCoffgd+c9HiBsiOvwU6ojuZZnCSmw3lF
uVrNPe4hjP/9g16D7TmUZNlsVC74aAbHkZuAi+PHfH8u6e3Q2gL07tvFTHPckYbtXwm3Z5cXM14G
twA0kG8ZPG3mwFoyYI7+hSTqU5BkqnwD42HkhhmehRFk+/WWeOgz2bwFGsFgWDM2sQ+DSLMfEhu0
qoYWfW3s5WJYAkRNgF7HPna2JxS5oGrqozDgV8FdcrgU6P3A3H/REIfQ2LBiFNSP85ZqUlL1+A30
tNi+MV8sS0FJlsi/koYkHBwzPxK7SLS68Pd7PvzbZ5Dro3RAiZJGKbpILYvvgzxNEj5V54bBLFEj
rcrDCbYjdTx2lt5yDfs3qoE2KAjsL44U9MF2RX1IjELynfLGiDV7oHX+/FuXXKgWlJGY6GjnY1Wv
OpFOqSdwifb4WaYnAr+BtrPjmsAYlMUh9sTpprLq0zQjYe4/XlFgPYBxeFnPUr85rEfXXnSP16Z0
aLD3WxMB4+MnKlIM3C1J/ZwlsWzqdo47XIwsowZIS/ppmn7wx1oLTfO2Xqq8rk9VGhfcTm33RfjQ
Llh+7mJgtz2Z8txZOZ6uPgEvM42nn038P95UEs052w+r7rgSrGe0K9piH5XAHe59LrXhMbNKtRd6
ss3g8032CS1VShaObAg2mJzoGXbtT59U2/a/7fezpr5HBFjHrXs58trfyRz6VXCKnpP4AIMf5GVj
9TGEBa1JOkR6t/qOqAsWqIwtVnSkYKTzzfDMqKobv+pq5f7p6JR+EJOozkoQJcGatNSBZYTa33fb
5LZeLF1GoDPBRT7pMJ33KQP0MICvD6DWQCzXxPwhw65IbPVyxgqWelLeYfRMu4FV7y0Ov/aP5SNs
EEL7jSCeWD/zteENcSICZuKuMSw+9eLAUYheMksjC0P+FGomwnwcUnJHHXq19VLSowTcbsnDsBR7
psPCavl4jlET4WzldmtR6+DxneqIOcOKDDlTG8QRcmJL8R7stpzfChBxZPdvfnlp1JN7868r2vKo
BIuENEV1y2vNpeF8j/KuiCYLi+oSfRoOfHzMzLrNq/L7MJo+X6HnvSRiEAd4Fl6TLpWJefyMxKNF
tF53CSX38HsY8cEVHFuGffAh2YFq6Sv603hpE1O/uJUkEAcsX/c5zHnOF/oo1s088WEtQ7zjEepB
g4+N/PPUzz0il21vGBXYw2K9FfgW6d7uPRDA3SZbt/xscNb/uW8g9aLfb+SNipCbu4WvvlkwJDBP
cV+Z0CpqDH5MPNTN1fU7iabcOoPitBAj9pz2foONWHR54qO1y/qegRUUwysJeIhi9G2hSIq6FfaQ
lKuCwTMB5IadaFaJrEc+HCJn8gP3asoYNSItVzx8W/nhxx+Y4RNv0PQDk2NQN+TJ0HYnLeoQbqO+
VTzlIQZ0hqEV2f2dZ2+IvD9m3H1jqzr2lpylE6cswz/FWU4NyYevxAsq72V3u+xYGqEg0/Quupam
rmxg7AkfX1KCI/NbTAacIm7sLOauKr6ozebWISK7v0zinPXsr4F6Rl5SeeyFwCFzIr6EqaTtGd3l
9RSOgUs1r28/kcDkAWeVtxKrBVP1ODFXH4QY9eQYZB7WIiayGJiEMt+YixJmBfaLkl+bFioz1apG
tgbasU4XsC9fMQE5pYc32Fom1CFFFmPAlgT+fLRQ9I9T0bTEwVw335IMB8a/xpAyRLeSzTM5r5aG
s2sSfWdDXcKO1/vhqdeALI0RshMB29DMcFlBGRFlXCQ4/jpC53CKMh+ARybsgK/V6Q7LNkwG7bs/
vhrYDnfGTl5ZkUBu8nav/YP4sj5RmRaOW0G/49iDblwTjlI+IsvRLS8Hwmnpg1wnw2B12B2UB5zs
7ahS9VNAnFDiBzKxz6wXxM/Ie6hxi5ev8qEE2J/GIdmGMxcBy3WBrRHqvXYAltm0Ufi1MwePotS/
Fb65S9DInOAmqrmIhMP+bq/Lg+ZObCPy8Lcn27pFaXjXgmN47DZ9Qw0EscBEBrHP55Sb2SG6uC35
oJbNUkXKVhNyRFyhebYWHpEmDyd8QNSRbRI/At6p1Z4pXcE8AMhXkL/6SZtyFmfpKXUVZLw9+1/U
XCZ2AK+20r/M0SN+DYd7/giPHtxhlHY1yYFAqWbSYLEM7+5X6NQ0hVpIO7DWZFuaAIkPPJo11FXn
OqEYjfsnruEkMn7Ep+alp/PcuHiDodVQ/kv/VvtGRPNeZcbi2nsTZNAmBSyLjLcI31++6JZYaM8d
7WdRh8UMQ6y6hRHu6CBq9lsH0Zjzr9v5qMsXoYp9IP46xfDmP8pUoVRalbonA+45UZ61xqrKax4w
3sNWlxp1bsQQGXDer5qYcMgojGKyEKLvabp/p2fxXj7TF+epujBlhLupIE4RmlkeDelHkVWNLxA9
Z8vYclTZCsdw+pVLE7emBzb/Z9QzlJS2sUvgiLMAD2gEvxlxXDc6mozSuhiqmTpNt0MGheoxsU5F
h6a3uJ2Lhi5ZxYGcLQzv7nUi9mVLIX/ABVG8mbu8PFeiTwGVmK0BRuKAOI8QvSN77xeKhlCS
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
