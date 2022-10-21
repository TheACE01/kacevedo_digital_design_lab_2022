----------------------------------
--- Compuerta OR -----------------
----------------------------------
----------------------------------
---Angelo - Jhonathan - Kevin ----
----------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Definición de la entidad
entity orgate is
port(
	X, Y: in STD_LOGIC;
	Z: out STD_LOGIC);
end orgate;

-- Definición de la arquitectura
architecture dataflow of orgate is
begin
	Z <= X OR Y;
end dataflow;


