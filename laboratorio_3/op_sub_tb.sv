`timescale 1ns / 1ps
module op_sub_tb();
	parameter N = 4;
	// Definiendo las variables que se necesitan para probar el módulo
	logic [N-1:0] A, B, Z;
	logic c_out;
	
	op_sub #(.N(N)) uut(.A(A), .B(B), .Z(Z), .c_out(c_out));
	// Creando un bloque de código que permita cambiar valores lógicos
	initial begin
		// Probando para distintas combinaciones en la entarda
		A = 4'b0010;
		B = 4'b1010;
		//11000
		
		#5 // Retardo manual de 5 unidades de tiempo
		
		A = 4'b1111;
		B = 4'b0110;
		//01001
		
		#5
		
		A = 4'b1111;
		B = 4'b1011;
		//00100
		
		#5
		
		A = 4'b1010;
		B = 4'b1111;
		//11011
		
		#5;

	end
endmodule
	