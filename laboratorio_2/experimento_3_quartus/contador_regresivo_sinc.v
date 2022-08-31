`timescale 1ps / 1ps 

module contador_regresivo_sinc(clk, rst, start, count);

input clk, rst;
input [2:0] start;
output reg [2:0] count;

always @ (posedge clk) 
begin
	if(rst)
		count = start;
	else
		count = count + 1;
end
endmodule
