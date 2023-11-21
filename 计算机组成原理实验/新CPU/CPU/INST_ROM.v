`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:35:57 12/17/2017 
// Design Name: 
// Module Name:    INST_ROM 
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
module INST_ROM(
	 input [31:0] addr,
	 output [31:0] Inst
    );
	 
	 wire [31:0] ram [31:0];
	 assign ram[5'h00]=0; 
	 assign ram[5'h01]=32'h3c010001;    				
	 assign ram[5'h02]=32'h3c020002;    
	 assign ram[5'h03]=32'h00411422; 
	 assign ram[5'h04]=32'h00233022;	 
	 assign ram[5'h04]=32'h00233022;	 
	 assign ram[5'h05]=32'h8c640001;    
	 assign ram[5'h06]=32'hac640002;    
 	 assign ram[5'h07]=32'h00234020;    
	 assign ram[5'h08]=32'h00222822;    
	 assign ram[5'h09]=32'h00233025;    
	 assign ram[5'h0a]=32'h00223826;
	 assign ram[5'h0b]=32'h10220000;
	 assign ram[5'h0c]=32'h10230004;	 
	 assign Inst=ram[addr[6:2]];

endmodule
