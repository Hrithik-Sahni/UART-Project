`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:00:29 07/18/2020
// Design Name:   UART
// Module Name:   C:/Verilog_Demo/UART/UART_tb.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UART_tb;

	// Inputs
	reg [7:0] data_in;
	reg clk;
	reg reset;
	reg txstart;
	reg [1:0] baurd_sel;

	// Outputs
	wire [7:0] data_out;
	wire parity_error;
	wire stop_error;

	// Instantiate the Unit Under Test (UUT)
	UART uut (
		.data_in(data_in), 
		.clk(clk), 
		.reset(reset), 
		.txstart(txstart), 
		.baurd_sel(baurd_sel), 
		.data_out(data_out), 
		.parity_error(parity_error), 
		.stop_error(stop_error)
	);


//	initial begin
//		// Initialize Inputs
//		data_in = 0;
//		clk = 0;
//		reset = 0;
//		txstart = 0;
//		baurd_sel = 2'b10;
//
//		// Wait 100 ns for global reset to finish
//		#40 reset = 1; txstart =1; data_in = 8'd67;		
//        
//		// Add stimulus here
//
//	end
//	
//	always
//	#50 clk = ~clk;

		initial begin
		// Initialize Inputs
		data_in = 0;
		clk = 0;
		reset = 0;
		txstart = 0;
		baurd_sel = 2'b10;

		// Wait 100 ns for global reset to finish
		#90 reset = 1; txstart = 1; data_in = 8'd67;		
        
		// Add stimulus here

	end
	always
	#100 clk = ~clk;

      
endmodule

