module deco_binario_bcd (A3, A2, A1, A0, S4, S3, S2, S1, S0);
	// Entradas del modulo
  input logic A3, A2, A1, A0;
	// Salidas del modulo
  output logic S4, S3, S2, S1, S0;
  
  // Modelo de comportamiento para cada una de las variables de salida
  // S es una sola variable de salida pero con sus bits separados en variables
  // COn S4 siendo el MSB
  assign S4 = (A3 & A2) | (A3 & A1);
  assign S3 = (A3 & ~A2 & ~A1);
  assign S2 = (~A3 & A2) | (A2 & A1);
  assign S1 = (A3 & A2 & ~A1) | (~A3 & A1);
  assign S0 = A0;
  
endmodule
