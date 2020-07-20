`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:49:53 07/18/2020 
// Design Name: 
// Module Name:    UART 
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
module UART(
    input [7:0] data_in,
    input clk,reset,txstart,
	 input [1:0] baurd_sel,
    output [7:0] data_out,
    output parity_error,stop_error
    );
	 
	 wire msg,baurd_clk;
	 
	BAUD_GENERATOR BAUD_GEN(clk,reset,baurd_sel,baurd_clk);

	TX_MODULE TX(baurd_clk,reset,txstart,data_in,msg);

	RX_MODULE RX(baurd_clk,reset,msg,data_out,stop_error,parity_error);


endmodule
