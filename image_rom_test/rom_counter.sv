module rom_counter (input clk, rst, en, input [9:0] x, y, output reg [15:0] Q);
	always_ff @ (posedge clk or negedge rst)
		if (!rst) Q = 16'd0;
		else begin
			if (x >= 0 && x <= 199 && y >= 0 && y <= 199) Q = Q + 1'b1;
			if (y >= 200) Q = 16'd0;
		end
endmodule
