----------------------------------
--- Half Adder -----------------
----------------------------------
----------------------------------
---Angelo - Jhonathan - Kevin ----
----------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Definición de la entidad
entity half_adder is
port(
	A, B: in STD_LOGIC;
	S, C: out STD_LOGIC);
end half_adder;

-- Definición de la arquitectura
architecture dataflow of Half_Adder is
begin

	S <= A XOR B;
	C <= A AND B;
end dataflow;

