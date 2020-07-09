`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:29:33 07/06/2020 
// Design Name: 
// Module Name:    TX_CONTROLLER 
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
module TX_CONTROLLER(
    input clk,tx_start,reset,
    output reg load,shift,
    output reg [1:0] sel
    );
	 reg [2:0] state;
	 reg [2:0] next_state;
	 reg [3:0] count = 4'd0;
	 
	 parameter Idle = 3'b000 , Start = 3'b001 , Data = 3'b010 , Parity = 3'b011 , Stop = 3'b100;
	 
	 always @(*)
		begin
			case(state)
			
			Idle   : begin
							next_state = tx_start ? Start : Idle;
							load = 0;
							shift = 0;
							sel = 2'b11;
						end
			
			Start  : begin
							next_state = Data;
							load = 1;
							shift = 0;
							count = 4'd0;
							sel = 2'b00;
						end
			
			Data   : begin
							next_state = (count == 4'b1000) ? Parity : Data;
							load = 0;
							shift = 1;
							sel = 2'b01;
						end
			
			Parity : begin
							next_state = Stop;
							load = 0;
							shift = 0;
							sel = 2'b10;
						end
			Stop   :	begin		
							next_state = tx_start ? Start : Idle;
							load = 0;
							shift = 0;
							sel = 2'b11;
						end
			endcase
		end
		
	always @(posedge clk , negedge reset)
		begin
			if(!reset)
				count <= 0;
			else if(state == Data)
				count <= count + 1;
			else
				count <= count;
		end
		
	always @(posedge clk , negedge reset)
		begin
			if(!reset)
				state <= Idle;
			else
				state <= next_state;
		end	
endmodule
