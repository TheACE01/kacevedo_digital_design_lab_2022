module entity_controller(
    input logic clk,                             // 50MHz from FPGA
								reset,                         // Reset signal from FSM
								enable_stage,			  // Enable stage signal from FSM
								difficulty,
								Up,
								Down,
								Right,
								Left,
    input logic  [9:0] x, y,               // from VGA controller
								sx, sy, 							// From Random Snake Generator
								fx, fy, 							// From Random Food Generator
	input logic [5:0] snake_parts,
	 output logic enable_snake_paint [63:0], 
	 output logic enable_food_paint,
									food_collision,
									game_over
								
    );
	 
	// Config parameters for dimensions and colors 
    parameter X_MAX = 639;                            
    parameter Y_MAX = 479;                                      
	 parameter SQUARE_SIZE = 32;
	 parameter update_time_m1 = 26'd10000000;
	 parameter update_time_m2 = 26'd7000000;
	 logic tick_time;
	 
	// MAP SNAKE HEAD AND BODY ON SCREEN
   logic snake_on [63:0];
	
	// Array to track the snake parts position
    logic [9:0] snake_x [63:0];
    logic [9:0] snake_y [63:0];
	genvar k;
	generate        
		for (k = 0; k < 64 ; k++) begin:srp      
		  assign snake_on[k] = (snake_x[k] + 1 <= x)
													&& (x <= snake_x[k] + SQUARE_SIZE -1) 
													&& (snake_y[k] + 1 <= y)
													&& (y <= snake_y[k] + SQUARE_SIZE -1);
		end
	endgenerate 
	assign enable_snake_paint = snake_on;
	
	// Track food position
	logic food_on;
	 assign enable_food_paint = (fx + 10 <= x) && (x <= fx + 21) && (fy + 10  <= y)
													&& (y <= fy + 21);
													
													
	// Counter to control the movement time															 
	 logic [25:0] tick_counter;
	 
	 // FOOD COLLISION DETECTION SIGNAL
	 assign food_collision = (snake_x[0] == fx && snake_y[0] == fy);
	

   // UPDATE THE TICK COUNTER
    always_ff @(posedge clk) begin
		if(reset) begin
				tick_counter <= 26'd0;
				tick_time <= 0;
		end
		// Only when enable stage signal is 1
		else if(enable_stage) begin
			if (!difficulty) begin
					if(tick_counter == update_time_m1) begin
						tick_counter <= 26'd0;
						tick_time <= 1;
					end
			      else begin
						tick_counter <= tick_counter+ 26'd1;
						tick_time <= 0;
					end
			end
			else begin
					if(tick_counter == update_time_m2) begin
						tick_counter <= 26'd0;
						tick_time <= 1;
					end
			      else begin
						tick_counter <= tick_counter+ 26'd1;
						tick_time <= 0;
			end

		end
	 end
	 end

		  
	// SNAKE HEAD CONTROL
	integer c;
    always_ff @(posedge clk) begin
        if(reset)  begin
                snake_x[0] <= sx;
                snake_y[0] <= sy;
					 game_over <= 0;
        end
		  else if(enable_stage) begin
			  if(tick_time) begin
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
					if (snake_x[0] < 0 || snake_x[0] > X_MAX || snake_y[0] < 0 || snake_y[0] > Y_MAX) begin
							game_over <= 1;
					end
					else begin
						for (c = 1; c < snake_parts; c = c +1) begin
							if (snake_x[0] == snake_x[c] && snake_y[0] == snake_y[c]) begin
								game_over <= 1;
								break;
							end
				end
					end
				end
			end
		  end

    // SNAKE BODY CONTROL
	 integer l, m;
    always_ff @(posedge clk) begin
        if(reset) begin
				for (l = 1; l < 64; l = l +1) begin
					snake_x[l] <= 640;
					snake_y[l] <= 480;
				end
        end
		  
		  else if(enable_stage) begin
			  if(tick_time) begin
					for (m = 1; m < snake_parts; m = m +1) begin
						 snake_x[m] <= snake_x[m-1];
						 snake_y[m] <= snake_y[m-1];
					end
			  end
			end
			
	end 
endmodule
	 
	 