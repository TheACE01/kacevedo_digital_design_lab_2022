module paint_controller(
	input logic video_on, // From VGA Controller
								stage,
	input logic  [9:0] x, y, // From VGA Controller
	input logic enable_snake_paint [63:0], // From Snake Controller
	input logic enable_food_paint,
	output logic [7:0] R , G, B  // To VGA Controller
	);
	
    parameter BG_RGB = 24'h99A3A4; // Background color
	 parameter SNAKE_RGB = 24'hF1C40F; // Snake color
	 parameter FOOD_RGB = 24'hFF2300; // Food color
    parameter X_MAX = 639;                            
    parameter Y_MAX = 479;    
	 
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
	
	 
	 // CONTROL RENDER TIMES
    always @* begin
        if(~video_on)
            {R, G, B} = 24'h000000; 
			
			// In case the stage signal is ON
			else if (stage) begin	
			  if (enable_snake_paint[5:0]) 	{R, G, B} = SNAKE_RGB;
			  else if (enable_food_paint) 	{R, G, B} = FOOD_RGB;
			  else if (horizontal_lines[15:0]) {R, G, B} = 24'h000000; 
			  else if (vertical_lines[20:0]) {R, G, B} = 24'h000000; 
			  else {R, G, B}= BG_RGB; 
			end
			// In case the stage signal is OFF
			else begin
				{R, G, B}= BG_RGB;
			end
	end
		  
endmodule
