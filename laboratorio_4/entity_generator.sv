

module entity_generator(
    input logic clk,                             // 50MHz from FPGA
								reset,                         // Push Button from FPGA
								video_on,                   // from VGA controller
								Up,
								Down,
								Right,
								Left,
    input logic  [9:0] x, y,                 // from VGA controller
    output logic [7:0] R , G, B       // to VGA controller
    );
    
    parameter X_MAX = 639;                             // right border of display area
    parameter Y_MAX = 479;                             // bottom border of display area
    parameter SQ_RGB = 24'hF1C40F;               // yellow color for the snake
    parameter BG_RGB = 24'h99A3A4;            //  background
    parameter SQUARE_SIZE = 80;                     // width of square sides in pixels
 
    // create a 60Hz refresh tick at the start of vsync 
    logic refresh_tick;
    assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0;
	 
    // square boundaries and position
    logic [9:0] sq_x_l, sq_x_r;              // square left and right boundary
    logic [9:0] sq_y_t, sq_y_b;              // square top and bottom boundary
    
    logic [9:0] sq_x_reg, sq_y_reg;           // regs to track left, top position
    logic [9:0] sq_x_next, sq_y_next;        // buffer wires
    
    logic [9:0] x_delta_reg, y_delta_reg;     // track square speed
    logic [9:0] x_delta_next, y_delta_next;   // buffer regs 

	
    
    // register control
    always_ff @(posedge clk or posedge reset)
        if(reset) begin
            sq_x_reg <= 0;
            sq_y_reg <= 0;
            x_delta_reg <= 10'h001;
            y_delta_reg <= 10'h001;
        end
        else begin
            sq_x_reg <= sq_x_next;
            sq_y_reg <= sq_y_next;
            x_delta_reg <= x_delta_next;
            y_delta_reg <= y_delta_next;
        end
    
    // square boundaries
    assign sq_x_l = sq_x_reg;                   // left boundary
    assign sq_y_t = sq_y_reg;                   // top boundary
    assign sq_x_r = sq_x_l + SQUARE_SIZE - 1;   // right boundary
    assign sq_y_b = sq_y_t + SQUARE_SIZE - 1;   // bottom boundary
	
    
    // Snake Paint Map
    logic sq_on;
    assign sq_on = (sq_x_l <= x) && (x <= sq_x_r) &&
                   (sq_y_t <= y) && (y <= sq_y_b);
						 
	// Horizontal lines Paint Map
	logic row_1;
	assign row_1 = (x >= 0 && x <= X_MAX && y >= 79 && y <= 81);
	
	logic row_2;
	assign row_2 = (x >= 0 && x <= X_MAX && y >= 159 && y <= 161);
     
	logic row_3;
	assign row_3 = (x >= 0 && x <= X_MAX && y >= 239 && y <= 241);

	logic row_4;
	assign row_4 = (x >= 0 && x <= X_MAX && y >= 319 && y <= 321);

	logic row_5;
	assign row_5 = (x >= 0 && x <= X_MAX && y >= 399 && y <= 401);	
	
	// Vertical lines Paint Map
	logic col_1;
	assign col_1 = (x >= 79 && x <= 81 && y >= 0 && y <= Y_MAX);	
	
	logic col_2;
	assign col_2 = (x >= 159 && x <= 161 && y >= 0 && y <= Y_MAX);
	
	logic col_3;
	assign col_3 = (x >= 239 && x <= 241 && y >= 0 && y <= Y_MAX);
	
	logic col_4;
	assign col_4 = (x >= 319 && x <= 321 && y >= 0 && y <= Y_MAX);
	
	logic col_5;
	assign col_5 = (x >= 399 && x <= 401 && y >= 0 && y <= Y_MAX);
	
	logic col_6;
	assign col_6 = (x >= 479 && x <= 481 && y >= 0 && y <= Y_MAX);
	
	logic col_7;
	assign col_7 = (x >= 559 && x <= 561 && y >= 0 && y <= Y_MAX);
	
	
   // new square position
    assign sq_x_next = (refresh_tick) ? sq_x_reg + x_delta_reg : sq_x_reg;
    assign sq_y_next = (refresh_tick) ? sq_y_reg + y_delta_reg : sq_y_reg;
    
    // new square velocity 
    always_comb  begin
        x_delta_next = x_delta_reg;
        y_delta_next = y_delta_reg;
		  
		  
		  // NODES CHECKPOINTS DETECTION
			// ROW 1 ***********************************************************************
			// Node # 0
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 0 && sq_x_r == 79) begin
				
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
			end
			
			// Node # 1
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 80 && sq_x_r == 159) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 2
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 160 && sq_x_r == 239) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 3
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 240 && sq_x_r == 319) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 4
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 320 && sq_x_r == 399) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 5
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 400 && sq_x_r == 479) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 6
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 480 && sq_x_r == 559) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 7
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 560 && sq_x_r == X_MAX) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			// END ROW 1 *******************************************************
			
			// ROW 2 ***********************************************************************
			// Node # 8
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 0 && sq_x_r == 79) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
			end
			
			// Node # 9
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 80 && sq_x_r == 159) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 10
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 160 && sq_x_r == 239) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 11
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 240 && sq_x_r == 319) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 12
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 320 && sq_x_r == 399) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 13
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 400 && sq_x_r == 479) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 14
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 480 && sq_x_r == 559) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 15
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 560 && sq_x_r == X_MAX) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			// END ROW 2 *******************************************************

			// ROW 3 ***********************************************************************
			// Node # 16
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 0 && sq_x_r == 79) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
			end
			
			// Node # 17
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 80 && sq_x_r == 159) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 18
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 160 && sq_x_r == 239) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 19
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 240 && sq_x_r == 319) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 20
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 320 && sq_x_r == 399) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 21
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 400 && sq_x_r == 479) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 22
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 480 && sq_x_r == 559) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 23
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 560 && sq_x_r == X_MAX) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			// END ROW 3 *******************************************************
			
			
			// ROW 4 ***********************************************************************
			// Node # 24
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 0 && sq_x_r == 79) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
			end
			
			// Node # 25
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 80 && sq_x_r == 159) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 26
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 160 && sq_x_r == 239) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 27
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 240 && sq_x_r == 319) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 28
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 320 && sq_x_r == 399) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 29
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 400 && sq_x_r == 479) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 30
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 480 && sq_x_r == 559) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 31
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 560 && sq_x_r == X_MAX) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			// END ROW 4 *******************************************************
			
			// ROW 5 ***********************************************************************
			// Node # 32
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 0 && sq_x_r == 79) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
			end
			
			// Node # 33
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 80 && sq_x_r == 159) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 34
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 160 && sq_x_r == 239) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 35
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 240 && sq_x_r == 319) begin
					if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 36
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 320 && sq_x_r == 399) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 37
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 400 && sq_x_r == 479) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 38
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 480 && sq_x_r == 559) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 39
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 560 && sq_x_r == X_MAX) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 1;	
				end
				else if (Right) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			// END ROW 5 *******************************************************
			
			
			// ROW 6 ***********************************************************************
			// Node # 40
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 0 && sq_x_r == 79) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 0;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
			end
			
			// Node # 41
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 80 && sq_x_r == 159) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 0;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 42
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 160 && sq_x_r == 239) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 0;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 43
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 240 && sq_x_r == 319) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 0;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 44
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 320 && sq_x_r == 399) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 0;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 45
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 400 && sq_x_r == 479) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 0;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 46
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 480 && sq_x_r == 559) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 0;	
				end
				else if (Right) begin
					x_delta_next = 1;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			
			// Node # 47
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 560 && sq_x_r == X_MAX) begin
				if (Up) begin
					x_delta_next = 0;
					y_delta_next = -1;
				end
				else if (Down) begin
					x_delta_next = 0;
					y_delta_next = 0;	
				end
				else if (Right) begin
					x_delta_next = 0;
					y_delta_next = 0;
				end
				else if (Left) begin
					x_delta_next = -1;
					y_delta_next = 0;
				end
			end
			// END ROW 6 *******************************************************
    end
    
    // RGB control for entities
    always_comb 
        if(~video_on)
            {R, G, B} = 24'h000000;          // black(no value) outside display area
				
				// PAINT SNAKE
				else if(sq_on)
                {R, G, B} = SQ_RGB; 
					 
				// PAINT ROWS
				else if (row_1 || row_2 || row_3 || row_4 || row_5)
					{R, G, B} = 24'h000000; 
					
				// PAINT ROWS
				else if (col_1 || col_2 || col_3 || col_4 || col_5 || col_6 || col_7)
					{R, G, B} = 24'h000000; 

            else
                {R, G, B}= BG_RGB;       // blue background
    
endmodule
