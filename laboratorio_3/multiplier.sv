
/*
Module: N bit Multiplier
Description: This module performs the multiply operation for N bits inputs.
*/

module multiplier #(parameter N = 4)(A, B, Z);
	input [N-1:0] A, B;
	output [N-1:0] Z;
	
	// Using the HDL operators
	assign Z = A * B;
	
endmodule
