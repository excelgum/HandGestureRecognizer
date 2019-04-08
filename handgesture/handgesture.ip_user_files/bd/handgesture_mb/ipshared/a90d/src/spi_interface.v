`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Andrew Skreen
// 
// Create Date:    07/11/2012
// Module Name:    spi_interface
// Project Name: 	 PmodGYRO_Demo
// Target Devices: Nexys3
// Tool versions:  ISE 14.1
// Description: This module is the main interface to the PmodGYRO, it produces
//					 slave select (SS), master out slave in (MOSI), and serial clock (SCLK)
//					 signals used in SPI communcation.  Data is read on the master in slave out
//					 (MISO) input.  SPI mode 3 is used.
//
// Revision History: 
// 						Revision 0.01 - File Created (Andrew Skreen)
//							Revision 1.00 - Added Comments and Converted to Verilog (Josh Sackos)
//                          ECE532: added chip_select drive logic and extra state
//////////////////////////////////////////////////////////////////////////////////////////

// ==============================================================================
// 										  Define Module
// ==============================================================================
module spi_interface(
		send_data, 
		begin_transmission,
		miso,
		clk,
		rst,
		recieved_data,
		end_transmission,
		mosi,
		sclk,
		chip_select
);

// ==============================================================================
// 									   Port Declarations
// ==============================================================================
			input [7:0]      send_data;
			input            begin_transmission;
			input            miso;
			input            clk;
			input            rst;
			output [7:0]     recieved_data;
			output           end_transmission;
			output           mosi;
			output           sclk;
			output           chip_select;
   
// ==============================================================================
// 						     Parameters, Registers, and Wires
// ==============================================================================

			reg [7:0]        recieved_data;
			reg              end_transmission;
			reg              mosi;
			reg              chip_select;
			reg              sclk_disable;
			reg              sclk_rst;

			parameter [11:0] SPI_CLK_COUNT_MAX = 12'hFFF;
			reg [11:0]       spi_clk_count;
			
			reg              sclk_buffer;
			reg              sclk_previous;
			
			parameter [3:0]  RX_COUNT_MAX = 4'h8;
			reg [3:0]        rx_count;
			
			reg [7:0]        shift_register;
			
			parameter [2:0]  RxTxTYPE_idle = 0,
								  RxTxTYPE_rx_tx = 1,
								  RxTxTYPE_hold = 2,
								  RxTxTYPE_end = 3,
								  RxTxTYPE_buffer = 4;
			reg [2:0]        RxTxSTATE;
   
// ==============================================================================
// 										Implementation
// ==============================================================================

			//---------------------------------------------------
			// 							  FSM
			//---------------------------------------------------
			always @(posedge clk)
			begin: tx_rx_process
				
				begin
					if (rst == 1'b1)
					begin
					    chip_select <= 1'b1;
					    sclk_disable <= 1'b1;
					    end_transmission <= 1'b0;
						mosi <= 1'b1;
						RxTxSTATE <= RxTxTYPE_idle;
						recieved_data <= {8{1'b0}};
						shift_register <= {8{1'b0}};
					end
					else
						case (RxTxSTATE)

						   // idle
							RxTxTYPE_idle :
								begin
									end_transmission <= 1'b0;
									if (begin_transmission == 1'b1)
									begin
                                        sclk_rst <= 1'b0;
									    sclk_disable <= 1'b0;
									    chip_select <= 1'b0;
										RxTxSTATE <= RxTxTYPE_rx_tx;
										rx_count <= {4{1'b0}};
										shift_register <= send_data;
									end
								end

						   // rx_tx
							RxTxTYPE_rx_tx :
								//send bit
								if (rx_count < RX_COUNT_MAX)
								begin
									if (sclk_previous == 1'b1 & sclk_buffer == 1'b0)
										mosi <= shift_register[7];
									//recieve bit
									else if (sclk_previous == 1'b0 & sclk_buffer == 1'b1)
									begin
										shift_register[7:1] <= shift_register[6:0];
										shift_register[0] <= miso;
										rx_count <= rx_count + 1'b1;
									end
								end
								else
								begin
									RxTxSTATE <= RxTxTYPE_buffer;
									end_transmission <= 1'b1;
									recieved_data <= shift_register;
								end

                            RxTxTYPE_buffer:
                                begin
                                    end_transmission <= 1'b0;
                                    RxTxSTATE <= RxTxTYPE_hold;
                                end
                           
						   // hold
							RxTxTYPE_hold :
								begin
								    end_transmission <= 1'b0;
								    					
									if (begin_transmission == 1'b1)
									begin
										RxTxSTATE <= RxTxTYPE_rx_tx;
										rx_count <= {4{1'b0}};
										shift_register <= send_data;
									end
									else
									begin
									   sclk_disable <= 1'b1;
									   RxTxSTATE <= RxTxTYPE_end;
									end
								end
								
						      RxTxTYPE_end :
						          begin
						              if (sclk_previous == 1'b0 & sclk_buffer == 1'b1)
						              begin
						                  chip_select <= 1'b1;
						                  sclk_rst <= 1'b1;
						                  RxTxSTATE <= RxTxTYPE_idle;
						              end
						          end
						endcase
				end
			end
			
			
			//---------------------------------------------------
			// 						Serial Clock
			//---------------------------------------------------
			always @(posedge clk)
			begin: spi_clk_generation
				
				begin
					if (rst == 1'b1 || sclk_rst == 1'b1)
					begin
						sclk_previous <= 1'b1;
						sclk_buffer <= 1'b1;
						spi_clk_count <= {12{1'b0}};
					end
					
					else if (RxTxSTATE == RxTxTYPE_rx_tx || RxTxSTATE == RxTxTYPE_hold || RxTxSTATE == RxTxTYPE_end || RxTxTYPE_buffer)
					begin
						if (spi_clk_count == SPI_CLK_COUNT_MAX)
						begin
							sclk_buffer <= (~sclk_buffer);
							spi_clk_count <= {12{1'b0}};
						end
						else
						begin
							sclk_previous <= sclk_buffer;
							spi_clk_count <= spi_clk_count + 1'b1;
						end
					end
					else
						sclk_previous <= 1'b1;
				end
			end
			
			// Assign serial clock output
			assign sclk = sclk_previous | sclk_disable;
   
endmodule

