/*
Module: OR Operation
Description: This module performs OR operation for N-bit inputs.
*/

module op_or #(parameter N = 4)(A, B, Z);
	input [N-1:0] A, B;
	output [N-1:0] Z;
	
	// Using the HDL operators
	assign Z = A | B;
	
endmodule
