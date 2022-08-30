----------------------------------
--- Sumador de 4 bits ------------
----------------------------------
----------------------------------
---Angelo - Jhonathan - Kevin ----
----------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Definición de la entidad
entity sumador_4 is
port(
	A, B: in STD_LOGIC_VECTOR(3 DOWNTO 0);
	Cin: in STD_LOGIC;
	Cout: out STD_LOGIC;
	S: out STD_LOGIC_VECTOR(3 DOWNTO 0));
end sumador_4;

-- Definición de la arquitectura
architecture structural of sumador_4 is

-- Declaración del componente full_adder
component full_adder is
port(
	FA, FB, Cin: in STD_LOGIC;
	FS, Cout: out STD_LOGIC);
end component;

-- Nodos intermedios
signal C: STD_LOGIC_VECTOR(4 DOWNTO 0);

begin

-- Asignación del puerto de Carry In
C(0) <= Cin;

-- Instanciación de componentes y asignación de puertos de entrada y salida
FA0: FULL_adder port map(FA => A(0), FB => B(0), Cin => C(0), FS => S(0), Cout => C(1));
FA1: FULL_adder port map(FA => A(1), FB => B(1), Cin => C(1), FS => S(1), Cout => C(2));
FA2: FULL_adder port map(FA => A(2), FB => B(2), Cin => C(2), FS => S(2), Cout => C(3));
FA3: FULL_adder port map(FA => A(3), FB => B(3), Cin => C(3), FS => S(3), Cout => C(4));

Cout <= C(4);

end structural;


