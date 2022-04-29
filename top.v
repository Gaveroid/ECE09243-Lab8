module top (clk, reset, status, pcsrc, alusrc, aluop, mrw, wb, instr, regrw, immgen_ctrl);

	input clk, reset, pcsrc, alusrc, mrw, wb, regrw;
	input [3:0] aluop;
	output [31:0] instr;
	output [3:0] status;	
	input [1:0] immgen_ctrl;
	
	wire [4:0] rd, rs1, rs2;
	wire [31:0] instr;
	
	wire [31:0] pc_in, pc_out, rom_out, ram_out, alu_out;
	wire [31:0] pc_addA_out, pc_addB_out;
	wire [31:0] pcmux_out;
	
	assign pc_in = pcmux_out;
	
	wire [31:0] rf_out1, rf_out2, immgen_out, alumux_out, alurammux_out;
	
	ProgramCounter pc(clk, reset, pc_in, pc_out);
	Adder32 addA(pc_out, 32'd4, pc_addA_out);
	Adder32 addB(pc_out, immgen_out, pc_addB_out);
	Mux2to1_32bit pcmux(pcsrc, pc_addA_out, pc_addB_out, pcmux_out);
	ROM rom(pc_out, rom_out);
	InstDecoder id(rom_out, rd, rs1, rs2, instr);
	Register rf(rf_out1, rf_out2, rs1, rs2, alurammux_out, rd, regrw, reset, clk);
	Mux2to1_32bit alumux(alusrc, rf_out2, immgen_out, alumux_out);
	ImmGen ig(instr, immgen_out, immgen_ctrl);
	ALU alu(rf_out1, alumux_out, aluop, 1'd0, alu_out, status);
	RAM ram(alu_out[7:0], mrw, clk, rf_out2, ram_out); 
	Mux2to1_32bit alurrammux(wb, ram_out, alu_out, alurammux_out);
	

endmodule

