`timescale 1ns / 1ps

module filter
#(
  parameter NUMBER_WIDTH = 16
)
(
        input clk,
        input  signed [NUMBER_WIDTH-1: 0] input_number,
        input input_valid,
        input reset,
        output reg signed [NUMBER_WIDTH-1: 0] output_number = 0
);
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg1 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg2 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg3 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg4 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg5 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg6 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg7 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg8 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg9 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg10 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg11 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg12 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg13 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg14 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg15 = 0;
    reg signed [NUMBER_WIDTH-1: 0] intermediate_reg16 = 0;
    reg [21:0] counter = 0;
    
    always @(posedge clk)
    begin
        if (reset) begin
            intermediate_reg1 <= 0;
            intermediate_reg2 <= 0;
            intermediate_reg3 <= 0;
            intermediate_reg4 <= 0;
            output_number <= 0;
        end
        else begin
            if (input_valid && counter==0)
            begin
                intermediate_reg1 <= input_number;
                intermediate_reg2 <= intermediate_reg1;
                intermediate_reg3 <= intermediate_reg2;
                intermediate_reg4 <= intermediate_reg3;
                intermediate_reg5 <= intermediate_reg4;
                intermediate_reg6 <= intermediate_reg5;
                intermediate_reg7 <= intermediate_reg6;
                intermediate_reg8 <= intermediate_reg7;
                intermediate_reg9 <= intermediate_reg8;
                intermediate_reg10 <= intermediate_reg9;
                intermediate_reg11 <= intermediate_reg10;
                intermediate_reg12 <= intermediate_reg11;
                intermediate_reg13 <= intermediate_reg12;
                intermediate_reg14 <= intermediate_reg13;
                intermediate_reg15 <= intermediate_reg14;
                intermediate_reg16 <= intermediate_reg15;
                output_number <= (intermediate_reg1 + intermediate_reg2 + intermediate_reg3 + intermediate_reg4 + 
                                  intermediate_reg5 + intermediate_reg6 + intermediate_reg7 + intermediate_reg8 + 
                                  intermediate_reg9 + intermediate_reg10 + intermediate_reg11 + intermediate_reg12 +
                                  intermediate_reg13 + intermediate_reg14 + intermediate_reg15 + intermediate_reg16) >>> 4;
            end
            counter <= counter + 1;
        end
    end
endmodule