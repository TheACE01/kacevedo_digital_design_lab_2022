module FSM_machine(input clk, rst, dificultad_normal, dificultad_dificil, food_collision, game_over, 
						output en_s, en_f, score, rst_game, stage, difficulty);
						
	logic [1:0] state, next_state;

	//actual state logic
	always_ff @(posedge clk or posedge rst)
	if (rst) state = 2'b00;
	else
		state = next_state;

	//next state logic
	always_comb begin
	
		case(state)
		2'b00: if (!dificultad_normal || !dificultad_dificil) next_state = 2'b01; else next_state = 2'b00;
		2'b01: next_state = 2'b10;
		2'b10: next_state = 2'b11;
		2'b11: if (food_collision) next_state = 2'b10; else if(game_over) next_state = 2'b00; else next_state = 2'b11;
		default: next_state = 2'b00;
		
		endcase
	end

	always @ (dificultad_normal or dificultad_dificil) begin
		if (!dificultad_normal && !stage) difficulty = 0;
		else if (!dificultad_dificil && !stage) difficulty = 1;
	end
		

	//output logic
	assign stage = (state == 2'b00) ? 0 : 1;
	assign en_s = (state == 2'b01) ? 1 : 0;
	assign rst_game = (state == 2'b01) ? 1 : 0;
	assign en_f = (state == 2'b10) ? 1 : 0;
	assign score = (state == 2'b10) ? 1 : 0;

	
endmodule
