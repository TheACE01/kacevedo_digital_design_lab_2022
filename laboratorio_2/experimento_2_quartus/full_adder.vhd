----------------------------------
--- Full Adder -----------------
----------------------------------
----------------------------------
---Angelo - Jhonathan - Kevin ----
----------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Definición de la entidad
entity full_adder is
port(
	FA, FB, Cin: in STD_LOGIC;
	FS, Cout: out STD_LOGIC);
end full_adder;

-- Definición de la arquitectura
architecture structural of full_Adder is

-- Declaración de componente half_adder
component half_adder is
port( 
	A, B: in STD_LOGIC;
	S, C: out STD_LOGIC);
end component;

-- Declaración de componente orgate
component orgate is
port(
	X, Y: in STD_LOGIC;
	Z: out STD_LOGIC);
end component;

-- Nodos intermedios
signal S0, S1, S2: STD_LOGIC;

begin
-- Instanciación de componentes y asignación de puertos de entrada y salida
U1: half_adder port map(A => FA, B => FB, S => S0, C => S1);
U2: half_adder port map(A => S0, B => Cin, S => FS, C => S2);
U3: orgate port map(X => S2, Y => S1, Z => Cout);
end structural;


