`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:14 06/07/2022 
// Design Name: 
// Module Name:    Control_unit 
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
module Control_unit(op,func,RegDst,RegWrite,ALUSrc,MemtoReg,MemRead,MemWrite,Branch,ALU_op);
	input[5:0] op;
	input[5:0] func;
	output RegDst;
	output RegWrite;
	output ALUSrc;
	output MemtoReg;
	output MemRead;
	output MemWrite;
	output Branch;
	output[2:0] ALU_op;
	
	reg RegDst;
	reg RegWrite;
	reg ALUSrc;
	reg MemtoReg;
	reg MemRead;
	reg MemWrite;
	reg Branch;
	reg[2:0] ALU_op;
	
	always @(op,func)
	begin
		case(op)
			//R-type
			6'b000000: begin
						case(func)
						6'b100000: ALU_op=3'b000;
						6'b100010: ALU_op=3'b100;
						6'b100000: ALU_op=3'b000;
						6'b100100: ALU_op=3'b001;
						6'b100101: ALU_op=3'b101;
						6'b100110: ALU_op=3'b010;
						endcase
						RegDst=1;RegWrite=1;ALUSrc=0;MemWrite=0;MemRead=0;MemtoReg=0;Branch=0;
				
				end
			//lw
			6'b100011: begin 
						RegDst=0;RegWrite=1;ALUSrc=1;MemWrite=0;
						MemRead=1;MemtoReg=1;Branch=0;ALU_op=3'b000;
						end
			//sw,取什么都可以的变量直接取0
			6'b1010011: begin 
					RegDst=0;RegWrite=0;ALUSrc=1;MemWrite=1;
					MemRead=0;MemtoReg=0;Branch=0;ALU_op=3'b000;
					end
			//beq
			6'b000100: begin 
					RegDst=0;RegWrite=0;ALUSrc=0;MemWrite=0;
					MemRead=0;MemtoReg=0;Branch=1;ALU_op=3'b100; 
					end
			//lui
			6'b001111: begin 
					RegDst=0;RegWrite=1;ALUSrc=1;MemWrite=0;
					MemRead=0;MemtoReg=0;Branch=0;ALU_op=3'b110; 
					end
		endcase
	end

endmodule
