/*
Module: XOR gate for 1 bit

Description: This module operates the XOR gate with two input signals (1 bit)
by using the behavioral model in System Verilog.
*/
module xor_gate_1(A, B, Z);
	// Module inputs
	input logic A, B;
	// Module outputs
	output logic Z;
	// Using behavioral model to define the output variable
	assign Z = A ^ B;
endmodule
