`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:25 07/14/2020 
// Design Name: 
// Module Name:    BAUD_GENERATOR 
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
module BAUD_GENERATOR(clk,reset,baurd_sel,baurd_clk);
input clk,reset;
input [1:0] baurd_sel;
output reg baurd_clk;

reg [15:0] count = 16'd0;
reg [15:0] mod = 16'd0;

always@(posedge clk or negedge reset)
	begin
		if(!reset)
			begin
				baurd_clk<=1'b0;
				count<=16'd0;
			end
		else if(count == mod)
			begin
				baurd_clk<=~baurd_clk;
				count<=0;
			end
		else
			begin
				count<=count+1;
				baurd_clk<=baurd_clk;	
			end
	end
	
always@(baurd_sel)
	begin
		case(baurd_sel)
			2'b00:mod=15'd20833;//2400
			2'b01:mod=15'd10416;//4800
			2'b10:mod=15'd5208;//9600
			2'b11:mod=15'd2604;//19200
			default:mod=15'd2604;
		endcase
	end


endmodule


//module BAUD_GENERATOR(
//    input clk,reset,
//	 input [1:0] baurd_sel,
//    output reg baurd_clk
//    );
//	 
//	 reg [15:0] count_clk =16'd0;
//	 reg [15:0] mod = 16'd0;
//
//	 
//	 always@(posedge clk or negedge reset)
//	 begin
//	 if(!reset)
//	 begin
//	 baurd_clk<= 1'b0;
//	 count_clk <= 16'd0;
//	 end
//	 else if (count_clk == mod)
//	 begin
//	 baurd_clk<= ~ baurd_clk;	
//	 count_clk <= 16'd0;
//	 end	 
//	 else
//	 begin
//	 count_clk <= count_clk +1;
//	 baurd_clk <= baurd_clk;
//	 end
//	 end
//	 
//	 
//	 always@(baurd_sel)
//	 begin
//	 case(baurd_sel)
//	 
//	 2'd0 : mod <= 16'd41666;
//	 2'd1 : mod <= 16'd20833;
//	 2'd2 : mod <= 16'd10416;
//	 2'd3 : mod <= 16'd5208;
//	 default: mod <= 16'd10416;
//	 
//	 endcase
//	 end
//	 
//
//
//endmodule
