module Mux2to1_8bit (F, A, B, out);

	input F;
	input [7:0] A, B;
	output reg [7:0] out;
	
	always@(*) begin
		if (F == 0) begin
			out <= A;
		end
		else if (F == 1) begin
			out <= B;
		end
	end

endmodule

module Mux2to1_32bit (F, A, B, out);

	input F;
	input [31:0] A, B;
	output reg [31:0] out;
	
	always@(*) begin
		if (F == 0) begin
			out <= A;
		end
		else if (F == 1) begin
			out <= B;
		end
	end

endmodule
