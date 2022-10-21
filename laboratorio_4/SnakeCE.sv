module SnakeCE(
	input logic clk_50,
								reset,
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
							  VGA_HS,      //VGA horizontal sync signal
							  
	output logic [6:0] Display0,
												Display1

);

	// Wire for the Horizontal and Vertical counter
	logic [9:0] DrawX, DrawY;

	// Wire to the Display area signal
	logic video_on;
	logic food_collision;
	logic game_over;
	
	logic enable_random_snake;
	logic enable_random_food;

	logic [9:0] fx, fy;
	logic [4:0] rand_x, rand_y;
	logic eq_x, eq_y;
	logic reset_game;
	logic stage;
	logic enable_score;
	logic [5:0] score;
	logic difficulty;
	

FSM_machine FSM(
									.clk(clk_50),
									.rst(!reset),
									.dificultad_normal(key_left),
									.dificultad_dificil(key_up),
									.food_collision(food_collision),
									.game_over( game_over),
									.en_s(enable_random_snake),
									.en_f(enable_random_food),
									.score(enable_score),
									.rst_game(reset_game),
									.stage(stage),
									.difficulty(difficulty)
									);
									
	counter SC(.clk(clk_50), .rst(reset_game), .en_f(enable_score), .score(score));
	score_decoder(.score(score), .S0(Display0), .S1(Display1));
		
	comparator comp_x(.Current(rand_x), .Max(5'b10011), .Eq(eq_x));
	counter pos_x(.clk(clk_50),  .rst(reset_game | eq_x),  .en_f(1'b1), .score(rand_x));
	
	comparator comp_y(.Current(rand_y), .Max(5'b01110), .Eq(eq_y));
	counter pos_y(.clk(clk_50),  .rst(reset_game | eq_y),  .en_f(1'b1), .score(rand_y));
	
	random_pos RF(.clk(clk_50), .en(enable_random_food), .count_x(rand_x), .count_y(rand_y), .pos_x(fx), .pos_y(fy));
	
	// Create an instance for the clock divider
	vga_clk clk_divider(.inclk0(clk_50), .c0(VGA_CLK));
	

	// Create an instance for the VGA Controller
	VGA_Controller VGA(.Clk(clk_50), .Reset(!reset), .VGA_HS(VGA_HS), .VGA_VS(VGA_VS),      
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
									.reset(reset_game), 
									.enable_stage(stage),
									.difficulty(difficulty),
									.x(DrawX),
									.y(DrawY),
									.sx(fy + 64),
									.sy(fy + 64),
									.fx(fx),
									.fy(fy),
								   .Up(Up) ,
									.Down(Down),
									.Right(Right),
									.Left(Left),
									.snake_parts(score),
									.enable_snake_paint(enable_snake_paint),
									.enable_food_paint(enable_food_paint),
									.food_collision(food_collision),
									.game_over( game_over)
									);
								
	// Wire for the RGB VGA colors
	logic [7:0] R, G, B;	
	


	paint_controller PC(
									.video_on(video_on), 
									.stage(stage),
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
								.reset(reset_game), 
								.stage(stage),
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
    
