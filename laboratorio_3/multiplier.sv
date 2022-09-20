/*

Module: N bit Multiplier

Description: This module performs the multiply operation for N bits inputs.

*/

module multiplier #(parameter N = 4)(A, B, S);

	input [3:0] A, B;
	output [7:0] S;
	
	// Intermediate wire
	wire [31:0] M;
	wire [39:0] Z;
	wire [4:0] C;
	
	
	genvar i;
	generate
		for (i=0; i < 4; i++) begin: multiplier_for_1
			
			multiplier_node #(.N(4), .P(i)) MNi(
			.A(A),
			.B(B),
			.S(M[(((2*4)*(i+1)))-1:(2*4)*i]));
		end
	endgenerate
	
	assign C[0] = 0;
	assign Z[7:0] = 0;
	
	sum_n_bit #(.N(8)) suma1(
	.a(M[7:0]),
	.b(Z[7:0]),
	.c_in(C[0]),
	.z(Z[15:8]),
	.c_out(C[1]));
	
	sum_n_bit #(.N(8)) suma2(
	.a(M[15:8]),
	.b(Z[15:8]),
	.c_in(C[1]),
	.z(Z[23:16]),
	.c_out(C[2]));
	
	sum_n_bit #(.N(8)) suma3(
	.a(M[23:16]),
	.b(Z[23:16]),
	.c_in(C[2]),
	.z(Z[31:24]),
	.c_out(C[3]));
	
	sum_n_bit #(.N(8)) suma4(
	.a(M[31:24]),
	.b(Z[31:24]),
	.c_in(C[3]),
	.z(Z[39:32]),
	.c_out(C[4]));
	
	assign S = Z[39:32];
	
	
endmodule
	
	
	

