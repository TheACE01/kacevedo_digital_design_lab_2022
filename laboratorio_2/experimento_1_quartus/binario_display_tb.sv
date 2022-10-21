`timescale 1ns / 1ps
module binario_display_tb();
	
	// Definiendo las variables que se necesitan para probar el módulo
	logic A3, A2, A1, A0, A, B, C, D, E, F, G;
  
	// Creando una instancia del módulo diseñado (Device Under Test)
	binario_display DUT(.A3(A3), .A2(A2), .A1(A1), .A0(A0), .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G));
	
	// Creando un bloque de código que permita cambiar valores lógicos
	initial begin
		// Probando para distintas combinaciones en la entarda
		A3 = 0;
		A2 = 0;
		A1 = 0;
		A0 = 0;
		
		#5 // Retardo manual de 5 unidades de tiempo
		
		A3 = 0;
		A2 = 0;
		A1 = 0;
		A0 = 1;
		
		#5
		
		A3 = 0;
		A2 = 0;
		A1 = 1;
		A0 = 0;
		
		#5
		
		A3 = 0;
		A2 = 1;
		A1 = 1;
		A0 = 1;
		
		#5
		
		A3 = 1;
		A2 = 0;
		A1 = 0;
		A0 = 0;
		
		
		#5
		
		A3 = 1;
		A2 = 0;
		A1 = 0;
		A0 = 1;
		
		#5
		A3 = 1;
		A2 = 1;
		A1 = 0;
		A0 = 0;
		
		#5
		
		A3 = 1;
		A2 = 1;
		A1 = 1;
		A0 = 1;
		#5;

	end 
endmodule
