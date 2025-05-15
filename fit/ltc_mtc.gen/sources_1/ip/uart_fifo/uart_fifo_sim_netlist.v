// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Wed May 14 09:17:32 2025
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
