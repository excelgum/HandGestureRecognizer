`timescale 1ns / 1ps

module lut_tb(
        
    );
    parameter INPUT_NUMBER_WIDTH = 4;
    parameter OUTPUT_NUMBER_WIDTH = 4;
    reg clk;
    reg  [INPUT_NUMBER_WIDTH-1: 0] in;
    reg  in_vld;
    wire [OUTPUT_NUMBER_WIDTH-1: 0] out;
    
    lut lut1(
        .clk(clk),
        .input_number(in),
        .output_number(out),
        .input_valid(in_vld)
     );
    
    initial begin
        clk = 0;
        in = 0;
        in_vld = 0;
        #40 in_vld = 1;
       end
       always
           #10 clk = ~clk;
endmodule
