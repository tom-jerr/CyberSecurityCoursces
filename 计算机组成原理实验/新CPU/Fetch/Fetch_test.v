`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:54:41 06/16/2022
// Design Name:   Fetch
// Module Name:   D:/Verilog_projects/Fetch/Fetch_test.v
// Project Name:  Fetch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Fetch_test;

	// Inputs
	reg clock;
	reg reset;
	reg [31:0] B_addr;
	reg Z;
	reg B;

	// Outputs
	wire [31:0] addr;

	// Instantiate the Unit Under Test (UUT)
	Fetch uut (
		.clock(clock), 
		.reset(reset), 
		.B_addr(B_addr), 
		.Z(Z), 
		.B(B), 
		.addr(addr)
	);

	initial begin
		clock = 0;
		reset = 1;
		B_addr = 32'h00000000;
		Z = 1;
		B = 1;
		
		//≤‚ ‘
		#100;
		clock=~clock;
		#100;
		clock=~clock;
		reset=0;
		B_addr = 32'h00000004;
		Z = 1;
		B = 1;
		#100;
		clock=~clock;
		
		#100;
		clock=~clock;
		reset=0;
		B_addr = 32'h00000018;
		Z = 0;
		B = 0;
		
		#100;
		clock=~clock;
		#100;
		clock=~clock;
		reset=0;
		B_addr = 32'h0000001c;
		Z = 0;
		B = 1;
		#100;
		clock=~clock;
		#100;
		clock=~clock;
		reset=0;
		B_addr = 32'h00000020;
		Z = 1;
		B = 1;
		#100;
		clock=~clock;
		#100;
		clock=~clock;
		reset=0;
		B_addr = 32'h00000084;
		Z = 0;
		B = 1;
		
	end
      
endmodule

