// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sun Apr 13 18:21:55 2025
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
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE ALMOST_FULL" *) output almost_full;
  output wr_ack;
  output overflow;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ ALMOST_EMPTY" *) output almost_empty;
  output valid;
  output underflow;

  wire almost_empty;
  wire almost_full;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire overflow;
  wire rd_clk;
  wire rd_en;
  wire rst;
  wire underflow;
  wire valid;
  wire wr_ack;
  wire wr_clk;
  wire wr_en;
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
  wire [3:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [3:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [3:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "4" *) 
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
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "1" *) 
  (* C_HAS_ALMOST_FULL = "1" *) 
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
  (* C_HAS_OVERFLOW = "1" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "1" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "1" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "14" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "4" *) 
  (* C_RD_DEPTH = "16" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "4" *) 
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
  (* C_USE_DOUT_RST = "1" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "4" *) 
  (* C_WR_DEPTH = "16" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "4" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  uart_fifo_fifo_generator_v13_2_11 U0
       (.almost_empty(almost_empty),
        .almost_full(almost_full),
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
        .data_count(NLW_U0_data_count_UNCONNECTED[3:0]),
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
        .overflow(overflow),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[3:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(rst),
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
        .underflow(underflow),
        .valid(valid),
        .wr_ack(wr_ack),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[3:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module uart_fifo_xpm_cdc_async_rst
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module uart_fifo_xpm_cdc_async_rst__1
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module uart_fifo_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [3:0]src_in_bin;
  input dest_clk;
  output [3:0]dest_out_bin;

  wire [3:0]async_path;
  wire [2:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[1] ;
  wire [3:0]dest_out_bin;
  wire [2:0]gray_enc;
  wire src_clk;
  wire [3:0]src_in_bin;

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
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
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
        .D(\dest_graysync_ff[1] [3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
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
        .D(src_in_bin[3]),
        .Q(async_path[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module uart_fifo_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [3:0]src_in_bin;
  input dest_clk;
  output [3:0]dest_out_bin;

  wire [3:0]async_path;
  wire [2:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[1] ;
  wire [3:0]dest_out_bin;
  wire [2:0]gray_enc;
  wire src_clk;
  wire [3:0]src_in_bin;

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
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
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
        .D(\dest_graysync_ff[1] [3]),
        .Q(dest_out_bin[3]),
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
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
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
        .D(src_in_bin[3]),
        .Q(async_path[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module uart_fifo_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "4" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module uart_fifo_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [3:0]syncstages_ff;

  assign dest_out = syncstages_ff[3];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 92128)
`pragma protect data_block
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
W2dRtjY01hoYkPv9t9I4FQ==
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
