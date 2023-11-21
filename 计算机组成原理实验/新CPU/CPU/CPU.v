`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:43 06/16/2022 
// Design Name: 
// Module Name:    CPU 
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
module CPU(Clock,Reset,addr,result);
input Clock,Reset;
	output [31:0] addr;
	output [31:0] result;
	
	reg [31:0] addr;
	reg [31:0] result;
	wire [31:0] PC_addr;
	wire [31:0] PC;
	wire [31:0] extender1;
	wire [4:0] mux5;
	wire [31:0] mux32_1;
	wire [31:0] mux32_2;
	wire [31:0] alu;
	wire RegDst;
	wire RegWrite;
	wire ALUSrc;
	wire MemtoReg;
	wire MemRead;
	wire MemWrite;
	wire Branch;
	wire [2:0] ALU_op;
	wire [31:0] regA,regB;
	wire [31:0] data_mem;
	wire Z,B;
	Fetch f1(.clock(Clock),.reset(Reset),.B_addr(extender1),.Z(Z),.B(B),.addr(PC_addr));
	INST_ROM ins(.addr(PC_addr),.Inst(PC));
	Extend extend1(.data_16bit(PC[15:0]),.data_32bit(extender1));
	MUX5_2_1 mux1(.inl1(PC[20:16]),.inl2(PC[15:11]),.sign1(RegDst),.sel1(mux5));
	registers reg1(.clock(Clock),.wr(RegWrite),.wr_register_no(mux5),.wr_data(mux32_2),.A_add(PC[25:21]),.B_add(PC[20:16]),.A(regA),.B(regB));
	Control_unit control1(.op(PC[31:26]),.func(PC[5:0]),.RegDst(RegDst),.RegWrite(RegWrite),.ALUSrc(ALUSrc),.MemtoReg(MemtoReg),.MemRead(MemRead),.MemWrite(MemWrite),.Branch(Branch),.ALU_op(ALU_op));
	MUX32_2_1 mux2(.in1(regB),.in2(extender1),.sign(ALUSrc),.sel(mux32_1));
	ALU alu1(.a(regA),.b(mux32_1),.op(ALU_op),.result(alu),.zero(Z));
	DATA_RAM data1(.Clock(Clock),.dataout(data_mem), .datain(regB),.addr(alu),.write(MemWrite),.read(MemRead));
	MUX32_2_1 mux3(.in1(alu),.in2(data_mem),.sign(MemtoReg),.sel(mux32_2));
	always @ (posedge Clock)
	begin
		result=alu;
		addr=PC_addr;
	end

endmodule
