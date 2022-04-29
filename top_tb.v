module top_tb (clk, reset, status, pcsrc, alusrc, aluop, mrw, wb, instr, regrw, immgen_ctrl);

	output reg clk, reset, pcsrc, alusrc, mrw, wb, regrw;
	output reg [3:0] aluop;
	output [31:0] instr;
	output [3:0] status;	
	output reg [1:0] immgen_ctrl;

	top t(clk, reset, status, pcsrc, alusrc, aluop, mrw, wb, instr, regrw, immgen_ctrl);
	
	initial begin
	
		clk <= 0;
		reset <= 0;
		#5
		reset <= 1;
		#5
		reset <= 0;
		#5
		
		//add
		regrw <= 1;
		alusrc <= 1;
		mrw <= 1;
		wb <= 0;
		pcsrc <= 0;
		immgen_ctrl <= 2'b00;
		aluop <= 4'b0010;
		#5
		clk <= 1;
		#5
		clk <= 0;
		
		
		//beq
		regrw <= 0;
		alusrc <= 0;
		mrw <= 0;
		wb <= 0;
		pcsrc <= 1;
		immgen_ctrl <= 2'b11;
		aluop <= 4'b0110;
		#5
		clk <= 1;
		#5
		clk <= 0;
		
		//lw
		regrw <= 1;
		alusrc <= 1;
		mrw <= 0;
		wb <= 0;
		pcsrc <= 0;
		immgen_ctrl <= 2'b01;
		aluop <= 4'b0010;
		#5
		clk <= 1;
		#5
		clk <= 0;
		
		//sw
		regrw <= 0;
		alusrc <= 1;
		mrw <= 1;
		wb <= 0;
		pcsrc <= 0;
		immgen_ctrl <= 2'b10;
		aluop <= 4'b0010;
		#5
		clk <= 1;
		#5
		clk <= 0;
		
		
	end
	
endmodule
