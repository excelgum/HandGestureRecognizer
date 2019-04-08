vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/xlconcat_v2_1_1
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_register_slice_v2_1_16
vlib activehdl/fifo_generator_v13_2_2
vlib activehdl/axi_data_fifo_v2_1_15
vlib activehdl/axi_crossbar_v2_1_17

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap xlconcat_v2_1_1 activehdl/xlconcat_v2_1_1
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_16 activehdl/axi_register_slice_v2_1_16
vmap fifo_generator_v13_2_2 activehdl/fifo_generator_v13_2_2
vmap axi_data_fifo_v2_1_15 activehdl/axi_data_fifo_v2_1_15
vmap axi_crossbar_v2_1_17 activehdl/axi_crossbar_v2_1_17

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" \
"C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" \
"../../../bd/handgesture_mb/ip/handgesture_mb_microblaze_0_0/handgesture_mb_microblaze_0_0_sim_netlist.v" \
"../../../bd/handgesture_mb/ip/handgesture_mb_microblaze_0_axi_intc_0/handgesture_mb_microblaze_0_axi_intc_0_sim_netlist.v" \

vlog -work xlconcat_v2_1_1  -v2k5 "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" \
"../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/2f66/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" \
"../../../bd/handgesture_mb/ip/handgesture_mb_microblaze_0_xlconcat_0/sim/handgesture_mb_microblaze_0_xlconcat_0.v" \
"../../../bd/handgesture_mb/ip/handgesture_mb_mdm_1_0/handgesture_mb_mdm_1_0_sim_netlist.v" \
"../../../bd/handgesture_mb/ip/handgesture_mb_clk_wiz_1_0/handgesture_mb_clk_wiz_1_0_sim_netlist.v" \
"../../../bd/handgesture_mb/ip/handgesture_mb_rst_clk_wiz_1_100M_0/handgesture_mb_rst_clk_wiz_1_100M_0_sim_netlist.v" \
"../../../bd/handgesture_mb/ip/handgesture_mb_axi_uartlite_0_0/handgesture_mb_axi_uartlite_0_0_sim_netlist.v" \
"../../../bd/handgesture_mb/ip/handgesture_mb_axi_gpio_0_0/handgesture_mb_axi_gpio_0_0_sim_netlist.v" \
"../../../bd/handgesture_mb/ip/handgesture_mb_axi_gpio_1_0/handgesture_mb_axi_gpio_1_0_sim_netlist.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" \
"../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" \
"../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_16  -v2k5 "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" \
"../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/0cde/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" \
"../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_2 -93 \
"../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" \
"../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_15  -v2k5 "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" \
"../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/d114/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_17  -v2k5 "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" \
"../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/d293/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/ec67/hdl" "+incdir+../../../../handgesture.srcs/sources_1/bd/handgesture_mb/ipshared/4903" \
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

vlog -work xil_defaultlib \
"glbl.v"

