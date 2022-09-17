/*
Module: AND gate for N bit

Description: This module operates the AND gate with two input signals (N bits)
by using the behavioral model in System Verilog.
*/
module and_gate #(parameter N = 4)(A, B, Z);
	// parametric inputs
	input [N-1:0] A, B;
	// parametric output
	output [N-1:0] Z;
	// Create an intern variable to loop
	genvar i;
	// Using a loop we can connect every bit of both inputs and assing the outputs
	generate
		for(i = 0; i < N; i = i + 1) begin: or_for
			and_gate_1 Ui(.A(A[i]), .B(B[i]), .Z(Z[i]));
		end: or_for
	endgenerate
endmodule
