module ImmGen(imm_in, imm_out, instruction_type);
	input [31:0] imm_in;
	input [1:0] instruction_type;
	output [31:0] imm_out;
	reg [31:0] imm_out_reg;

   assign imm_out = imm_out_reg;
	
   always @(imm_in)
		case(instruction_type)
			2'b01: imm_out_reg <= {{21{imm_in[31]}}, imm_in[30:20]}; //I-Type
			2'b10: imm_out_reg <= {{21{imm_in[31]}}, imm_in[30:25], imm_in[11:7]}; //S-Type
			2'b11: imm_out_reg <= {{20{imm_in[7]}}, imm_in[30:25], imm_in[11:8], {1{1'b0}}}; // B-Type
			default: imm_out_reg <= 32'bx;
		endcase
endmodule




