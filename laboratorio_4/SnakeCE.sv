module SnakeCE(
	input logic clk_50,
								key_up,
								key_down,
								key_right,
								key_left,
	
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

	// Wire to the Display area signal
	logic video_on;
	
	// Create an instance for the clock divider
	vga_clk clk_divider(.inclk0(clk_50), .c0(VGA_CLK));
	

	// Create an instance for the VGA Controller
	VGA_Controller VGA(.Clk(clk_50), .Reset(1'b0), .VGA_HS(VGA_HS), .VGA_VS(VGA_VS),      
									.VGA_CLK(VGA_CLK),     
									.VGA_BLANK_N(VGA_BLANK_N), 
									.VGA_SYNC_N(VGA_SYNC_N),
									.video_on(video_on),
									.DrawX(DrawX),       
									.DrawY(DrawY)      
									);
			
	// Wires for the entity controller from key controller
	logic Up, Down, Left, Right;
	logic enable_snake_paint [63:0];
	logic enable_food_paint;
	
	// Create an instance for the Entity Generator					
	entity_controller EG(
									.clk(clk_50),                            
									.reset(1'b0), 
									.enable_stage(1'b1),
									.x(DrawX),
									.y(DrawY),
									.sx(10'd128),
									.sy(10'd224),
									.fx(10'd512),
									.fy(10'd448),
								   .Up(Up) ,
									.Down(Down),
									.Right(Right),
									.Left(Left),
									.enable_snake_paint(enable_snake_paint),
									.enable_food_paint(enable_food_paint)
									);
								
	// Wire for the RGB VGA colors
	logic [7:0] R, G, B;	

	paint_controller PC(
									.video_on(video_on), 
									.stage(1'b1),
									.x(DrawX),
									.y(DrawY),  
									.enable_snake_paint(enable_snake_paint),
									.enable_food_paint(enable_food_paint),
									.R(R) ,
									.G(G), 
									.B(B)
									);
									
	// Define the VGA RBG color values
	assign VGA_R = R;
	assign VGA_G = G;
	assign VGA_B = B;
	 
	// Create an instance for the key controller
	key_controller KC(
								.clk(clk_50),                            
								.reset(1'b0),                         
								.key_up(key_up),
								.key_down(key_down),
								.key_right(key_right),
								.key_left(key_left),
								.Up(Up) ,
								.Down(Down),
								.Right(Right),
								.Left(Left)
								);
endmodule	
    
