module image_rom(
	input logic clk_50,
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
	logic [15:0] rom_address;
	logic [23:0] rom_data;
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
	
	
	rom ROM1(.address(rom_address),
				.clock(VGA_CLK),
				.q(rom_data));
				
	rom_counter RC(.clk(VGA_CLK),
								   .rst(1'b1),
									.x(x),
									.y(y),
									.Q(rom_address));
									
	image_render IR(.video_on(video_on),
			          .rgb_pixel(rom_data),
						 .x(x), 
						 .y(y),
						 .R(R), 
						 .G(G), 
						 .B(B)
		);
endmodule	
    