module sum_n_bit #(parameter N = 6)
						(input logic [N-1:0] a, b, input logic c_in, 
						output logic [N-1:0] z, output logic c_out);

	wire [N:0] carrys;
	assign carrys[0] = c_in;
	
	generate
		genvar i;
		for (i = 0; i < N; i = i+1) begin : for_loop
			sum_1_bit sum(a[i], b[i], carrys[i], z[i], carrys[i+1]);
		end
		
	endgenerate
	
	assign c_out = carrys[N];
	
endmodule
	