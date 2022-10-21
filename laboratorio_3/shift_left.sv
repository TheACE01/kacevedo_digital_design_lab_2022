/*

Module: ShiftLeft Operation
Description: This module performs ShiftLeft operation.
Notes: Shift operators require two operands. 
		 The operand before the operator contains data to be shifted and the operand after the operator contains the number of single bit shift operations to be performed.


*/

module shift_left #(parameter N = 4)(A, B, Z);
	input [N-1:0] A, B;
	output [N-1:0] Z;
	
	// Using the HDL operators
	// Shift Left, Arithmetic (keep sign)
	assign Z = A << B;

			
endmodule 
	