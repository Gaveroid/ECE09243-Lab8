module ROM (addy,inst);
	input [31:0] addy;
	output reg [31:0]inst;
	
	always@(addy) begin //always@(posedge clk) begin
	
		case(addy)
			32'h0: inst= 32'h00450693;
			32'h4: inst= 32'h00100713;
			32'h8: inst= 32'h00b76463;
			32'h10: inst= 32'h0006a803;
			32'hc: inst= 32'h00008067;
			32'h14: inst= 32'h00068613;
			32'h18: inst= 32'h00070793;
			32'h1c: inst= 32'hffc62883;
			32'h20: inst= 32'h01185a63;
			32'h24: inst= 32'h01162023;
			32'h28: inst= 32'hfff78793;
			32'h2c: inst= 32'hffc60613;
			32'h30: inst= 32'hfe0796e3;
			32'h34: inst= 32'h00279793;
			32'h38: inst= 32'h00f50763;
			32'h3c: inst= 32'h0107a023;
			32'h40: inst= 32'h00170713;
			32'h44: inst= 32'h00468693;
			32'h48: inst= 32'hfc1ff06f;
			endcase
		end
endmodule 
			
			