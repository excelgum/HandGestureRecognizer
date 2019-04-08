`timescale 1ns / 1ps

module cordic_counter
#(
  parameter NUMBER_WIDTH = 16
)
(
        input clk,
        input  signed [NUMBER_WIDTH-1: 0] input_number,
        input input_valid,
        input reset,
        output reg [NUMBER_WIDTH-1: 0] output_number1,
        output reg [NUMBER_WIDTH-1: 0] output_number2
);
    wire [15:0] cos;
    wire [15:0] sin;
    cordic cordic1(
            .clock(clk),    // Master clock
            .x_start(10000),
            .y_start(0),
            .angle(input_number*10000),
            .sine(sin),  // Output value for cosine of angle
            .cosine(cos)   // Output value for sine of angle
        );
    
    reg [15:0] prev = 0;
    reg [15:0] current = 0;
    wire [15:0] clean_cos;
    assign clean_cos = 3*(cos[14:0]-16435);
    always @(posedge clk) begin
        if (reset) begin
            output_number1 <= 0;
            output_number2 <= 0;
            prev <= 0;
            current <= 0;
        end
        else if (input_valid) begin
            current <= clean_cos;
            prev <= current;
            if (current == 15 && prev == 99) begin
                output_number1 <= output_number1 + 1;
            end
            else if (current == 21 && prev == 15) begin
                output_number1 <= output_number1 + 1;
            end
            else if (current == 33 && prev == 21) begin
                output_number1 <= output_number1 + 1;
            end
            else if (current == 39 && prev == 33) begin
                output_number1 <= output_number1 + 1;
            end
            else if (current == 54 && prev == 39) begin
                output_number1 <= output_number1 + 1;
            end
            else if (current == 60 && prev == 54) begin
                output_number1 <= output_number1 + 1;
            end
            else if (current == 66 && prev == 60) begin
                output_number1 <= output_number1 + 1;
            end
            else if (current == 72 && prev == 66) begin
                output_number1 <= output_number1 + 1;
            end
            else if (current == 78 && prev == 72) begin
                output_number1 <= output_number1 + 1;
            end
            else if (current == 84 && prev == 78) begin
                output_number1 <= output_number1 + 1;
            end
            else if (current == 99 && prev == 84) begin
                output_number1 <= output_number1 + 1;
            end
            
            if (current == 99 && prev == 15) begin
                output_number2 <= output_number2 + 1;
            end
            else if (current == 15 && prev == 21) begin
                output_number2 <= output_number2 + 1;
            end
            else if (current == 21 && prev == 33) begin
                output_number2 <= output_number2 + 1;
            end
            else if (current == 33 && prev == 39) begin
                output_number2 <= output_number2 + 1;
            end
            else if (current == 39 && prev == 54) begin
                output_number2 <= output_number2 + 1;
            end
            else if (current == 54 && prev == 60) begin
                output_number2 <= output_number2 + 1;
            end
            else if (current == 60 && prev == 66) begin
                output_number2 <= output_number2 + 1;
            end
            else if (current == 66 && prev == 72) begin
                output_number2 <= output_number2 + 1;
            end
            else if (current == 72 && prev == 78) begin
                output_number2 <= output_number2 + 1;
            end
            else if (current == 78 && prev == 84) begin
                output_number2 <= output_number2 + 1;
            end
            else if (current == 84 && prev == 99) begin
                output_number2 <= output_number2 + 1;
            end
       end        
    end
endmodule
