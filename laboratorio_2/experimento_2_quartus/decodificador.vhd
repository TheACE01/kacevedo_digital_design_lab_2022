----------------------------------
--- Decodificador -----------------
----------------------------------
----------------------------------
---Angelo - Jhonathan - Kevin ----
----------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Definición de la entidad decodificador
entity decodificador is
port(
	A: in STD_LOGIC_VECTOR(3 DOWNTO 0);
	S: out STD_LOGIC_VECTOR(6 DOWNTO 0));
end decodificador;

-- Definición de la arquitectura del decodificador
architecture dataflow of decodificador is
begin
	
	S(6) <= ((not A(3)) and A(2) and (not A(1)) and (not A(0))) or
				((not A(3)) and (not A(2)) and (not A(1)) and A(0)) or 
				(A(3) and A(2) and (not A(1)) and A(0)) or
				(A(3) and (not A(2)) and A(1) and A(0));
	
	S(5) <= ((not A(3)) and A(2) and (not A(1)) and A(0)) or
				(A(3) and A(2) and (not A(0))) or (A(3) and A(1) and A(0));
				
	S(4) <= (A(3) and A(2) and A(1)) or (A(3) and A(2) and (not A(0))) or
				((not A(3)) and (not A(2)) and A(1) and (not A(0)));
		
	S(3) <= ((not A(3)) and A(2) and (not A(1)) and (not A(0))) or
				((not A(3)) and (not A(2)) and (not A(1)) and A(0)) or
				(A(3) and (not A(2)) and A(1) and (not A(0))) or (A(2) and A(1) and A(0));
				
	S(2) <= ((not A(3)) and A(0)) or ((not A(3)) and A(2) and A(1)) or
				((not A(2)) and (not A(1)) and A(0));
	
	S(1) <= (A(3) and A(2) and (not A(1)) and A(0)) or ((not A(3)) and (not A(2)) and A(0)) or
				((not A(3)) and A(1) and A(0)) or ((not A(3)) and A(1) and A(0)) or
				((not A(3)) and (not A(2)) and A(1));
	
	S(0) <= ((not A(3)) and (not A(2)) and (not A(1))) or (A(3) and A(2) and (not A(1)) and (not A(0))) or
				((not A(3)) and A(2) and A(1) and A(0));
end dataflow;

