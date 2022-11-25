module top_module(
	input logic clk_50,
	input logic enable_vga,
	output logic [7:0]  VGA_R,        //VGA Red
							  VGA_G,        //VGA Green
							  VGA_B,        //VGA Blue
	output logic        VGA_CLK,      //VGA Clock
							  VGA_SYNC_N,   //VGA Sync signal
							  VGA_BLANK_N,  //VGA Blank signal
							  VGA_VS,       //VGA virtical sync signal
							  VGA_HS        //VGA horizontal sync signal
);

	logic [9:0] x, y;
	logic video_on;
	logic enable_v_counter;
	logic wren;
	
	logic [15:0] ram_counter_address;
	logic [23:0] ram_data;
	logic [15:0] address;
	logic [7:0] R, G, B;
	
	assign VGA_R = R;
	assign VGA_G = G;
	assign VGA_B = B;
	
	horizontal_counter HC(.clk_25(VGA_CLK),
								 .enable_v_counter(enable_v_counter), 
								 .h_counter(x));
								 
	vertical_counter VC(.clk_25(VGA_CLK),
							  .enable_v_counter(enable_v_counter), 
							  .v_counter(y));


	// Create an instance for the clock divider
	vga_clk clk_divider(.inclk0(clk_50), .c0(VGA_CLK));
	

	// Create an instance for the VGA Controller
	vga_controller VGA(.clk(clk_50),
							 .rst(1'b1),
							 .h_counter(x),
							 .v_counter(y),
							 .VGA_HS(VGA_HS), 
							 .VGA_VS(VGA_VS),      
							 .VGA_CLK(VGA_CLK),     
							 .VGA_BLANK_N(VGA_BLANK_N), 
							 .VGA_SYNC_N(VGA_SYNC_N),
							 .video_on(video_on));
	
	
	ram RAM(
	.address(address),
	.clock(VGA_CLK),
	.data(24'b0),
	.wren(1'b0),
	.q(ram_data));
				
	ram_vga_counter RAM_C(.clk(VGA_CLK), 
								.rst(1'b1),
								.x(x),
								.y(y),
								.Q(ram_counter_address));
									
	renderizer IR(.video_on(video_on),
			          .rgb_pixel(ram_data),
						 .x(x), 
						 .y(y),
						 .R(R), 
						 .G(G), 
						 .B(B));
						 
	mux_21 #(.N(16)) mux_addr(ram_counter_address, 16'd0, enable_vga , address);
endmodule	
    