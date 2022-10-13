module snake_controller(
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
	 
	// Config parameters for dimensions and colors 
    parameter X_MAX = 639;                            
    parameter Y_MAX = 479;                                      
    parameter BG_RGB = 24'h99A3A4;
	 parameter SNAKE_RGB = 24'hF1C40F; 
	 parameter SQUARE_SIZE = 32;
	 parameter update_time = 26'd10000000;
	 parameter max_points = 64;
																  


	 // Generate the horizontal lines boundaries
    logic horizontal_lines[15:0];
	genvar i;        
	generate        
		for (i = 0; i < 16 ; i++) begin:hl       
		  assign horizontal_lines[i] = (x >= 0 && x <= X_MAX && y >= ((32*i)-1) && y < ((32*i))+1);
		end
	endgenerate 
	
	
	// Generate the vertical lines boundaries
    logic vertical_lines[20:0];
	genvar j;        
	generate        
		for (j = 0; j < 21 ; j++) begin:vl       
		  assign vertical_lines[j] = (x >= ((32*j)-1) && x <= ((32*j)+1) && y >= 0 && y <= Y_MAX);
		end
	endgenerate 
	
	// Arrays to track the snake head and body parts
    logic [9:0] snake_x [max_points-1:0];
    logic [9:0] snake_y [max_points-1:0];
	 logic [25:0] tick_counter; //Maximum value is 312500;

   // UPDATE THE TICK COUNTER
    always_ff @(posedge clk)
        if(reset)
				tick_counter <= 26'd0;
        else if(tick_counter == update_time) tick_counter <= 26'd0;
        else tick_counter <= tick_counter+ 26'd1;
		  
	// SNAKE HEAD CONTROL
    always_ff @(posedge clk) begin
        if(reset)  
            begin
                snake_x[0] <= 10'd128;
                snake_y[0] <= 10'd224;
            end
        else if(tick_counter == update_time) begin
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
					 snake_x[0] <= 0;
                snake_y[0] <= 0;
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
        else if(tick_counter == update_time) begin
				for (m = 1; m < max_points; m = m +1) begin
                snake_x[m] <= snake_x[m-1];
                snake_y[m] <= snake_y[m-1];
				end
        end
			end
	
	// RENDER SNAKE PARTS
   logic snake_on [max_points-1:0];
	genvar k;        
	generate        
		for (k = 0; k < max_points ; k++) begin:srp      
		  assign snake_on[k] = (snake_x[k] + 1 <= x)
													&& (x <= snake_x[k] + SQUARE_SIZE -1) 
													&& (snake_y[k] + 1 <= y)
													&& (y <= snake_y[k] + SQUARE_SIZE -1);
		end
	endgenerate 

	 // CONTROL RENDER TIMES
    always_comb 
        if(~video_on)
            {R, G, B} = 24'h000000; 
				
		  else if (snake_on[max_points-1:0])
					{R, G, B} = SNAKE_RGB; 
					
		  else if (horizontal_lines[15:0])
					{R, G, B} = 24'h000000; 
					
		  else if (vertical_lines[20:0])
					{R, G, B} = 24'h000000; 
					
			// Background
        else {R, G, B}= BG_RGB;   
   
endmodule
	 
	 