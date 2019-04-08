`timescale 1ns / 1ps

module integrator
#(
  parameter NUMBER_WIDTH = 16
)
(
        input clk,
        input  signed [NUMBER_WIDTH-1: 0] input_number,
        input input_valid,
        input reset,
        output signed [NUMBER_WIDTH-1: 0] output_number
);
    reg [21:0] counter = 0;
    reg signed [NUMBER_WIDTH-1: 0] output_sum = 0;
    always @(posedge clk)
    begin
        if (reset) begin
            output_sum <= 0;
        end
        else begin
            if (input_valid && counter==0)
            begin
                output_sum <= output_sum + input_number;
            end
            counter <= counter + 1;
        end 
    end
    assign output_number = output_sum>>4;
endmodule
