module ram_vga_counter (input clk, rst, input [9:0] x, y, output reg [15:0] Q);
	always_ff @ (posedge clk or negedge rst)
		if (!rst) Q = 16'd1;
		else begin
			if (x >= 0 && x <= 199 && y >= 0 && y <= 119) Q = Q + 1'b1;
			if (y >= 120) Q = 16'd1;
		end
endmodule