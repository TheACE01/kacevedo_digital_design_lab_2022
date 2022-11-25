module mux_21#(parameter N = 3)(input [N-1:0] A, B,
					input sel,
					output [N-1:0] C);
assign C = sel ? A : B;									
endmodule
