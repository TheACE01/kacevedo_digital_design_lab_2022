`timescale 1ps / 1ps 

module contador_regresivo #(parameter N = 3)(clk, rst, count);

input clk, rst;
output reg [N-1:0] count = 0;

always @ (posedge clk or negedge rst) 
begin
	if(!rst)
		count <= 2**N - 1;
		
	else if(count !== 0)
		count <= count - 1;
end
endmodule
