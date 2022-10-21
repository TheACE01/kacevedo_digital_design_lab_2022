module register_tb();

	parameter P = 4;
	reg clk, rst;
	reg [P-1:0] A, B;
	wire [P-1:0] AS, BS;