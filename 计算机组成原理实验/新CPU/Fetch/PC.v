`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:48:38 06/16/2022 
// Design Name: 
// Module Name:    PC 
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
module PC(NPC,Reset,Clock,PC);

	input Reset;
	input Clock;
	input [31:0] NPC;
	output [31:0] PC;
	
	reg [31:0] PC;
	always @ (posedge Clock or posedge Reset)
		begin
			if(Reset) PC<=32'h00000000;
			else PC<=NPC;
		end
endmodule
