module Register(A, B, SA, SB, D, DA, W, rst, clk);
	input [4:0] SA, SB, DA;//Select A-A Address,Select B-B Address, Data Destination addy
	input W, clk, rst;//Write enable
	output [31:0] A, B; //A bus, B bus
	input [31:0] D; //Data input
	wire [31:0] load_enable;
	

	
	wire [31:0] R0, R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,
	R27,R28,R29,R30,R31;
	
	Decoder dcode (DA, W,load_enable);
	
	
	comparch_lab3 reg0 (R0, D, clk, rst, load_enable[0]);
	comparch_lab3 reg1 (R1, D, clk, rst, load_enable[1]);
	comparch_lab3 reg2 (R2, D, clk, rst,load_enable[2]);
	comparch_lab3 reg3 (R3, D, clk, rst,load_enable[3]);
	comparch_lab3 reg4 (R4, D, clk, rst,load_enable[4]);
	comparch_lab3 reg5 (R5, D, clk, rst,load_enable[5]);
	comparch_lab3 reg6 (R6, D, clk, rst,load_enable[6]);
	comparch_lab3 reg7 (R7, D, clk, rst,load_enable[7]);
	comparch_lab3 reg8 (R8, D, clk, rst,load_enable[8]);
	comparch_lab3 reg9 (R9, D, clk, rst,load_enable[9]);
	comparch_lab3 reg10 (R10, D, clk, rst,load_enable[10]);
	comparch_lab3 reg11 (R11, D, clk, rst,load_enable[11]);
	comparch_lab3 reg12 (R12, D, clk, rst,load_enable[12]);
	comparch_lab3 reg13 (R13, D, clk, rst,load_enable[13]);
	comparch_lab3 reg14 (R14, D, clk, rst,load_enable[14]);
	comparch_lab3 reg15 (R15, D, clk, rst,load_enable[15]);
	comparch_lab3 reg16 (R16, D, clk, rst,load_enable[16]);
	comparch_lab3 reg17 (R17, D, clk, rst,load_enable[17]);
	comparch_lab3 reg18 (R18, D, clk, rst,load_enable[18]);
	comparch_lab3 reg19 (R19, D, clk, rst,load_enable[19]);
	comparch_lab3 reg20 (R20, D, clk, rst,load_enable[20]);
	comparch_lab3 reg21 (R21, D, clk, rst,load_enable[21]);
	comparch_lab3 reg22 (R22, D, clk, rst,load_enable[22]);
	comparch_lab3 reg23 (R23, D, clk, rst,load_enable[23]);
	comparch_lab3 reg24 (R24, D, clk, rst,load_enable[24]);
	comparch_lab3 reg25 (R25, D, clk, rst,load_enable[25]);
	comparch_lab3 reg26 (R26, D, clk, rst,load_enable[26]);
	comparch_lab3 reg27 (R27, D, clk, rst,load_enable[27]);
	comparch_lab3 reg28 (R28, D, clk, rst,load_enable[28]);
	comparch_lab3 reg29 (R29, D, clk, rst,load_enable[29]);
	comparch_lab3 reg30 (R30, D, clk, rst,load_enable[30]);
	//comparch_lab3 reg31 (R31, D, clk, rst,load_enable[31]);
	assign R31 = 32'b0;
	
	Mux32to1_5bit muxA (A,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31, SA);
	Mux32to1_5bit muxB (B,R0, R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31, SB);
endmodule

module Decoder(select, enable, x);

	input [4:0] select;
	input enable;
	
	output reg [31:0] x;
	
	always @(select)
	begin
		if (enable==1)
			case (select)
				5'd0: x <= 32'b00000000000000000000000000000001;
				5'd1: x <= 32'b00000000000000000000000000000010;
				5'd2: x <= 32'b00000000000000000000000000000100;
				5'd3: x <= 32'b00000000000000000000000000001000;
				5'd4: x <= 32'b00000000000000000000000000010000;
				5'd5: x <= 32'b00000000000000000000000000100000;
				5'd6: x <= 32'b00000000000000000000000001000000;
				5'd7: x <= 32'b00000000000000000000000010000000;
				5'd8: x <= 32'b00000000000000000000000100000000;
				5'd9: x <= 32'b00000000000000000000001000000000;
				5'd10: x <= 32'b00000000000000000000010000000000;
				5'd11: x <= 32'b00000000000000000000100000000000;
				5'd12: x <= 32'b00000000000000000001000000000000;
				5'd13: x <= 32'b00000000000000000010000000000000;
				5'd14: x <= 32'b00000000000000000100000000000000;
				5'd15: x <= 32'b00000000000000001000000000000000;
				5'd16: x <= 32'b00000000000000010000000000000000;
				5'd17: x <= 32'b00000000000000100000000000000000;
				5'd18: x <= 32'b00000000000001000000000000000000;
				5'd19: x <= 32'b00000000000010000000000000000000;
				5'd20: x <= 32'b00000000000100000000000000000000;
				5'd21: x <= 32'b00000000001000000000000000000000;
				5'd22: x <= 32'b00000000010000000000000000000000;
				5'd23: x <= 32'b00000000100000000000000000000000;
				5'd24: x <= 32'b00000001000000000000000000000000;
				5'd25: x <= 32'b00000010000000000000000000000000;
				5'd26: x <= 32'b00000100000000000000000000000000;
				5'd27: x <= 32'b00001000000000000000000000000000;
				5'd28: x <= 32'b00010000000000000000000000000000;
				5'd29: x <= 32'b00100000000000000000000000000000;
				5'd30: x <= 32'b01000000000000000000000000000000;
				5'd31: x <= 32'b10000000000000000000000000000000;
			endcase
			else if (enable==0) x <= 32'b00000000000000000000000000000000;
	end
	
endmodule

module Mux32to1_5bit(o, i0, i1, i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31, s);
   input [31:0] i0, i1, i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,
	i29,i30,i31;
   input [4:0] s;
	
   output reg [31:0] o;
 
	always @*
	begin
		case (s)
			5'b00000 : o <= i0;
			5'b00001 : o <= i1;
			5'b00010 : o <= i2;
			5'b00011 : o <= i3;
			5'b00100 : o <= i4;
			5'b00101 : o <= i5;
			5'b00110 : o <= i6;
			5'b00111 : o <= i7;
			5'b01000 : o <= i8;
			5'b01001 : o <= i9;
			5'b01010 : o <= i10;
			5'b01011 : o <= i11;
			5'b01100 : o <= i12;
			5'b01101 : o <= i14;
			5'b01110 : o <= i15;
			5'b01111 : o <= i16;
			5'b10000 : o <= i17;
			5'b10001 : o <= i18;
			5'b10010 : o <= i19;
			5'b10011 : o <= i20;
			5'b10100 : o <= i21;
			5'b10101 : o <= i22;
			5'b10110 : o <= i23;
			5'b10111 : o <= i24;
			5'b11000 : o <= i25;
			5'b11010 : o <= i26;
			5'b11011 : o <= i27;
			5'b11100 : o <= i28;
			5'b11101 : o <= i29;
			5'b11110 : o <= i30;
			5'b11111 : o <= i31;
		  default : o <= 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
		endcase
	end
endmodule

module comparch_lab3(out, in, clk, rst,load);
	parameter N=32;
	input [N-1:0] in; 
	input load, clk, rst;
	
	output reg [31:0] out; 
	
	always @(posedge clk or posedge rst)begin 
		if (rst==1) 
			out <= 0;
	
	
		else if (load==1) 
			out <=	in;
		else
			out <= out;
	end
	
endmodule 
	