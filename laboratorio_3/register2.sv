module register2 #(parameter P = 4)(
	input clk, rst,
	input [P-1:0] entrada,
	output reg [P-1:0] Salida);

reg [P-1:0] state, next_state;

//memoria
always @(posedge clk) begin
	if(!rst) state<=0;
	else state<=next_state;
end

//siguiente estado
always @(*) begin
	next_state = EntradaParalela;
end

//salidas
always @(*) begin
	Salida=state;
end

endmodule
