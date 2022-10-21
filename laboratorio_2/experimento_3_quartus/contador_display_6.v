module contador_display_6(clk, rst, S0, S1);

	input clk, rst;
	output [6:0] S0, S1;
	parameter N = 6;
	wire [5:0] count;
	

	contador_regresivo #(.N(N)) contador(
		.clk(clk),
		.rst(rst),
		.count(count)
	);
	
	wire [3:0] digit0 = count % 10;
	wire [3:0] digit1 = count / 10;
	
	display_hex seg0(
		.A3(digit0[3]),
		.A2(digit0[2]),
		.A1(digit0[1]),
		.A0(digit0[0]),
		.S(S0));
		
	display_hex seg1(
		.A3(digit1[3]),
		.A2(digit1[2]),
		.A1(digit1[1]),
		.A0(digit1[0]),
		.S(S1));

endmodule
