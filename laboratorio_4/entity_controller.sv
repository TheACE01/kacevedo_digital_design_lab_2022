module entity_controller(
    input logic clk,                             // 50MHz from FPGA
								reset,                         // Reset signal from FSM
								enable_stage,			  // Enable stage signal from FSM
								Up,
								Down,
								Right,
								Left,
    input logic  [9:0] x, y,               // from VGA controller
								sx, sy, 							// From Random Snake Generator
								fx, fy, 							// From Random Food Generator
	 output logic enable_snake_paint [63:0], 
	 output logic enable_food_paint
    );
	 
	// Config parameters for dimensions and colors 
    parameter X_MAX = 639;                            
    parameter Y_MAX = 479;                                      
	 parameter SQUARE_SIZE = 32;
	 parameter update_time = 26'd10000000;
	 parameter max_points = 64;
	 
	// MAP SNAKE HEAD AND BODY ON SCREEN
   logic snake_on [max_points-1:0];
	
	// Arrays to track the snake head and body parts
    logic [9:0] snake_x [max_points-1:0];
    logic [9:0] snake_y [max_points-1:0];

	genvar k;        
	generate        
		for (k = 0; k < max_points ; k++) begin:srp      
		  assign snake_on[k] = (snake_x[k] + 1 <= x)
													&& (x <= snake_x[k] + SQUARE_SIZE -1) 
													&& (snake_y[k] + 1 <= y)
													&& (y <= snake_y[k] + SQUARE_SIZE -1);
		end
	endgenerate 
	assign enable_snake_paint = snake_on;
	
	// MAP FOOD
	logic food_on;
	 assign enable_food_paint = (fx + 10 <= x) && (x <= fx + 21) && (fy + 10  <= y)
													&& (y <= fy + 21);
																 
	 logic [25:0] tick_counter; //Maximum value is 312500;
	
	
   // UPDATE THE TICK COUNTER
    always_ff @(posedge clk) begin
		if(reset)
				tick_counter <= 26'd0;
		// Only when enable stage signal is 1
		else if(enable_stage) begin
				if(tick_counter == update_time) tick_counter <= 26'd0;
			   else tick_counter <= tick_counter+ 26'd1;
		end
	 end

		  
	// SNAKE HEAD CONTROL
    always_ff @(posedge clk) begin
        if(reset)  begin
                snake_x[0] <= fx;
                snake_y[0] <= fy;
        end
		  else if(enable_stage) begin
			  if(tick_counter == update_time) begin
					if (Up) begin
						 snake_x[0] <= snake_x[0] + 0;
						 snake_y[0] <= snake_y[0] - 32;
					end
					else if (Down) begin
						 snake_x[0] <= snake_x[0] + 0;
						 snake_y[0] <= snake_y[0] + 32;	
					end
					else if (Right) begin
						 snake_x[0] <= snake_x[0] + 32;
						 snake_y[0] <= snake_y[0] + 0;	
					end
					else if (Left) begin
						 snake_x[0] <= snake_x[0] - 32;
						 snake_y[0] <= snake_y[0] + 0;
					end
					
					// Check if there is a wall collision
					if (snake_x[0] < 0 || snake_x[0] > X_MAX - 31 || snake_y[0] < 0 || snake_y[0] > Y_MAX - 31) begin
						 snake_x[0] <= 0;
						 snake_y[0] <= 0;
					end
				end
			end
		  end

				
    // SNAKE BODY CONTROL
	 integer l, m;
    always@(posedge clk) begin
        if(reset) begin
				for (l = 1; l < max_points; l = l +1) begin
					snake_x[l] <= 10'd0;
					snake_y[l] <= 10'd0;
				end
        end
		  
		  else if(enable_stage) begin
			  if(tick_counter == update_time) begin
					for (m = 1; m < max_points; m = m +1) begin
						 snake_x[m] <= snake_x[m-1];
						 snake_y[m] <= snake_y[m-1];
					end
			  end
			end
			
	end 
endmodule
	 
	 