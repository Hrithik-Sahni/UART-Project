`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:47 07/06/2020 
// Design Name: 
// Module Name:    TX_MODULE 
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
module TX_MODULE(
		input clk,reset,tx_start, 
		input [7:0] data,
		output fout
    );
	 
	 wire load,shift,piso_out,parity_out;
	 wire [1:0] sel;
	 
	 TX_CONTROLLER tx_ctrl(clk , tx_start , reset , load , shift , sel);
	 PISO p(data , clk , shift , load , reset , piso_out);
	 PARITY_GEN pg(data , load , parity_out);
	 MUX m(1'b0 , piso_out , parity_out , 1'b1 , sel , fout);
	 
endmodule
