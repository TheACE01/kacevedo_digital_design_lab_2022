// This is the testbench module for testing the N bit multiplier

`timescale 1ns / 1ps
module multiplier_tb();

	// Defining the instance signals
	parameter N = 4;
	logic [N-1:0] A, B;
	logic [(2*N)-1:0] S;


	// Instance of the Unit Under Test (UUD)
	multiplier #(.N(N)) uut(
	.A(A),
	.B(B),
	.Z(Z));

	// Testing the design module functinality
	initial begin
	A = 4'b1100;
	B = 4'b1011;
	# 10;
	A = 4'b1001;
	B = 4'b10;
	# 10;
	A = 4'b1101;
	B = 4'b1110;
	# 10;
	A = 4'b0100;
	B = 4'b0010;
	# 10;

	end 
endmodule
