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
	 parameter LETTER_RGB = 24'hFFFFFF; // Food color
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
	
	logic on [30:0];
	
	
	//Painting the start menu
	// S
	assign on[0] = (x >= 160) && (x <= 180) && (y >= 40) && (y <= 60);
	assign on[1] = (x >= 20*7) && (x <= 20*8) && (y >= 20*2) && (y <= 20*5);
	assign on[2] = (x >= 20*8) && (x <= 20*9) && (y >= 20*4) && (y <= 20*7);
	assign on[3] = (x >= 20*7) && (x <= 20*8) && (y >= 20*6) && (y <= 20*7);
	
	// N
	assign on[4] = (x >= 20*10) && (x <= 20*11) && (y >= 20*2) && (y <= 20*7);
	assign on[5] = (x >= 20*11) && (x <= 20*12) && (y >= 20*4) && (y <= 20*5);
	assign on[6] = (x >= 20*12) && (x <= 20*13) && (y >= 20*5) && (y <= 20*6);
	assign on[7] = (x >= 20*13) && (x <= 20*14) && (y >= 20*2) && (y <= 20*7);

	// A
	assign on[8] = (x >= 20*15) && (x <= 20*18) && (y >= 20*2) && (y <= 20*3);
	assign on[9] = (x >= 20*15) && (x <= 20*16) && (y >= 20*3) && (y <= 20*7);
	assign on[10] = (x >= 20*16) && (x <= 20*17) && (y >= 20*5) && (y <= 20*6);
	assign on[11] = (x >= 20*17) && (x <= 20*18) && (y >= 20*3) && (y <= 20*7);
	
	// K
	assign on[12] = (x >= 20*19) && (x <= 20*20) && (y >= 20*2) && (y <= 20*7);
	assign on[13] = (x >= 20*20) && (x <= 20*22) && (y >= 20*3) && (y <= 20*4);
	assign on[14] = (x >= 20*21) && (x <= 20*22) && (y >= 20*2) && (y <= 20*3);
	assign on[15] = (x >= 20*20) && (x <= 20*22) && (y >= 20*5) && (y <= 20*6);
	assign on[16] = (x >= 20*21) && (x <= 20*22) && (y >= 20*6) && (y <= 20*7);

	
	// E
	assign on[17] = (x >= 20*23) && (x <= 20*24) && (y >= 20*2) && (y <= 20*7);
	assign on[18] = (x >= 20*24) && (x <= 20*26) && (y >= 20*2) && (y <= 20*3);
	assign on[19] = (x >= 20*24) && (x <= 20*26) && (y >= 20*4) && (y <= 20*5);
	assign on[20] = (x >= 20*24) && (x <= 20*26) && (y >= 20*6) && (y <= 20*7);

	
	// Arrow Left
	assign on[21] = (x >= 20*7) && (x <= 20*8) && (y >= 20*11) && (y <= 20*12);
	assign on[22] = (x >= 20*8) && (x <= 20*9) && (y >= 20*10) && (y <= 20*13);
	assign on[23] = (x >= 20*9) && (x <= 20*10) && (y >= 20*9) && (y <= 20*14);
	assign on[24] = (x >= 20*10) && (x <= 20*13) && (y >= 20*11) && (y <= 20*12);

	// Normal Difficulty Rectangle
	assign on[25] = (x >= 20*15) && (x <= 20*23) && (y >= 20*10) && (y <= 20*13);

	// Arrow Up
	assign on[26] = (x >= 20*9) && (x <= 20*10) && (y >= 20*16) && (y <= 20*17);
	assign on[27] = (x >= 20*8) && (x <= 20*11) && (y >= 20*17) && (y <= 20*18);
	assign on[28] = (x >= 20*7) && (x <= 20*12) && (y >= 20*18) && (y <= 20*19);
	assign on[29] = (x >= 20*9) && (x <= 20*10) && (y >= 20*19) && (y <= 20*22);

	// Hard Difficulty Rectangle
	assign on[30] = (x >= 20*15) && (x <= 20*23) && (y >= 20*17) && (y <= 20*20);

	 // CONTROL RENDER TIMES
    always_comb begin
        if(~video_on)
            {R, G, B} = 24'h000000; 
			
			// In case the stage signal is ON
			else if (stage) begin	
			  if (enable_snake_paint[63:0]) 	{R, G, B} = SNAKE_RGB;
			  else if (enable_food_paint) 	{R, G, B} = FOOD_RGB;
			  else if (horizontal_lines[15:0]) {R, G, B} = 24'h000000; 
			  else if (vertical_lines[20:0]) {R, G, B} = 24'h000000; 
			  else {R, G, B}= BG_RGB; 
			end
			
			// In case the stage signal is OFF
			else if (!stage)begin
				if (on[20:0]) {R, G, B} = 24'h000000;
				else if (on[24:21]) {R, G, B} = 24'h000000;
				else if (on[29:26]) {R, G, B} = 24'h000000;
				else if (on[25]) {R, G, B} = 24'hCDF1FF;
				else if (on[30]) {R, G, B} = 24'hFF2300;
				else {R, G, B}= SNAKE_RGB;
			end
			
			else {R, G, B}= BG_RGB;
	end
		  
endmodule
