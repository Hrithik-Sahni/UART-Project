`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:41:22 07/08/2020
// Design Name:   RX_MODULE
// Module Name:   C:/Verilog_Demo/UART/rx_tb.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RX_MODULE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rx_tb;

	// Inputs
	reg clk;
	reg reset;
	reg rx_inp;

	// Outputs
	wire [7:0] data_out;
	wire stop_error;
	wire parity_error;

	// Instantiate the Unit Under Test (UUT)
	RX_MODULE uut (
		.clk(clk), 
		.reset(reset), 
		.rx_inp(rx_inp), 
		.data_out(data_out), 
		.stop_error(stop_error), 
		.parity_error(parity_error)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
		
	initial begin
		// Initialize Inputs
		reset = 0;
		#15 reset = 1;
		
		rx_inp = 0;
		#10 rx_inp = 1;
		#10 rx_inp = 1;
		#10 rx_inp = 0;
		#10 rx_inp = 0;
		#10 rx_inp = 1;		
		#10 rx_inp = 1;
		#10 rx_inp = 0;
		#10 rx_inp = 0;
		#10 rx_inp = 0;
		#10 rx_inp = 1;
		
		
	end
      
endmodule

