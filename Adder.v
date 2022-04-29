module Adder(A, B, out);

	input [7:0] A, B;
	output [7:0] out;
	
	assign out = A + B;
	
endmodule

module Adder32(A, B, out);

	input [31:0] A, B;
	output [31:0] out;
	
	assign out = A + B;
	
endmodule
