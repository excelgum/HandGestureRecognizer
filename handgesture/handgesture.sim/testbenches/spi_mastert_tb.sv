`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2019 10:15:08 PM
// Design Name: 
// Module Name: spi_master_tb
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


module spi_master_tb();
    
    parameter [11:0] SPI_CLK_COUNT_MAX = 12'h004;
    
    reg clk;
    reg rst;
    reg start;
    reg interrupt;
    reg miso;
    wire mosi;
    wire sclk;
    reg [7:0] slave_reg;
    reg [7:0] sreg_slv;
    
    wire end_transmission;
    wire chip_select;
    wire [7:0] send_data;
    wire [7:0] received_data;
    wire begin_transmission;
    wire done_init;
    wire done_read;
    wire [15:0] x_axis;
    wire [15:0] y_axis;
    wire [15:0] z_axis;
    assign miso = sreg_slv[7];
    
    task spi_transfer;
        input [7:0] slave_data;
        
        sreg_slv <= slave_data;
        
        repeat(8) begin
            @(negedge sclk);
            miso = sreg_slv[7];
            
            @(posedge sclk);
            sreg_slv <= sreg_slv << 1;
            sreg_slv[0] <= mosi;
        end
    endtask
    
    task reset;
        slave_reg = 8'h89;
        start = 0;
        interrupt = 0;
        sreg_slv = 0;
        rst = 1;        
        repeat(3) @(negedge clk);
        rst = 0;
    endtask
    
    initial begin
        forever begin
            wait (rst == 1'b0);
            wait(begin_transmission == 1'b1);
            spi_transfer(slave_reg);
            @(end_transmission);
        end
    end
    
    initial begin
        clk = 0;
        forever #5 clk <= ~clk;
    end

    initial begin
        reset;
        start = 1;
    end
    
    spi_master udut(
        .clk(clk),
        .rst(rst),
        .interrupt(interrupt),
        .start(start),
        .end_transmission(end_transmission),
        .chip_select(chip_select),
        .received_data(received_data),
        .begin_transmission(begin_transmission),
        .send_data(send_data),
        .done_init(done_init),
        .done_read(done_read),
        .x_axis(x_axis),
        .y_axis(y_axis),
        .z_axis(z_axis)
    );
    
    spi_interface uspi_if(
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
        reset;
        start = 1;
        @(done_init);
        
        repeat(10) @(posedge clk);
        
        interrupt = 1;
        @(posedge clk);
        interrupt = 0;
        
        slave_reg = 8'h34;
        @(posedge end_transmission);
        slave_reg = 8'h12;
        @(posedge end_transmission);
        slave_reg = 8'h78;
        @(posedge end_transmission);
        slave_reg = 8'h56;
        @(posedge end_transmission);
        slave_reg = 8'hbc;
        @(posedge end_transmission);
        slave_reg = 8'h9a;
        @(posedge end_transmission);
        
        
    end
    
    
//    task spi_transfer;
//        input [7:0] master_data;
//        input [7:0] slave_data;
        
//        sreg_slv <= slave_data;
//        sreg_mst <= master_data;
        
//        repeat(8) begin
//            @(negedge sclk);
//            sreg_mst <= sreg_mst << 1;
//            sreg_mst[0] <= sreg_slv[7];
//            sreg_slv <= sreg_slv << 1;
//            sreg_slv[0] <= sreg_mst[7];
//        end
        
//        sclk_en = 0;
//        @(posedge sclk);
//        end_transmission = 1;
//        @(posedge clk)
//        #3
//        end_transmission = 0;
//        received_data <= sreg_slv;
//    endtask    
    
//    initial begin
//        forever begin
//            if (sclk_en) begin
//                repeat(4) @(posedge clk);
//                sclk <= ~sclk;
//            end else begin
//                @(posedge clk);
//                sclk <= 1'b1;
//            end
//        end
//    end
    
//    initial begin
//        forever begin
//            wait(rst == 1'b0);
//            wait(begin_transmission == 1'b1);
//            @(posedge clk);
//            chip_select = 0;
            
//            while (begin_transmission == 1'b1) begin
//                sclk_en = 1;
//                spi_transfer(send_data, 8'h00);
//            end
            
//            repeat(3) @(posedge clk);
//            chip_select = 1;
//        end
//    end
    
//    initial begin
//        reset;
//        begin_transmission = 1'b1;
//        reg_mst = 8'hab;
//        reg_slv = 8'hcd;
//        @(posedge end_transmission);
//        $display("done single byte transfer %t", $time);
//        begin_transmission = 1'b0;
        
//        repeat(10) @(posedge clk);
        
//        // two transmissions, simulates gyro
//        reg_mst = 8'h20;
//        reg_slv = 8'h00;
//        begin_transmission = 1'b1;
//        @(posedge end_transmission);
        
//        reg_mst = sreg_mst;
//        reg_slv = 8'h07;
//        @(posedge end_transmission);
//        $display("done multi byte transfer %t", $time);
//        begin_transmission = 1'b0;
//    end
endmodule