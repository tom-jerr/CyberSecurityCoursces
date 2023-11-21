`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:45:46 06/16/2022 
// Design Name: 
// Module Name:    MUX5_2_1 
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
module MUX5_2_1(inl1,inl2,sign1,sel1);
	input [4:0] inl1;
	input [4:0] inl2;
	input sign1;
	output [4:0] sel1;
	reg [4:0] sel1;
	always @ (inl1,inl2,sign1)
		begin
			if(!sign1) sel1=inl1;
			else sel1=inl2;
		end

endmodule
