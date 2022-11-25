module renderizer(
		input logic video_on, // From VGA Controller
		
		input logic [23:0] rgb_pixel, // From ROM Memory
		input logic [9:0] x, y,
		output logic [7:0] R , G, B  // To VGA Controller
	);
    always_comb begin
		if(~video_on) {R, G, B} = 24'h000000; 
		else begin
			if (x >= 0 && x <= 199 && y >= 0 && y <= 119) {R, G, B}= rgb_pixel;
			else {R, G, B} = 24'h000000;
		end
	end  
endmodule
