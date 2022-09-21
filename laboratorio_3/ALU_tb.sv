//Testbech para el ALU
//@autor: Saymon Astua

module ALU_tb();

	parameter P = 4;
	
	logic N, Z, C, V;
	logic [P-1:0] A, B, S;
	logic [3:0] OP;
	
	ALU #(.P(P)) UUT(.A(A), .B(B), .OP(OP), .S(S), .N(N), .Z(Z), .C(C), .V(V));
	
	initial begin
		//pruebas para la suma
		A = 4'b0010;
		B = 4'b1010;
		//1100
		OP = 0;
		#20
		
		A = 0;
		B = 0;
		#20
		
		A = 4'b1111;
		B = 4'b0110;
		//10101
		#20
		
		// pruebas para la resta
		A = 4'b0010;
		B = 4'b1010;
		//11000
		OP = 1;
		#20
		
		A = 4'b1111;
		B = 4'b1011;
		//00100
		#20
		
		
		//pruebas para el corrimiento a la derecha
		A = 4'b0110;
		B = 4'b0001;
		// 0011
		OP = 2;
		#20
		
		A = 4'b1010;
		B = 4'b0001;
		//0101
		#20
		
		//pruebas para el corrimiento a la izquierda
		A = 4'b0110;
		B = 4'b0001;
		// 1100
		OP = 3;
		#20
		
		A = 4'b1010;
		B = 4'b0001;
		// 0100
		#20
		
		//pruebas para el AND
		A = 4'b1010;
		B = 4'b0110;
		OP = 4;
		#20
		
		
		//pruebas para el OR
		A = 4'b0101;
		B = 4'b0110;
		OP = 5;
		#20
		
		
		//pruebas para el XOR
		A = 4'b1010;
		B = 4'b0110;
		OP = 6;
		#20
		
		
		// Pruebas para la multiplicación
		A = 4'b0010;
		B = 4'b0100;
		OP = 7;
		#20
		
		A = 4'b0010;
		B = 4'b0111;
		#20
		
		// Pruebas para la división
		A = 4'b0100;
		B = 4'b0011;
		OP = 8;
		//0001
		#20
		
		A = 4'b1100;
		B = 4'b0010;
		//0110
		#20
		
		// Pruebas para el módulo
		
		A = 4'b0100;
		B = 4'b0010;
		//0000
		OP = 9;
		#20
		
		A = 4'b1101;
		B = 4'b0100;
		//0001
		#20;
	end

endmodule 