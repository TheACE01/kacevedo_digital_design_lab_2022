module comparator (input [6:0] Current, Max, output Eq);
												
assign Eq = (Current > Max);

												
endmodule
