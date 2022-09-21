module register #(parameter P = 4)(
	input clk, rst,
	input [P-1:0] A, B,
	output reg [P-1:0] AS, BS);

reg [P-1:0] state, next_state, state2, next_state2;

//memoria
always @(posedge clk) begin
	if(!rst) state<=0; state2 <= 0;
	else state<=next_state; state2 <= next_state2;
end

//siguiente estado
always @(*) begin
	next_state = A;
	next_state2 = B;
end

//salidas
always @(*) begin
	AS = state;
	BS = state2;
end

endmodule
