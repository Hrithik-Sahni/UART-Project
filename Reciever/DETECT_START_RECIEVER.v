`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:57:42 07/14/2020 
// Design Name: 
// Module Name:    DETECT_START_RECIEVER 
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
module DETECT_START_RECIEVER(baud_clk,rx_in,detected);
input baud_clk;
input rx_in;
output reg detected;

reg [3:0]state;

parameter IDLE=4'b0000,cycle1=4'b0001,cycle2=4'b0010,cycle3=4'b0011,cycle4=4'b0100,cycle5=4'b0101,cycle6=4'b0110,cycle7=4'b0111,cycle8=4'b1000;

always@(posedge baud_clk)
	begin

		case(state)

			IDLE: if(rx_in==0)
						begin
							state=cycle1;
							detected=0;
						end
					else
						begin
							state=IDLE;
							detected=0;
						end
				
			cycle1: if(rx_in==0)
								begin
									state=cycle2;
									detected=0;
								end
							else
								begin
									state=IDLE;
									detected=0;
								end
						
			cycle2: if(rx_in==0)
								begin
									state=cycle3;
									detected=0;
								end
							else
								begin
									state=IDLE;
									detected=0;
								end
						
			cycle3: if(rx_in==0)
								begin
									state=cycle4;
									detected=0;
								end
							else 
									begin
										state=IDLE;
										detected=0;
									end
			cycle4: if(rx_in==0)
								begin
									state=cycle5;
									detected=0;
								end
							else 
									begin
										state=IDLE;
										detected=0;
									end
			cycle5: if(rx_in==0)
								begin
									state=cycle6;
									detected=0;
								end
							else 
									begin
										state=IDLE;
										detected=0;
									end
									
			cycle6: if(rx_in==0)
								begin
									state=cycle7;
									detected=0;
								end
							else 
									begin
										state=IDLE;
										detected=0;
									end
									
			cycle7: if(rx_in==0)
								begin
									state=cycle8;
									detected=0;
								end
							else 
									begin
										state=IDLE;
										detected=0;
									end
												
			cycle8: if(rx_in==0)
									begin
										state=cycle8;
										detected=1;
									end
								else 
									begin
										state=IDLE;
										detected=0;
									end
					
			default:
								begin
									state=IDLE;
									detected=0;
								end
		endcase
					
	end				
endmodule

//module DETECT_START_RECIEVER(
//    input baurd_clk,data,
//    output reg start_bit
//    );
//	 
//	 parameter Idl = 3'd0, detect_1 = 3'd1, detect_2 = 3'd2, detect_3 = 3'd3, detect_4 = 3'd4, detect_5 = 3'd5, detect_6 = 3'd6, detect_7 = 3'd7;
//	 reg [2:0] state; 
//	 
//	 
//	 always@(posedge baurd_clk)
//	 begin
//	 case(state)
//	 
//Idl : if (!data)
//			begin
//			state = detect_1;
//			start_bit = 0;
//			end
//			else
//			begin
//			state = Idl;
//			start_bit = 0;
//			end
//detect_1 : if (!data)
//			begin
//			state = detect_2;
//			start_bit = 0;
//			end
//			else
//			begin
//			state = Idl;
//			start_bit = 0;
//			end
//detect_2 : if (!data)
//			begin
//			state = detect_3;
//			start_bit = 0;
//			end
//			else
//			begin
//			state = Idl;
//			start_bit = 0;
//			end	 
//detect_3 : if (!data)
//			begin
//			state = detect_4;
//			start_bit = 0;
//			end
//			else
//			begin
//			state = Idl;
//			start_bit = 0;
//			end	 
//detect_4 : if (!data)
//			begin
//			state = detect_5;
//			start_bit = 0;
//			end
//			else
//			begin
//			state = Idl;
//			start_bit = 0;
//			end	 
//detect_5 : if (!data)
//			begin
//			state = detect_6;
//			start_bit = 0;
//			end
//			else
//			begin
//			state = Idl;
//			start_bit = 0;
//			end
//detect_6 : if (!data)
//			begin
//			state = detect_7;
//			start_bit = 0;
//			end
//			else
//			begin
//			state = Idl;
//			start_bit = 0;
//			end
//detect_7 : if (!data)
//			begin
//			state = detect_7;
//			start_bit = 1;
//			end
//			else
//			begin
//			state = Idl;
//			start_bit = 0;
//			end
//default:
//				begin
//				state=Idl;
//				start_bit=0;
//				end
//endcase
//end
//endmodule
