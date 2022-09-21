// This is the testbench module for testing the N bit XOR gate

`timescale 1ns / 1ps
module shift_right_tb();
	
	// Defining the instance signals
	parameter N = 4;
	logic [N-1:0] A, B, Z;

  
	// Instance of the Unit Under Test (UUD)
	shift_rifht #(.N(N)) uut(
	.A(A),
	.B(B),
	.Z(Z));
	
	// Testing the design module functinality
	initial begin
	A = 4'b1010;
	B = 4'b0110;
	# 10;
	end 
endmodule
