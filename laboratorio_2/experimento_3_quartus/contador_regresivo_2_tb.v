`timescale 1ps / 1ps // Unidad de tiempo / resolución
module contador_regresivo_2_tb;

parameter N = 2;
reg boton, rst;
wire [1:0] count;

// Instance of the Unit Under Test (UUD)
contador_regresivo #(.N(N)) uut(
	.clk(boton),
	.rst(rst),
	.count(count)
);

// Todo lo que esté dentro se ejecuta línea por línea
initial begin
	boton = 0;
	rst = 1;
	#10
	rst = 0;
	#1
	rst = 1;
	#5
	boton = 1;
	#5
	boton = 0;
	#5
	boton = 1;
	#5
	boton = 0;
	#5
	boton = 1;
	#5
	boton = 0;
	#5
	boton = 1;
	#5
	boton = 0;
	
	boton = 1;
	#5
	boton = 0;
	#5
	boton = 1;
	#5
	boton = 0;
	#5
	boton = 1;
	#5
	boton = 0;
	#5
	boton = 1;
	#5
	boton = 0;
	
	#10
	rst = 0;
	#1
	rst = 1;
	#1
	boton = 1;
	#5
	boton = 0;
	#5
	boton = 1;
	#5
	boton = 0;
	#5
	boton = 1;
	#5
	boton = 0;
	#5
	boton = 1;
	#5
	boton = 0;
	
	
	
end



endmodule
