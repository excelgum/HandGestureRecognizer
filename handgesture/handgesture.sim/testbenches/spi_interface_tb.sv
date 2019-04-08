`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2019 01:49:12 PM
// Design Name: 
// Module Name: spi_interface_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module spi_interface_tb();
    reg [7:0] sreg;
    
    reg [7:0] send_data;
    reg begin_transmission;;
    reg miso;
    reg clk;
    reg rst;
    wire [7:0] received_data;
    wire end_transmission;
    wire mosi;
    wire sclk;
    wire chip_select;
    
    task spi_transfer;
        input [7:0] master_data;
        input [7:0] slave_data;
        
        send_data = master_data;
        sreg = slave_data;
        repeat(8) begin
            @(negedge sclk)
            miso = sreg[7];
            
            @(posedge sclk)
            sreg = sreg << 1;
            sreg[0] = mosi;
        end
        
        wait(end_transmission == 1'b1);
    endtask
    
    spi_interface udut(
        .send_data(send_data), 
        .begin_transmission(begin_transmission),
        .miso(miso),
        .clk(clk),
        .rst(rst),
        .recieved_data(received_data),
        .end_transmission(end_transmission),
        .mosi(mosi),
        .sclk(sclk),
        .chip_select(chip_select)
    );
    
    initial begin
        clk = 0;
        forever #5 clk <= ~clk;
    end
    
    
    initial begin
        // default signals
        begin_transmission = 0;
        sreg = 8'h00;
        send_data = 8'h00;
        
        // rst
        rst = 1;
        #10
        rst = 0;
        
        // start transaction
        begin_transmission = 1;
        
        // master_data (send_data), slave_data (received_data)
        spi_transfer(8'h29, 8'hab);
        assert(received_data == 8'hab);
        assert(sreg == 8'h29);
        
        begin_transmission = 0;
        
        wait(chip_select == 1'b1);
        repeat (5) @(posedge clk);
        
        begin_transmission = 1;
        
        // Multi byte transfer, slave_initially sends garbage data
        spi_transfer(8'h77, 8'h66);
        assert(received_data == 8'h66);
        assert(sreg == 8'h77);
        
        // slave responds with actual data in next byte
        spi_transfer(8'h66, 8'h91);
        assert(received_data == 8'h91);
        assert(sreg == 8'h66);
        
        begin_transmission = 0;
        wait(chip_select == 1'b1);
    end
endmodule
