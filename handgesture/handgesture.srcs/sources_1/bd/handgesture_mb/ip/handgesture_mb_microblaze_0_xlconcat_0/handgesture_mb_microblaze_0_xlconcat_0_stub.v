// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sun Mar 24 22:31:40 2019
// Host        : DESKTOP-T5PLO2M running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top handgesture_mb_microblaze_0_xlconcat_0 -prefix
//               handgesture_mb_microblaze_0_xlconcat_0_ handgesture_mb_microblaze_0_xlconcat_0_stub.v
// Design      : handgesture_mb_microblaze_0_xlconcat_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xlconcat_v2_1_1_xlconcat,Vivado 2018.1" *)
module handgesture_mb_microblaze_0_xlconcat_0(In0, In1, dout)
/* synthesis syn_black_box black_box_pad_pin="In0[0:0],In1[0:0],dout[1:0]" */;
  input [0:0]In0;
  input [0:0]In1;
  output [1:0]dout;
endmodule
