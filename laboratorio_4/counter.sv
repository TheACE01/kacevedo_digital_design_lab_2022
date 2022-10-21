module counter (input clk, rst, en_f, output reg [5:0] score);
												
always_ff @(negedge clk or posedge rst) 
	if(rst) 
		score = 6'h00;
	else
		if (en_f)
			score = score + 1'b1;

												
endmodule
