`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:28:12 07/08/2020 
// Design Name: 
// Module Name:    PARITY_CHECK 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//module PARITY_CHECK(
//		input  parity_in,parity_load,
//		input [7:0] data_sipo,
//		output reg parity_error,
//		output reg [7:0] data_out
//    );
//	 //reg [7:0]temp;
//	 always @(*)
//		begin
//	    if(parity_load)
//				begin
//					if(parity_in == ^data_sipo)
//						begin
//							parity_error = 1'b0;
//							data_out = data_sipo;
//						end
//					else
//						begin
//							parity_error = 1'b1;
//							data_out = 8'd0;
//						end
//				end
//		end
//endmodule

module PARITY_CHECK(
		input  parity_in,parity_load,
		input [7:0] data_sipo,
		output reg parity_error,
		output reg [7:0] data_out
    );
	 //reg [7:0]temp;
	 always @(*)
		begin
	    if(parity_load)
				begin
					if(parity_in == ^data_sipo)
						begin
							parity_error = 1'b0;
							data_out = data_sipo;
						end
					else
						begin
							parity_error = 1'b1;
							data_out = 8'd0;
						end
				end
		end
endmodule
