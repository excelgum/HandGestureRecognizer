`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2019 05:57:13 PM
// Design Name: 
// Module Name: spi_master
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


module spi_master(
    input clk,
    input rst,
    input interrupt,
    input start,
    input end_transmission,
    input chip_select,
    input [7:0] received_data,
    output reg begin_transmission,
    output reg [7:0] send_data,
    output reg done_init,
    output reg done_read,
    output reg [15:0] x_axis,
    output reg [15:0] y_axis,
    output reg [15:0] z_axis
    );
    
    reg [3:0] STATE, PREV_STATE;
    parameter [3:0]
        IDLE = 0,
        INIT = 1,
        RUN = 2,
        TRANSFER_ADDRESS = 3,
        TRANSFER_DATA = 4,
        TRANSFER_END = 5,
        READ_X_L = 6,
        READ_X_H = 7,
        READ_Y_L = 8,
        READ_Y_H = 9,
        READ_Z_L = 10,
        READ_Z_H = 11,
        DONE_READ = 12;
    
    reg [47:0] axis_data;
    reg [7:0] ADDRESS;
    reg [7:0] DATA;
    
    reg [2:0] transfer_count;
    
    always @(posedge clk) begin
        if (rst == 1'b1) begin
            begin_transmission <= 1'b0;
            transfer_count <= 0;
            ADDRESS <= 0;
            DATA <= 0;
            send_data <= 0;
            done_read <= 0;
            done_init <= 0;
            axis_data <= 0;
            x_axis <= 0;
            y_axis <= 0;
            z_axis <= 0;
            
            STATE <= IDLE;
        end else begin
            case (STATE)
                IDLE:
                    begin
                        begin_transmission <= 1'b0;
                        transfer_count <= 0;
                        send_data <= 8'ha0;
                        done_init <= 0;
                        
                        if (start == 1'b1) begin
                            STATE <= INIT;
                        end
                    end
                    
                INIT:
                    begin                        
                        PREV_STATE <= INIT;
                        STATE <= TRANSFER_ADDRESS;
                        
                        if (transfer_count < 3) begin
                            case (transfer_count)
                                0:
                                    begin
                                        ADDRESS <= 8'h20;
                                        DATA    <= 8'h4F;
                                    end
                                    
                                1:
                                    begin
                                        ADDRESS <= 8'h22;
                                        DATA    <= 8'h08;
                                    end
                                    
                                2:
                                    begin
                                        ADDRESS <= 8'h23;
                                        DATA    <= 8'h10;
                                    end
                            endcase
                        end else begin
                            done_init <= 1'b1;
                            STATE <= RUN;
                        end
                    end
                
                TRANSFER_ADDRESS:
                    begin
                        begin_transmission <= 1'b1;
                        send_data <= ADDRESS;
                        
                        if (end_transmission == 1'b1) begin
                            send_data <= DATA;
                            
                            if (PREV_STATE == INIT) begin
                                STATE <= TRANSFER_DATA;
                            end else begin
                                STATE <= READ_X_L;
                            end
                        end
                    end
                
                TRANSFER_DATA:
                    begin
                        send_data <= DATA;
                        
                        if (end_transmission == 1'b1) begin
                            send_data <= 8'h00;
                            STATE <= TRANSFER_END;
                            begin_transmission <= 1'b0;
                        end
                    end
                    
                TRANSFER_END:
                    begin
                        begin_transmission <= 1'b0;
                        
                        if (chip_select == 1'b1) begin
                            transfer_count <= transfer_count + 1;
                            STATE <= PREV_STATE;
                        end
                    end
                    
                READ_X_L:
                    begin
                        if (end_transmission == 1'b1) begin
                            STATE <= READ_X_H;
                            axis_data[7:0] <= received_data;
                        end
                    end
                    
                READ_X_H:
                    begin
                        if (end_transmission == 1'b1) begin
                            STATE <= READ_Y_L;
                            axis_data[15:8] <= received_data;
                        end
                    end
                    
                READ_Y_L:
                    begin
                        if (end_transmission == 1'b1) begin
                            STATE <= READ_Y_H;
                            axis_data[23:16] <= received_data;
                        end
                    end
                    
                READ_Y_H:
                    begin
                        if (end_transmission == 1'b1) begin
                            STATE <= READ_Z_L;
                            axis_data[31:24] <= received_data;
                        end
                    end
                    
                READ_Z_L:
                    begin
                        if (end_transmission == 1'b1) begin
                            STATE <= READ_Z_H;
                            axis_data[39:32] <= received_data;
                        end
                    end
                    
                READ_Z_H:
                    begin
                        if (end_transmission == 1'b1) begin
                            STATE <= DONE_READ;
                            done_read <= 1;
                            axis_data[47:40] <= received_data;
                        end
                    end
                    
                DONE_READ:
                    begin
                        done_read <= 0;
                        x_axis <= axis_data[15:0];
                        y_axis <= axis_data[31:16];
                        z_axis <= axis_data[47:32];
                        STATE <= TRANSFER_END;
                    end
                    
                RUN:
                    begin
                        if (interrupt == 1'b1) begin
                            ADDRESS <= 8'hE8;
                            PREV_STATE <= RUN;
                            STATE <= TRANSFER_ADDRESS;
                        end
                    end
            endcase
        end
    end
        
endmodule
