// This is the testbench module for testing the N bit AND gate

`timescale 1ns / 1ps
module and_gate_tb();
	
	// Defining the instance signals
	parameter N = 6;
	logic [N-1:0] A, B, Z;

  
	// Instance of the Unit Under Test (UUD)
	and_gate #(.N(N)) uut(
	.A(A),
	.B(B),
	.Z(Z));
	
	// Testing the design module functinality
	initial begin
	A = 6'b101010;
	B = 6'b010110;
	# 10;
	end 
endmodule
