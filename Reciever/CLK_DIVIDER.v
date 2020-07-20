`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:50:43 07/14/2020 
// Design Name: 
// Module Name:    CLK_DIVIDER 
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
module CLK_DIVIDER(baurd_clk,reset,clock_out);
input baurd_clk,reset;
output reg clock_out;

reg[3:0] counter = 4'd0;

always@(posedge baurd_clk,negedge reset)
	begin
		if(!reset)
			begin
				counter<=4'd0;
				clock_out<=0;
			end 
		else if(counter == 4'd15)
			begin
				counter<=4'd0;
				clock_out<=~clock_out;
			end
		else
			begin
				counter<=counter+1;
				clock_out<=clock_out;
			end
	end
endmodule

//module CLK_DIVIDER(
//input baurd_clk,reset,
//output reg clock_out
//);
//
//reg [3:0] counter = 4'd0;
//
//always@(posedge baurd_clk or negedge reset)
// begin
//  if(!reset)
//   begin
//   counter<=4'd0;
//	clock_out <=0;
//   end 
//   else if(counter == 4'd15)
//    begin
//	 clock_out <= ~clock_out;
//    counter <=4'd0;
//	end
//	else
//	begin
//	 counter<= counter + 1;
//	 clock_out<= clock_out;
//	 end
// end
// endmodule
