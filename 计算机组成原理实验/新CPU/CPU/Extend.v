`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:31 06/16/2022 
// Design Name: 
// Module Name:    Extend 
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
module Extend(data_16bit,data_32bit);
	input [15:0] data_16bit;
	output [31:0] data_32bit;
	
	reg [15:0] flag0=16'h0000;
	reg [15:0] flag1=16'hffff;
	
	reg [31:0] data_32bit;
	
	always @(data_16bit)
		begin
		if(!data_16bit[15]) data_32bit={flag0,data_16bit};
			else data_32bit={flag1,data_16bit};
		end

endmodule
