/*

Module: ShiftRight Operation
Description: This module performs ShiftRight operation.
Notes: Shift operators require two operands. 
		 The operand before the operator contains data to be shifted and the operand after the operator contains the number of single bit shift operations to be performed.

*/

module shift_right #(parameter N = 4)(A, B, Z);
	input [N-1:0] A, B;
	output [N-1:0] Z;
	
	// Using the HDL operators
	// Shift Right, Arithmetic (keep sign)
	assign Z = A >> B;

			
endmodule 
	