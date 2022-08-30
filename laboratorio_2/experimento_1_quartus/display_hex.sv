
module display_hex(A3, A2, A1, A0, A, B, C, D, E, F, G);
	
	// Definicion de entardas y salidas
  input logic A3, A2, A1, A0;
  output logic A, B, C, D, E, F, G;
  
  // Modelo de comportamiento para las salidas
  assign A = (~A3 & A2 & ~A1 & ~A0) | (~A3 & ~A2 & ~A1 & A0) | (A3 & A2 & ~A1 & A0) | (A3 & ~A2 & A1 & A0);
  
  assign B = (~A3 & A2 & ~A1 & A0) | (A3 & A2 & ~A0) | (A3 & A1 & A0) | (A2 & A1 & ~A0);
  
  assign C = (A3 & A2 & A1) | (A3 & A2 & ~A0) | (~A3 & ~A2 & A1 & ~A0);
  
  assign D = (~A3 & A2 & ~A1 & ~A0) | (~A3 & ~A2 & ~A1 & A0) | (A3 & ~A2 & A1 & ~A0) | (A2 & A1 & A0);
  
  assign E = (~A3 & A0) | (~A3 & A2 & ~A1) | (~A2 & ~A1 & A0);
  
  assign F = (A3 & A2 & ~A1 & A0) | (~A3 & ~A2 & A0) | (~A3 & A1 & A0) | (~A3 & ~A2 & A1);
  
  assign G = (~A3 & ~A2 & ~A1) | (A3 & A2 & ~A1 & ~A0) | (~A3 & A2 & A1 & A0);
  
endmodule
