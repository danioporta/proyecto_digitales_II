`timescale 	1ns	/ 100ps
module BUF(A, Y);
input A;
output Y;
assign Y = A;
endmodule

module NOT(A, Y);
input A;
output Y;
assign #3.3 Y = ~A;
endmodule

module NAND(A, B, Y);
input A, B;
output Y;
assign #9 Y = ~(A & B);
endmodule

module NOR(A, B, Y);
input A, B;
output Y;
assign #6 Y = ~(A | B);
endmodule

module DFF(C, D, Q);
input C, D;
output reg Q;
always @(posedge C)
	#6 Q <= D;
endmodule

module DFFSR(C, D, Q, S, R);
input C, D, S, R;
output reg Q;
always @(posedge C, posedge S, posedge R)
	if (S)
		Q <= 1'b1;
	else if (R)
		Q <= 1'b0;
	else
		Q <= D;
endmodule
