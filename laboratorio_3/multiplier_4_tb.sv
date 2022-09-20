// This is the testbench module for testing the N bit multiplier

`timescale 1ns / 1ps
module multiplier_4_tb();
	
	// Defining the instance signals
	parameter N = 4;
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
	A = 4'b1100;
	B = 4'b1000;
	# 10;
	A = 4'b1010;
	B = 4'b1011;
	# 10;
	A = 4'b1101;
	B = 4'b1111;
	# 10;
	A = 4'b0100;
	B = 4'b0001;
	# 10;

	end 
endmodule
