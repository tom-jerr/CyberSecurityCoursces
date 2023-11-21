`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:19:54 06/16/2022
// Design Name:   CPU
// Module Name:   D:/Verilog_projects/CPU/CPU_test1.v
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

module CPU_test1;

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
		// Initialize Inputs
		Clock = 0;
		Reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

