`timescale 1ns / 1ps
module deco_binario_bcd_tb();
	
	// Definiendo las variables que se necesitan para probar el módulo
	logic A3, A2, A1, A0, S4, S3, S2, S1, S0;
  
	// Creando una instancia del módulo diseñado (Device Under Test)
	deco_binario_bcd DUT(A3, A2, A1, A0, S4, S3, S2, S1, S0);
	
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
		A2 = 0;
		A1 = 1;
		A0 = 1;
		
		#5
		
		A3 = 0;
		A2 = 1;
		A1 = 0;
		A0 = 0;
		
		
		#5
		
		A3 = 0;
		A2 = 1;
		A1 = 0;
		A0 = 1;
		
		#5
		A3 = 0;
		A2 = 1;
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
		A2 = 0;
		A1 = 1;
		A0 = 0;
		
		
		#5
		A3 = 1;
		A2 = 0;
		A1 = 1;
		A0 = 1;
		
		
		#5
		A3 = 1;
		A2 = 1;
		A1 = 0;
		A0 = 0;
		
		#5
		A3 = 1;
		A2 = 1;
		A1 = 0;
		A0 = 1;
		
		#5
		A3 = 1;
		A2 = 1;
		A1 = 1;
		A0 = 0;
		
		#5
		A3 = 1;
		A2 = 1;
		A1 = 1;
		A0 = 1;
		#5;

	end 
endmodule
