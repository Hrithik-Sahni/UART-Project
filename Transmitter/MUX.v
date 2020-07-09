`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:05:22 07/06/2020 
// Design Name: 
// Module Name:    MUX 
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
module MUX(
    input inp0 , inp1 , inp2 , inp3,
	 input[1:0] sel,
    output reg out
    );
	 
	 always @(*)
		begin
			case(sel)
				2'b00: out = inp0;
				2'b01: out = inp1;
				2'b10: out = inp2;
				2'b11: out = inp3;
			endcase
		end


endmodule
