`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:42:04 06/16/2022 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(clock,reset,B_addr,Z,B,addr);

	input clock;
	input reset;
	input [31:0] B_addr; 
	input Z;
	input B;
	output [31:0] addr;
	
	wire [31:0] shift;
	wire [31:0] addr_temp;
	wire [31:0] addtion1;
	wire [31:0] addtion2;
	wire [31:0] selection;
	wire mux;
	
	PC pc_1(.NPC(selection),.Reset(reset),.Clock(clock),.PC(addr_temp));
	AND and1(.c(Z),.d(B),.out2(mux));
	Shifter shifter1(.num(B_addr),.out1(shift));
	ADD add1(.a(addr_temp),.b(32'h00000004),.add(addtion1));
	ADD add2(.a(addtion1),.b(shift),.add(addtion2));
	MUX32_2_1 mux1(.in1(addtion1),.in2(addtion2),.sign(mux),.sel(selection));
	assign addr=addr_temp;
endmodule
