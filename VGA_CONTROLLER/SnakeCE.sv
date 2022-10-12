module SnakeCE(
	input logic clk_50,
	
	// VGA Interface 
	output logic [7:0]  VGA_R,        //VGA Red
							  VGA_G,        //VGA Green
							  VGA_B,        //VGA Blue
	output logic        VGA_CLK,      //VGA Clock
							  VGA_SYNC_N,   //VGA Sync signal
							  VGA_BLANK_N,  //VGA Blank signal
							  VGA_VS,       //VGA virtical sync signal
							  VGA_HS        //VGA horizontal sync signal
);

	// Wire for the Horizontal and Vertical counter
	logic [9:0] DrawX, DrawY;

	// Create an instance for the clock divider
	vga_clk clk_divider(.inclk0(clk_50), .c0(VGA_CLK));
	

	// Create an instance for the VGA Controller
	VGA_Controller VGA(.Clk(clk_50), .Reset(1'b0), .VGA_HS(VGA_HS), .VGA_VS(VGA_VS),      
									.VGA_CLK(VGA_CLK),     
									.VGA_BLANK_N(VGA_BLANK_N), 
									 .VGA_SYNC_N(VGA_SYNC_N),                               
									.DrawX(DrawX),       
									.DrawY(DrawY)      
									);
								
						
	// only output the colors if the counters are within the adressable video time constraints
	assign VGA_R = (DrawX < 640 && DrawY < 480) ? 8'hFF : 8'h00;
	assign VGA_B = (DrawX < 640 && DrawY < 480) ? 8'h00 : 8'h00;
	assign VGA_G = (DrawX < 640 && DrawY < 480) ? 8'hFF : 8'h00;	
								
endmodule	
    
