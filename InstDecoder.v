module InstDecoder(inst, rd, rs1, rs2, instr);

	input [31:0] inst;
	output [4:0] rd, rs1, rs2;
	output [31:0] instr;
	
	assign rd = inst[11:7];
	assign rs1 = inst[19:15];
	assign rs2 = inst[24:20];
	assign instr = inst;
			
endmodule
