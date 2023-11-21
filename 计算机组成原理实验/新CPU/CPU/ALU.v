`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:56 06/07/2022 
// Design Name: 
// Module Name:    ALU 
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
//ALUÔ´³ÌÐò
module ALU(a,b,op,result,zero);
	input [31:0] a;
	input [31:0] b;
	input [2:0] op;
	
	output [31:0] result;
	output zero;
	
	reg [31:0] result;
	reg zero;
	reg [15:0] extend=16'h0000;
	
	always @(op,a,b)
	begin
		case(op)
		3'b000: result=a+b;
		3'b001: result=a&b;
		3'b010: result=a^b;
		3'b100: result=a-b;
		3'b101: result=a|b;
		3'b110: result={b[15:0],extend};
		endcase
		if(|result)zero=0;
			else zero=1;
	end
	
endmodule
