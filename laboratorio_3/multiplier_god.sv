/*

Module: N bit Multiplier

Description: This module performs the multiply operation for N bits inputs
A = N bit input
B = N bit input
S = 2*N bit output
O = Overflow Flag.

*/

module multiplier_god #(parameter N = 4)(A, B, S, O);

	// Defining the signals using the parameter
	input [N-1:0] A, B;
	output [(2*N)-1:0] S;
	output O;
	
	wire [(2*N*N)-1:0] M; // stores the and operation
	wire [((2*N)*(N+1))-1:0] Z; // stores the intermediate sums and final value
	wire [N:0] C; // Vector to connect carries between full_Adders
	
	
	// Loop to generate the AND modules and perform the first stage --> Multiply and shift left
	genvar i;
	generate
		for (i=0; i < N; i++) begin: multiplier_for_1
			
			multiplier_node #(.N(N), .P(i)) MNi(
			.A(A),
			.B(B),
			.S(M[(((2*N)*(i+1)))-1:(2*N)*i]));
		end
	endgenerate
	
	assign C[0] = 0; // Set the carry in for the first full_adder
	assign Z[(2*N)-1:0] = 0; // Set the first sum output to zero --> A + 0 = A
	
	// Loop to generate the sum over the intermediate values
	genvar j;
	generate
		for (j=0; j < N; j++) begin: multiplier_for_2
		
			sum_n_bit #(.N(2*N)) sumj(
			.a(M[(((2*N)*(j+1)))-1:(2*N)*j]),
			.b(Z[(((2*N)*(j+1)))-1:(2*N)*j]),
			.c_in(C[j]),
			.z(Z[(((2*N)*(j+2)))-1:(2*N)*(j+1)]),
			.c_out(C[j+1]));
					
		end
	endgenerate
	
	assign S = Z[((2*N)*(N+1))-1:(2*N)*N]; // Get the final value from the vector
	assign O = C[N]; // Get the Module's Flag or the Overflow
	
	
endmodule
	
	
	

