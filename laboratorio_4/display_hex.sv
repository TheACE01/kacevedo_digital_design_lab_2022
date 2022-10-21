module display_hex(input logic [3:0] A,  output logic [6:0] S);

	
	logic [6:0] rS;

	assign S = rS;
	
	always @(A)
	begin
		case(A)
		4'b0000: rS = 7'b0000001;
		4'b0001: rS = 7'b1001111;
		4'b0010: rS = 7'b0010010;
		4'b0011: rS = 7'b0000110;
		4'b0100: rS = 7'b1001100;
		4'b0101: rS = 7'b0100100;
		4'b0110: rS = 7'b0100000;
		4'b0111: rS = 7'b0001111;
		4'b1000: rS = 7'b0000000;
		4'b1001: rS = 7'b0000100;
		4'b1010: rS = 7'b0001000;
		4'b1011: rS = 7'b1100000;
		4'b1100: rS = 7'b0110001;
		4'b1101: rS = 7'b1000010;
		4'b1110: rS = 7'b0110000;
		4'b1111: rS = 7'b0111000;
		endcase
	end
endmodule
