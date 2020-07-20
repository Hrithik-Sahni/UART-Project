`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:54:18 07/08/2020 
// Design Name: 
// Module Name:    RX_MODULE 
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
module RX_MODULE(
    input baud_clk , reset , rx_inp ,
    output [7:0] data_out,
	 output stop_error,
	 output parity_error
    );
	 
	 wire start_detect , shift , parity_load , check_stop , clk_out;
	 wire [7:0] sipo_out;
	 wire [7:0] parity_out;
	 
	 DETECT_START_RECIEVER stdetect(baud_clk , rx_inp , start_detect);
	 //START_DECT stdect(rx_inp , start_detect);
	 SIPO sp(clk_out , reset , rx_inp , shift , sipo_out);
	 PARITY_CHECK pc( rx_inp , parity_load , sipo_out , parity_error , parity_out);
	 STOP_CHECK stpchk(rx_inp , check_stop , parity_out , data_out , stop_error);
	 RX_CONTROLLER rx_ctrl(clk_out , reset , start_detect, parity_error ,shift , parity_load , check_stop);
	 CLK_DIVIDER cdrx(baud_clk , reset , clk_out);
	 
endmodule

