// This is the testbench module for testing the N bit multiplier node

`timescale 1ns / 1ps
module multiplier_node_tb();
	
	// Defining the instance signals
	parameter N = 4, P = 0;
	logic [N-1:0] A, B;
	logic [(2*N)-1:0] S;

  
	// Instance of the Unit Under Test (UUD)
	multiplier_node #(.N(N), .P(P)) uut(
	.A(A),
	.B(B),
	.S(S));
	
	// Testing the design module functinality
	initial begin
	A = 4'b1011;
	B = 4'b0110;
	end 
endmodule
