module score_decoder(input logic [5:0] score, output logic [6:0] S0, S1);


	wire [3:0] digit0 = score % 10;
	wire [3:0] digit1 = score / 10;
	
	display_hex seg0(
		.A(digit0),
		.S(S0));
		
	display_hex seg1(
		.A(digit1),
		.S(S1));

endmodule
