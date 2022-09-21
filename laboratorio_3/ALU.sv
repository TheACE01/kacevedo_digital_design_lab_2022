/*	Unidad aritmético-lógica ALU
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 0000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 0001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 0010  |   ALU_Out = A >> 1;
----------------------------------------------------------------------
| 0011  |   ALU_Out = A << 1;
----------------------------------------------------------------------
| 0100  |   ALU_Out = A and B
----------------------------------------------------------------------
| 0101  |   ALU_Out = A or B
----------------------------------------------------------------------
| 0110  |   ALU_Out = A xor B
----------------------------------------------------------------------
| 0111  |   ALU_Out = A * B
----------------------------------------------------------------------
| 1000  |   ALU_Out = A / B;
----------------------------------------------------------------------
| 1001  |   ALU_Out = A % B;
----------------------------------------------------------------------

*/

module ALU #(parameter P = 4)
				(A, B, OP, S, N, Z, C, V);
	
	input [P-1:0] A, B;
	input [3:0] OP;
	output N, Z, C, V;
	output [P-1:0] S;
	
	reg [P-1:0] res, add_res, sub_res, shift_right_res, shift_left_res;
	reg [P-1:0] and_res, or_res, xor_res, mul_res, div_res, mod_res;
	
	reg N_temp, C_temp;
	
	// Instancias
	//sumador
	op_sum #(.N(P)) suma(.A(A), .B(B), .c_in(0), .Z(add_res), .c_out(C_temp));
	
	//restador
	op_sub #(.N(P)) resta(.A(A), .B(B), .Z(sub_res), .c_out(N_temp));
	
	//corriento a la derecha
	shift_right #(.N(P)) derecha(.A(A), .B(B), .Z(shift_right_res));
	
	//corrimiento a la izquierda
	shift_left #(.N(P)) isquierda(.A(A), .B(B), .Z(shift_left_res));
	
	//and
	op_and #(.N(P)) andM(.A(A), .B(B), .Z(and_res));
	
	//or
	op_or #(.N(P)) orM(.A(A), .B(B), .Z(or_res));
	
	//xor
	op_xor #(.N(P)) xorM(.A(A), .B(B), .Z(xor_res));
	
	// Multiplicacion
	multiplier #(.N(P)) multi(.A(A), .B(B), .Z(mul_res));
	
	// División
	op_div #(.N(P)) divi(.A(A), .B(B), .Z(div_res));
	
	// Modulo
	op_mod #(.N(P)) modul(.A(A), .B(B), .Z(mod_res));
	
	//se asigna el registro de resultado a la salida r
	assign S = res;
	
	//se asigna las banderas de estado
	
	assign C = C_temp && OP == 0;
	assign V = C;
	assign N = N_temp && OP == 1;
	
	//bitwise OR en la salida
	assign Z = ~(|{C, res});
	

	always @ (A, B) begin
		case(OP)
			0: res = add_res;
				
			1: res = sub_res;
				
			2: res = shift_right_res;

			3: res = shift_left_res;
			
			4: res = and_res;

			5: res = or_res;

			6: res = xor_res;
			
			7: res = mul_res;
			
			8: res = div_res;
			
			9: res = mod_res;
			
			default: res = 0;

		endcase
	end
				 
endmodule 