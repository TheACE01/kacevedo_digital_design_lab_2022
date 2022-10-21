/*

Este modulo permite pasar de una representacion en binario de 4 bits a una
representacion hexadecimal en un display de 7 segmentos de la FPGA

*/
module binario_display (A3, A2, A1, A0, A, B, C, D, E, F, G);
	
	// Definicion de entardas y salidas
  input logic A3, A2, A1, A0;
  output logic A, B, C, D, E, F, G;
  
  // Cables intermedios
  logic W4, W3, W2, W1, W0;
  
  // Modelo estructural para unir los dos modulos del design
  deco_binario_bcd U1(.A3(A3), .A2(A2), .A1(A1), .A0(A0), .S4(W4), .S3(W3), .S2(W2), .S1(W1), .S0(W0));
  display_hex U2(.A3(W3), .A2(W2), .A1(W1), .A0(W0), .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G));
  
endmodule
