`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:53 06/07/2022 
// Design Name: 
// Module Name:    registers 
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

//registers
module registers(clock,wr,wr_register_no,wr_data,A_add,B_add,A,B);
	input clock,wr;
	input [4:0] A_add,B_add;
	input [4:0] wr_register_no;
	input [31:0] wr_data;
	output [31:0]A,B;
	
	reg [31:0] reg31[31:1];
	
	assign A=(A_add==0)? 0:reg31[A_add];
	assign B=(B_add==0)? 0:reg31[B_add];
	
	always @(posedge clock)
	begin
		if((wr)&(wr_register_no!=0)) reg31[wr_register_no]<=wr_data;
	end
endmodule