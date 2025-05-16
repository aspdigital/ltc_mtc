// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu May 15 09:38:56 2025
// Host        : uxrmdu0022155.tuc.us.ray.com running 64-bit Red Hat Enterprise Linux release 8.10 (Ootpa)
// Command     : write_verilog -force -mode funcsim
//               /scratch1/e40069485/ltc_mtc/fit/ltc_mtc.gen/sources_1/ip/uart_fifo/uart_fifo_sim_netlist.v
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
