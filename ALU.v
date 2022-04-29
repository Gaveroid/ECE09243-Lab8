module ALU (A, B, FS, C0, F, status);
	input [31:0] A,B;
	input C0;
	input [3:0] FS;
	output [31:0] F;
	output [3:0] status;
	
	wire Z,N,C,V;
	wire temp;
	assign status= {V,C,N,Z};
	wire [31:0] A, B;
	
	assign N=F[31];
	assign Z= (F== 32'b0) ? 1'b1 : 1'b0 ;
	assign V = ((~A[31])&(~B[31])&F[31])|(A[31] & B[31] &(~F[31]));
	
	
	wire [31:0]and_out, or_out, xor_out, nor_out, add_out, left_out, right_out, i7;
	assign and_out = A & B;
	assign or_out = A | B;
	assign xor_out = A ^ B;
	assign nor_out = ~(A | B);
	
	AdderALU adderboi (A, B, C0,add_out, C);
	
	Shifter shiftboi (A, B[4:0], left_out, right_out);
	
	assign i7= 32'b0;
	
	mux8 mainmux (F, and_out, or_out, xor_out, nor_out, add_out, left_out, right_out,i7, FS[2:0]);
endmodule 

module Shifter(a, b, left_shift, right_shift);

	input [31:0] a;
	input [4:0] b;
	
	output [31:0] left_shift;
	output [31:0] right_shift;
	
	assign left_shift = a << b;
	assign right_shift = a>>b;
	
endmodule 

module AdderALU(A, B, Cin, S, Cout);
	 input [31:0] A, B; 
	 input Cin;
	 output [31:0] S; 
	 output Cout;
	 
	 wire [32:0] carry;
	 assign carry[0] = Cin;
	 assign Cout= carry[32];
	 
	 genvar i;
	 generate 
	 for (i=0; i<=31; i=i+1) begin: full_adders
		Full_Adder adder_inst (A[i], B[i], carry[i], S[i], carry[i+1]);
	end 
	endgenerate 
	
endmodule
	 
module Full_Adder(A,B,Cin, S, Cout);
	input A,B,Cin;
	output S, Cout;
	
//	assign S = A ^ B ^ Cin;
	//assign Cout= A&B + A&Cin + B&Cin;
	assign {Cout, S} = A+B+Cin;
endmodule 

module mux8(o,i0,i1,i2,i3,i4,i5,i6,i7,s);
	input [2:0] s;
	input [31:0]i0,i1,i2,i3,i4,i5,i6,i7;
	output reg [31:0] o;
	
	always @*
	begin 
		case(s)
			3'd0:o=i0;
			3'd1:o=i1;
			3'd2:o=i2;
			3'd3:o=i3;
			3'd4:o=i4;
			3'd5:o=i5;
			3'd6:o=i6;
			3'd7:o=i7;
		endcase
	end 
	
endmodule 