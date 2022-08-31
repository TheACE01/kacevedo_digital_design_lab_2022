`timescale 1ps / 1ps // Unidad de tiempo / resolución
module contador_display_6_tb;

reg boton, rst;
wire [6:0] S0, S1;

contador_display_6 UUT(.clk(boton), .rst(rst), .S0(S0), .S1(S1));

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
