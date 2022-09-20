module sum_1_bit (input logic a, b, c_in,
						output logic z, c_out);

	assign z = (~a & b & ~c_in) | 
	(a & ~b & ~c_in) |
	(~a & ~b & c_in) | 
	(a & b & c_in);
	
	assign c_out = (a & b & ~c_in) | 
	(~a & b & c_in) |
	(a & ~b & c_in) | 
	(a & b & c_in);
	
endmodule
