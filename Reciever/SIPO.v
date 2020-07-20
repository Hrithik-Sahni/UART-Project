`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:24 07/08/2020 
// Design Name: 
// Module Name:    SIPO 
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
//module SIPO(
//    input clk , reset , data_in, shift,
//    output reg [7:0] out
//    );
//	reg [7:0]temp;
//	
//	always @(posedge clk , negedge reset)
//		begin
//			if(!reset)
//			begin
//				temp <= 8'd0;
//				//out <= 8'd0;
//			end
//			else if(shift)
//			begin
//				temp <= {temp[6:0] , data_in};
//				//out <= temp;
//			end
//			else
//				begin
//					out <= temp;
//					temp <= temp;
//				end
//		end
//	
//endmodule

module SIPO(
    input clk , reset , data_in, shift,
    output [7:0] out
    );
	reg [7:0]temp;
	
	always @(posedge clk , negedge reset)
		begin
			if(!reset)
			begin
				temp <= 8'd0;
			end
			else if(shift)
			begin
				temp <= {temp[6:0] , data_in};
			end
		end
	assign out=temp;
endmodule
