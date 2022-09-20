
module multiplier_node #(parameter N = 4, P = 0)(A, B, S);

	input [N-1:0] A, B;
	output [(2*N)-1:0] S;
	
	wire [(N+P)-1:0] m;
	
	assign m = {N{B[P]}} & A[N-1:0];
	assign S = m<<P;
	
endmodule
	