`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:43:09 06/16/2022 
// Design Name: 
// Module Name:    MUX32_2_1 
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
module MUX32_2_1(in1,in2,sign,sel);
	input [31:0] in1;
	input [31:0] in2;
	input sign;
	output [31:0] sel;
	reg [31:0] sel;
	always @ (in1,in2,sign)
		begin
			if(!sign) sel=in1;
			else sel=in2;
		end

endmodule
