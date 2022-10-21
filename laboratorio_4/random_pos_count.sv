module random_pos_count (input clk, rst, output reg [6:0] pos);
												
always_ff @(posedge clk or posedge rst) 
	if(rst) 
		score = 8'h00;
	else
		score = score + 1'b1;

												
endmodule
