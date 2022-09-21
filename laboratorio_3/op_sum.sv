module op_sum #(parameter N = 4)
						(input logic [N-1:0] A, B, input logic c_in, 
						output logic [N-1:0] Z, output logic c_out);
	
	logic [N:0] temp_z;
	
	assign temp_z = A + B + c_in;
	
	assign Z = temp_z[N-1:0];
	assign c_out = temp_z[N];
	
	
endmodule
	