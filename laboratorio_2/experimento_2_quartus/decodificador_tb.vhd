library IEEE;
use IEEE.std_logic_1164.all;

entity decodificador_tb is
end entity;

architecture tb of decodificador_tb is

component decodificador is
port(
	A: in STD_LOGIC_VECTOR(3 DOWNTO 0);
	S: out STD_LOGIC_VECTOR(6 DOWNTO 0));
end component;

signal A: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal S: STD_LOGIC_VECTOR(6 DOWNTO 0);

begin

deco : decodificador port map(A => A, S => S);

stim : process 
begin

A <= "0001";
wait for 10 ns;

A <= "0101";
wait for 10 ns;

A <= "0011";
wait for 10 ns;

A <= "1001";
wait for 10 ns;

A <= "1011";
wait for 10 ns;

wait;

end process;
end tb;