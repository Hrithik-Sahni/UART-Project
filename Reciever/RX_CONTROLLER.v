`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:08:21 07/08/2020 
// Design Name: 
// Module Name:    RX_CONTROLLER 
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
module RX_CONTROLLER(
    input clk, reset , start_bit , parity_error,
    output reg shift , parity_load , check_stop
    );
	 reg [1:0] state;
	 reg [1:0] next_state;
	 reg [3:0] count = 4'd0;
	 
	 parameter Idle = 2'b00 , Data = 2'b01 , Parity = 2'b10 , Stop = 2'b11;
	 
	 always @(*)
		begin
			case(state)
			Idle   : begin
							next_state = start_bit ? Data : Idle;
							shift = 0;
							parity_load = 0;
							check_stop = 0;
						end
			
			Data   : begin
							next_state = (count == 4'b1000) ? Parity : Data;
							shift = 1;
							parity_load = 0;
							check_stop = 0;
						end
			
			Parity : begin
							next_state = (parity_error == 0)? Stop : Idle;
							shift = 0;
							parity_load = 1;
							check_stop = 0;
						end
			Stop   :	begin		
							next_state = Idle;
							shift = 0;
							parity_load = 0;
							check_stop = 1;
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
