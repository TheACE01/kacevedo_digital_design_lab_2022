module random_pos(input clk, en, output reg [9:0] pos_x, pos_y);

always_ff @(posedge clk) 
	if(en) begin
		pos_x = ($urandom_range(0, 19) * 32)-1;
		pos_y = ($urandom_range(0, 14) * 32)-1;
	end
						
endmodule
