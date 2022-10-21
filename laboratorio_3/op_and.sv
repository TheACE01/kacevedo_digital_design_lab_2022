/*
Module: AND Operation
Description: This module performs AND operation for N-bit inputs.
*/

module op_and #(parameter N = 4)(A, B, Z);
	input [N-1:0] A, B;
	output [N-1:0] Z;
	
	// Using the HDL operators
	assign Z = A & B;
	
endmodule
