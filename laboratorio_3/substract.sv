/*

Module: XOR Operation
Description: This module performs XOR operation for N-bit inputs.

*/

module substract #(parameter N = 4)(A, B, Z);
	input [N-1:0] A, B;
	output [N-1:0] Z;
	
	// Using the HDL operators
	assign Z = A - B;
	
endmodule
	