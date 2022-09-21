module op_div #(parameter N = 4)
						(input logic [N-1:0] A, B,
						output logic [N-1:0] Z);
						
	assign Z = A / B;
	
endmodule

