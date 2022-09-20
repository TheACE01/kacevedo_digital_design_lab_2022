// This is the testbench module for testing the N bit multiplier

`timescale 1ns / 1ps
module multiplier_6_tb();
	
	// Defining the instance signals
	parameter N = 6;
	logic [N-1:0] A, B;
	logic [(2*N)-1:0] S;
	logic O;

  
	// Instance of the Unit Under Test (UUD)
	multiplier_god #(.N(N)) uut(
	.A(A),
	.B(B),
	.S(S),
	.O(O));
	
	// Testing the design module functinality
	initial begin
	A = 6'b110010;
	B = 6'b100010;
	# 10;
	A = 6'b101011;
	B = 6'b101101;
	# 10;
	A = 6'b110101;
	B = 6'b111101;
	# 10;
	A = 6'b010000;
	B = 6'b000110;
	# 10;

	end 
endmodule
