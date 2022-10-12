

module entity_generator(
    input logic clk,                             // 50MHz from FPGA
								reset,                         // Push Button from FPGA
								video_on,                   // from VGA controller
    input logic  [9:0] x, y,                 // from VGA controller
    output logic [7:0] R , G, B,         // to VGA controller
	 output logic checkpoint_on        // The exact moment when the snake head is on a node    
    );
    
    parameter X_MAX = 639;                             // right border of display area
    parameter Y_MAX = 479;                             // bottom border of display area
    parameter SQ_RGB = 24'hF1C40F;               // yellow color for the snake
    parameter BG_RGB = 24'h99A3A4;            //  background
    parameter SQUARE_SIZE = 80;                     // width of square sides in pixels
    parameter SQUARE_VELOCITY_POS = 1;      // set position change value for positive direction
    parameter SQUARE_VELOCITY_NEG = -1;     // set position change value for negative direction 
	                

    
    // create a 60Hz refresh tick at the start of vsync 
    logic refresh_tick;
    assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0;
	 
	 // Create a buffer for the node checkpoint
	 logic checkpoint_on_next;
    
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
				checkpoint_on <= 0;
        end
        else begin
            sq_x_reg <= sq_x_next;
            sq_y_reg <= sq_y_next;
            x_delta_reg <= x_delta_next;
            y_delta_reg <= y_delta_next;
				checkpoint_on <=  checkpoint_on_next;
        end
    
    // square boundaries
    assign sq_x_l = sq_x_reg;                   // left boundary
    assign sq_y_t = sq_y_reg;                   // top boundary
    assign sq_x_r = sq_x_l + SQUARE_SIZE - 1;   // right boundary
    assign sq_y_b = sq_y_t + SQUARE_SIZE - 1;   // bottom boundary
	
    
    // Snake Paint Status
    logic sq_on;
    assign sq_on = (sq_x_l <= x) && (x <= sq_x_r) &&
                   (sq_y_t <= y) && (y <= sq_y_b);
                   
    // new square position
    assign sq_x_next = (refresh_tick) ? sq_x_reg + x_delta_reg : sq_x_reg;
    assign sq_y_next = (refresh_tick) ? sq_y_reg + y_delta_reg : sq_y_reg;
    
    // new square velocity 
    always_comb  begin
        x_delta_next = x_delta_reg;
        y_delta_next = y_delta_reg;
		  
		  checkpoint_on_next =  0;
		  
		  // NODES CHECKPOINTS DETECTION
			// ROW 1 ***********************************************************************
			// Node # 0
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 0 && sq_x_r == 79) begin
				x_delta_next = SQUARE_VELOCITY_POS;
				y_delta_next = 0;
				checkpoint_on_next = 1;
			end
			
			// Node # 1
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 80 && sq_x_r == 159) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 2
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 160 && sq_x_r == 239) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 3
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 240 && sq_x_r == 319) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 4
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 320 && sq_x_r == 399) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 5
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 400 && sq_x_r == 479) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 6
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 480 && sq_x_r == 559) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 7
			if (sq_y_t == 0 && sq_y_b == 79 && sq_x_l == 560 && sq_x_r == X_MAX) begin
				x_delta_next = 0;
				y_delta_next = SQUARE_VELOCITY_POS;
				checkpoint_on_next = 1;
			end
			// END ROW 1 *******************************************************
			
			// ROW 2 ***********************************************************************
			// Node # 8
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 0 && sq_x_r == 79) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 9
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 80 && sq_x_r == 159) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 10
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 160 && sq_x_r == 239) begin
					checkpoint_on_next = 1;
			end
			
			// Node # 11
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 240 && sq_x_r == 319) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 12
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 320 && sq_x_r == 399) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 13
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 400 && sq_x_r == 479) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 14
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 480 && sq_x_r == 559) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 15
			if (sq_y_t == 80 && sq_y_b == 159 && sq_x_l == 560 && sq_x_r == X_MAX) begin
				checkpoint_on_next = 1;
			end
			// END ROW 2 *******************************************************

			// ROW 3 ***********************************************************************
			// Node # 16
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 0 && sq_x_r == 79) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 17
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 80 && sq_x_r == 159) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 18
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 160 && sq_x_r == 239) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 19
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 240 && sq_x_r == 319) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 20
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 320 && sq_x_r == 399) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 21
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 400 && sq_x_r == 479) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 22
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 480 && sq_x_r == 559) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 23
			if (sq_y_t == 160 && sq_y_b == 239 && sq_x_l == 560 && sq_x_r == X_MAX) begin
				checkpoint_on_next = 1;
			end
			// END ROW 3 *******************************************************
			
			
			// ROW 4 ***********************************************************************
			// Node # 24
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 0 && sq_x_r == 79) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 25
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 80 && sq_x_r == 159) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 26
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 160 && sq_x_r == 239) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 27
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 240 && sq_x_r == 319) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 28
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 320 && sq_x_r == 399) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 29
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 400 && sq_x_r == 479) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 30
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 480 && sq_x_r == 559) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 31
			if (sq_y_t == 240 && sq_y_b == 319 && sq_x_l == 560 && sq_x_r == X_MAX) begin
				checkpoint_on_next = 1;
			end
			// END ROW 4 *******************************************************
			
			// ROW 5 ***********************************************************************
			// Node # 32
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 0 && sq_x_r == 79) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 33
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 80 && sq_x_r == 159) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 34
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 160 && sq_x_r == 239) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 35
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 240 && sq_x_r == 319) begin
					checkpoint_on_next = 1;
			end
			
			// Node # 36
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 320 && sq_x_r == 399) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 37
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 400 && sq_x_r == 479) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 38
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 480 && sq_x_r == 559) begin
					checkpoint_on_next = 1;
			end
			
			// Node # 39
			if (sq_y_t == 320 && sq_y_b == 399 && sq_x_l == 560 && sq_x_r == X_MAX) begin
				checkpoint_on_next = 1;
			end
			// END ROW 5 *******************************************************
			
			
			// ROW 6 ***********************************************************************
			// Node # 40
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 0 && sq_x_r == 79) begin
				x_delta_next = 0;
				y_delta_next = SQUARE_VELOCITY_NEG;
				checkpoint_on_next = 1;
			end
			
			// Node # 41
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 80 && sq_x_r == 159) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 42
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 160 && sq_x_r == 239) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 43
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 240 && sq_x_r == 319) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 44
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 320 && sq_x_r == 399) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 45
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 400 && sq_x_r == 479) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 46
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 480 && sq_x_r == 559) begin
				checkpoint_on_next = 1;
			end
			
			// Node # 47
			if (sq_y_t == 400 && sq_y_b == Y_MAX && sq_x_l == 560 && sq_x_r == X_MAX) begin
				x_delta_next = SQUARE_VELOCITY_NEG;
				y_delta_next = 0;
				checkpoint_on_next = 1;
			end
			// END ROW 6 *******************************************************
    end
    
    // RGB control for entities
    always_comb 
        if(~video_on)
            {R, G, B} = 24'h000000;          // black(no value) outside display area
        else
            if(sq_on)
                {R, G, B} = SQ_RGB;       // snake color
            else
                {R, G, B}= BG_RGB;       // blue background
    
endmodule
