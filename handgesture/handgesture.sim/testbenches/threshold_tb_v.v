`timescale 1ns / 1ps

module threshold_tb(

    );
    parameter THRESHOLD_VALUE = 10;
    parameter NUMBER_WIDTH = 16;
    
    reg clk;
    reg  [NUMBER_WIDTH-1: 0] in;
    reg  in_vld;
    wire out;
    
    threshold threshold1(
            .clk(clk),
            .input_number(in),
            .output_signal(out),
            .input_valid(in_vld)
    );
    
    initial begin
        clk = 0;
        in = 5;
        in_vld = 1;
        #20 in = 7;
        #20 in = 30;
        #20 in = 40;
        #20 in = 3;
    end
    always
        #10 clk = ~clk;
endmodule
