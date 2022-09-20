// This is the testbench module for testing the N bit multiplier

`timescale 1ns / 1ps
module multiplier_tb();
	
	// Defining the instance signals
	parameter N = 2;
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
	A = 2'b11;
	B = 2'b10;
	# 10;

	end 
endmodule
