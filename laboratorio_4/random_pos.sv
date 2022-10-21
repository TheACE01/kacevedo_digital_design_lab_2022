module random_pos(input clk, en, input  [4:0] count_x, count_y, output reg [9:0] pos_x, pos_y);

always_ff @(posedge clk) 
	if(en) begin
		pos_x = (count_x * 32);
		pos_y = (count_y * 32);
	end
						
endmodule
