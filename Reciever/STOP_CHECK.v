`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:49 07/08/2020 
// Design Name: 
// Module Name:    STOP_CHECK 
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
module STOP_CHECK(
    input rx_in,check_stop,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg stop_error
    );
	 
	 always @(rx_in , check_stop)
	 begin
		if(check_stop == 1'b1 && rx_in == 1'b1)
			begin
				data_out = data_in;
				stop_error = 1'b0; 
			end
		else
			begin
				data_out = 8'b0;
				stop_error = 1'b1;
			end
	 end
	

endmodule

