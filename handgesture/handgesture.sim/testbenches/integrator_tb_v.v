`timescale 1ns / 1ps

module integrator_tb(

    );
    parameter NUMBER_WIDTH = 16;
    reg clk;
    reg  [NUMBER_WIDTH-1: 0] in;
    reg  in_vld;
    wire [NUMBER_WIDTH-1: 0] out;
    
    integrator integrator1(
            .clk(clk),
            .input_number(in),
            .output_sum(out),
            .input_valid(in_vld)
    );
    
    initial begin
        clk = 0;
        in = 1;
        in_vld = 0;
        #40 in_vld = 1;
    end
    always
        #10 clk = ~clk;
endmodule
