module ALU_FPGA(A, B, OP, D, N, Z, C, V);
	input [3:0] A, B, OP;
	output N, Z, C, V;
	output [6:0] D; // Output Display
	
	wire [3:0] S; // Connect ALU with decoder display
	
	ALU #(.P(4)) alu(.A(A), .B(B), .OP(OP), .S(S), .N(N), .Z(Z), .C(C), .V(V));
	
	display_hex display(.A3(S[3]), .A2(S[2]), .A1(S[1]), .A0(S[0]), .A(D[6]), .B(D[5]), .C(D[4]), .D(D[3]), .E(D[2]), .F(D[1]), .G(D[0]));
	
endmodule
	
