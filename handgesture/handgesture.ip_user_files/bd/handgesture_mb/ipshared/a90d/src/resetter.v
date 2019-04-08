`timescale 1ns / 1ps

module resetter

(
        input clk,
        input  BTNC,
        output reg reset
);
    reg [28:0] counter = 0;
    always @(posedge clk)
    begin
        if (BTNC) begin
            counter <= 0;
        end
        else begin
            if (counter==0)
            begin
                reset <= 1;
                counter <= counter + 1;
            end
            else begin
                reset <= 0;
                counter <= counter + 1;
            end
        end 
    end
endmodule
