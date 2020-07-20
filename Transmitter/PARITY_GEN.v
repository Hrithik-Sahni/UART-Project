`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:03:01 07/06/2020 
// Design Name: 
// Module Name:    PARITY_GEN 
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
module PARITY_GEN(
    input [7:0] data,
	 input load,
    output reg parity
    );
	 reg [7:0] temp = 8'd0;
	 always @(*)
		begin
			if(load)
				temp = data; //Load the data in temp
			else
				begin
					parity = ^temp;	// Finding the XOR to generate parity
				end
		end

endmodule
