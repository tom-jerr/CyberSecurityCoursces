`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:20:51 06/16/2022
// Design Name:   CPU
// Module Name:   D:/Verilog_projects/CPU/cpu1.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu1;

	// Inputs
	reg Clock;
	reg Reset;

	// Outputs
	wire [31:0] addr;
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.Clock(Clock), 
		.Reset(Reset), 
		.addr(addr), 
		.result(result)
	);

	initial begin
		Clock = 0;
		Reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		#100;
		Clock=~Clock;
		Reset=0;
		#100;
		Clock=~Clock;
		
		

	end
      
endmodule

