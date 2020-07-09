`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:38 07/08/2020 
// Design Name: 
// Module Name:    START_DECT 
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
module START_DECT(
    input start_in,
    output reg out
    );
	 
	 always @(start_in)
		begin
			out = (start_in == 0) ? 1'b1 : 1'b0;
		end


endmodule
