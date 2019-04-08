-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/handgesture_mb/ip/handgesture_mb_microblaze_0_0/handgesture_mb_microblaze_0_0_sim_netlist.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_microblaze_0_axi_intc_0/handgesture_mb_microblaze_0_axi_intc_0_sim_netlist.v" \
-endlib
-makelib ies_lib/xlconcat_v2_1_1 \
  "../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/2f66/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/handgesture_mb/ip/handgesture_mb_microblaze_0_xlconcat_0/sim/handgesture_mb_microblaze_0_xlconcat_0.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_mdm_1_0/handgesture_mb_mdm_1_0_sim_netlist.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_clk_wiz_1_0/handgesture_mb_clk_wiz_1_0_sim_netlist.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_rst_clk_wiz_1_100M_0/handgesture_mb_rst_clk_wiz_1_100M_0_sim_netlist.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_axi_uartlite_0_0/handgesture_mb_axi_uartlite_0_0_sim_netlist.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_axi_gpio_0_0/handgesture_mb_axi_gpio_0_0_sim_netlist.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_axi_gpio_1_0/handgesture_mb_axi_gpio_1_0_sim_netlist.v" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_16 \
  "../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/0cde/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_2 \
  "../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_2 \
  "../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_2 \
  "../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_15 \
  "../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/d114/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_crossbar_v2_1_17 \
  "../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/d293/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/handgesture_mb/ip/handgesture_mb_xbar_0/sim/handgesture_mb_xbar_0.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_dlmb_v10_0/handgesture_mb_dlmb_v10_0_sim_netlist.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_ilmb_v10_0/handgesture_mb_ilmb_v10_0_sim_netlist.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_dlmb_bram_if_cntlr_0/handgesture_mb_dlmb_bram_if_cntlr_0_sim_netlist.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_ilmb_bram_if_cntlr_0/handgesture_mb_ilmb_bram_if_cntlr_0_sim_netlist.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_lmb_bram_0/handgesture_mb_lmb_bram_0_sim_netlist.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_axi_uartlite_1_0/handgesture_mb_axi_uartlite_1_0_sim_netlist.v" \
  "../../../bd/handgesture_mb/sim/handgesture_mb.v" \
  "../../../bd/handgesture_mb/ipshared/a90d/hdl/myip_slave2_v1_0_S00_AXI.v" \
  "../../../bd/handgesture_mb/ipshared/a90d/src/cordic.v" \
  "../../../bd/handgesture_mb/ipshared/a90d/src/cordic_counter.v" \
  "../../../bd/handgesture_mb/ipshared/a90d/src/filter.v" \
  "../../../bd/handgesture_mb/ipshared/a90d/src/gyro_interface.v" \
  "../../../bd/handgesture_mb/ipshared/a90d/src/integrator.v" \
  "../../../bd/handgesture_mb/ipshared/a90d/src/resetter.v" \
  "../../../bd/handgesture_mb/ipshared/a90d/src/spi_interface.v" \
  "../../../bd/handgesture_mb/ipshared/a90d/src/spi_master.v" \
  "../../../bd/handgesture_mb/ipshared/a90d/src/threshold.v" \
  "../../../bd/handgesture_mb/ipshared/a90d/hdl/myip_slave2_v1_0.v" \
  "../../../bd/handgesture_mb/ip/handgesture_mb_myip_slave2_0_0/sim/handgesture_mb_myip_slave2_0_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

