module op_sub #(parameter N = 4) 
					  (input logic [N-1:0] A, B,
					  output logic [N-1:0] Z, output logic c_out);
					  
	logic [N:0] temp_z;
	
	assign temp_z = A - B;
	
	assign Z = temp_z[N-1:0];
	assign c_out = temp_z[N];
	
endmodule
	