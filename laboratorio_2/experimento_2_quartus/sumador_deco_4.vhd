----------------------------------
--- Sumador + decodificador ------
----------------------------------
----------------------------------
---Angelo - Jhonathan - Kevin ----
----------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Definición de la entidad
entity sumador_deco_4 is
port(
	A, B: in STD_LOGIC_VECTOR(3 DOWNTO 0);
	Cin: in STD_LOGIC;
	Cout: out STD_LOGIC;
	S: out STD_LOGIC_VECTOR(6 DOWNTO 0));
end sumador_deco_4;

-- Definición de la arquitectura
architecture structural of sumador_deco_4 is

-- Declaración del componente sumador_4
component sumador_4 is
port(
	A, B: in STD_LOGIC_VECTOR(3 DOWNTO 0);
	Cin: in STD_LOGIC;
	Cout: out STD_LOGIC;
	S: out STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

-- Declaración del componente decodificador
component decodificador is
port(
	A: in STD_LOGIC_VECTOR(3 DOWNTO 0);
	S: out STD_LOGIC_VECTOR(6 DOWNTO 0));
end component;

-- Bus que conecta el sumador_4 con el decodificador
signal W: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin


-- Instanciación de componentes y asignación de puertos de entrada y salida
sumador: sumador_4 port map(A => A, B => B, Cin => Cin, S => W, Cout => Cout);
deco: decodificador port map(A => W, S => S);


end structural;


