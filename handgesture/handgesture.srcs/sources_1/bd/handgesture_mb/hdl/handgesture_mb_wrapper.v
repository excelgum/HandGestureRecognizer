//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
//Date        : Wed Mar 27 17:23:27 2019
//Host        : DESKTOP-T5PLO2M running 64-bit major release  (build 9200)
//Command     : generate_target handgesture_mb_wrapper.bd
//Design      : handgesture_mb_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module handgesture_mb_wrapper
   (BTNC_0,
    JC_0,
    clk_100MHz,
    gpio_io_i_0,
    gpio_io_o_0,
    reset_rtl_0,
    state_0,
    uart_bt2_rxd,
    uart_bt2_txd,
    uart_rtl_0_rxd,
    uart_rtl_0_txd);
  input BTNC_0;
  inout [5:1]JC_0;
  input clk_100MHz;
  input [1:0]gpio_io_i_0;
  output [1:0]gpio_io_o_0;
  input reset_rtl_0;
  output [7:0]state_0;
  input uart_bt2_rxd;
  output uart_bt2_txd;
  input uart_rtl_0_rxd;
  output uart_rtl_0_txd;

  wire BTNC_0;
  wire [5:1]JC_0;
  wire clk_100MHz;
  wire [1:0]gpio_io_i_0;
  wire [1:0]gpio_io_o_0;
  wire reset_rtl_0;
  wire [7:0]state_0;
  wire uart_bt2_rxd;
  wire uart_bt2_txd;
  wire uart_rtl_0_rxd;
  wire uart_rtl_0_txd;

  handgesture_mb handgesture_mb_i
       (.BTNC_0(BTNC_0),
        .JC_0(JC_0),
        .clk_100MHz(clk_100MHz),
        .gpio_io_i_0(gpio_io_i_0),
        .gpio_io_o_0(gpio_io_o_0),
        .reset_rtl_0(reset_rtl_0),
        .state_0(state_0),
        .uart_bt2_rxd(uart_bt2_rxd),
        .uart_bt2_txd(uart_bt2_txd),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd));
endmodule
