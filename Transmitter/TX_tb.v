`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:30:43 07/07/2020
// Design Name:   TX_MODULE
// Module Name:   C:/Verilog_Demo/UART/TX_tb.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TX_MODULE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TX_tb;

	// Inputs
	reg clk;
	reg reset;
	reg tx_start;
	reg [7:0] data;

	// Outputs
	wire fout;

	// Instantiate the Unit Under Test (UUT)
	TX_MODULE uut (
		.clk(clk), 
		.reset(reset), 
		.tx_start(tx_start), 
		.data(data), 
		.fout(fout)
	);
	
	initial begin
		clk = 0 ;
		forever #5 clk = ~clk;
		end

	initial begin
		reset = 0;
		
		#15 reset = 1;
			 tx_start = 1;
		    data = 8'b10101101;
		// Initialize Inputs

		// Add stimulus here

	end
      
endmodule

