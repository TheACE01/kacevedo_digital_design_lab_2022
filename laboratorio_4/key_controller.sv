module key_controller(
    input logic clk,                             // 50MHz from FPGA
								reset,                         // Push Switch from FPGA
								stage,
								key_up,
								key_down,
								key_right,
								key_left,
    output logic  Up , Down,  Right, Left
    );
	 
	 // Buffer for keys pressed outputs
	 logic Up_next, Down_next, Right_next, Left_next;
	 
    // register control
    always_ff @(posedge clk or posedge reset)
        if(reset) begin
				Up <= 0;
				Down <= 0;
				Left <= 0;
				Right <= 0;
        end
        else begin
				Up <= Up_next;
				Down <= Down_next;
				Left <= Left_next;
				Right <= Right_next;
        end 
		  
	// Key pressed control
	always @* begin
				Up_next = Up;
				Down_next = Down;
				Left_next = Left;
				Right_next = Right;
				
			if (!key_up && !Down_next && stage) begin
				Up_next = 1;
				Down_next = 0;
				Left_next = 0;
				Right_next = 0;
			end
			else if (!key_down && !Up_next && stage) begin
				Up_next = 0;
				Down_next = 1;
				Left_next = 0;
				Right_next = 0;
			end
			else if (!key_left && !Right_next && stage) begin
				Up_next = 0;
				Down_next = 0;
				Left_next = 1;
				Right_next = 0;
			end
			else if (!key_right && !Left_next && stage) begin
				Up_next = 0;
				Down_next = 0;
				Left_next = 0;
				Right_next = 1;
			end
	end
	 
endmodule
