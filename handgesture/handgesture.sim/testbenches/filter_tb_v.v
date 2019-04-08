`timescale 1ns / 1ps

module filter_tb(

    );
    parameter NUMBER_WIDTH = 16;
    reg clk;
    reg  [NUMBER_WIDTH-1: 0] in;
    reg  in_vld;
    wire [NUMBER_WIDTH-1: 0] out;
    
    filter filter1(
            .clk(clk),
            .input_number(in),
            .output_number(out),
            .input_valid(in_vld)
    );
    
    initial begin
        clk = 0;
        in = 10;
        in_vld = 1;
        #20 in = 20;
        #20 in = 30;
        #20 in = 40;
         
    end
    always
        #10 clk = ~clk;
endmodule
