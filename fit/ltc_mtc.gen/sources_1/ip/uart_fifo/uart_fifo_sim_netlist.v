// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue May 27 21:49:02 2025
// Host        : ANDYPETERS84AE running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top uart_fifo -prefix
//               uart_fifo_ uart_fifo_sim_netlist.v
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

(* DEST_SYNC_FF = "3" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "5" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 72080)
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
