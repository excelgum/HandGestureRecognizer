`timescale 1ns / 1ps

module threshold
#(
  parameter THRESHOLD_VALUE = 10,
  parameter NUMBER_WIDTH = 16
)
(
        input clk,
        input reset,
        input input_valid,
        input [NUMBER_WIDTH-1: 0] input_number1_x,
        input [NUMBER_WIDTH-1: 0] input_number1_y,
        input [NUMBER_WIDTH-1: 0] input_number1_z,
        input [NUMBER_WIDTH-1: 0] input_number2_x,
        input [NUMBER_WIDTH-1: 0] input_number2_y,
        input [NUMBER_WIDTH-1: 0] input_number2_z,
        output reg [15:0] output_number = 0
);
    always @(posedge clk)
    begin
        if (reset)
        begin
            output_number <= 0;
        end
        else if (input_valid && output_number == 0) begin
            if (input_number1_x > THRESHOLD_VALUE) begin
                output_number <= 1;
            end
            else if (input_number1_y > THRESHOLD_VALUE) begin
                output_number <= 2;
            end
            else if (input_number1_z > THRESHOLD_VALUE) begin
                output_number <= 3;
            end
            else if (input_number2_x > THRESHOLD_VALUE) begin
                output_number <= 4;
            end
            else if (input_number2_y > THRESHOLD_VALUE) begin
                output_number <= 5;
            end
            else if (input_number2_z > THRESHOLD_VALUE) begin
                output_number <= 6;
            end
        end
    end
endmodule
