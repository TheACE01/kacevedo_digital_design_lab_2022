library IEEE;
use IEEE.std_logic_1164.all;

entity sumador_4_tb is
end entity;

architecture tb of sumador_4_tb is

component sumador_4 is
port(
	A, B: in STD_LOGIC_VECTOR(3 DOWNTO 0);
	Cin: in STD_LOGIC;
	Cout: out STD_LOGIC;
	S: out STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

signal A, B, S: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal Cin, Cout: STD_LOGIC;

begin

sumador : sumador_4 port map(A => A, B => B, Cin => Cin, Cout => Cout, S => S);

stim : process 
begin

A <= "0001";
B <= "0000";
Cin <= '0';
wait for 10 ns;

A <= "1010";
B <= "0010";
Cin <= '0';
wait for 10 ns;

A <= "1000";
B <= "1000";
Cin <= '0';
wait for 10 ns;

A <= "1010";
B <= "1000";
Cin <= '0';
wait for 10 ns;

wait;

end process;
end tb;