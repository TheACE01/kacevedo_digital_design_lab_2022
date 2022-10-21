`timescale 1ns / 1ps
module op_div_tb();
	parameter N = 4;
	// Definiendo las variables que se necesitan para probar el módulo
	logic [N-1:0] A, B, Z;
	
	op_div #(.N(N)) uut(.A(A), .B(B), .Z(Z));
	// Creando un bloque de código que permita cambiar valores lógicos
	initial begin
		// Probando para distintas combinaciones en la entarda
		A = 4'b0100;
		B = 4'b0011;
		//0001
		
		#5 // Retardo manual de 5 unidades de tiempo
		
		A = 4'b1100;
		B = 4'b0010;
		//0110
		
		#5
		
		A = 4'b1100;
		B = 4'b0011;
		//0100
		
		#5
		
		A = 4'b1000;
		B = 4'b0100;
		//0010
		
		#5;

	end
endmodule
	