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
module PARITY_CHECK(
		input clk , reset , parity_in , parity_load,
		input [7:0] data_sipo,
		output reg parity_out,
		output reg [7:0] data_out
    );
	 reg [7:0]temp;
	 always @(posedge clk , negedge reset)
		begin
			if(!reset)
				begin
					data_out <= 8'd0;
					parity_out <= 1'b0;
					temp <= 8'd0;
				end
			else if(parity_load)
				begin
					temp <= data_sipo;
				end
			else if(parity_in == ^temp)
				begin
						parity_out <= 1'b0;
						data_out <= temp;
				end
			else
				begin
					parity_out <= 1'b1;
					data_out <= 8'd0;
				end
		end


endmodule
