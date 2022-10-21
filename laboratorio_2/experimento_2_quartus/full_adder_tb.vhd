library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_tb is
end entity;

architecture tb of full_adder_tb is

component full_adder is
Port ( FA, FB, Cin : in STD_LOGIC;
FS, Cout : out STD_LOGIC);
end component;

signal FA, FB, Cin, FS, Cout : STD_LOGIC;

begin

uut : full_adder port map(
FA =>FA, FB =>FB,
Cin => Cin, FS => FS, Cout => Cout);

stim : process 
begin

FA <= '0';
FB <= '0';
Cin <= '0';
wait for 10 ns;
assert ((FS = '0') and (Cout = '0'))
report "test failed for input combination 000" severity error;

FA <= '0';
FB <= '0';
Cout <= '1';
wait for 10 ns;
assert ((FS = '1') and (Cout = '0'))
report "test failed for input combination 001" severity error;

FA <= '0';
FB <= '1';
Cin <= '0';
wait for 10 ns;
assert ((FS = '1') and (Cout = '0'))
report "test failed for input combination 010" severity error;

FA <= '0';
FB <= '1';
Cin <= '1';
wait for 10 ns;
assert ((FS = '0') and (Cout = '1'))
report "test failed for input combination 011" severity error;

FA <= '1';
FB <= '0';
Cin <= '0';
wait for 10 ns;
assert ((FS = '1') and (Cout = '0'))
report "test failed for input combination 100" severity error;

FA <= '1';
FB <= '0';
Cin <= '1';
wait for 10 ns;
assert ((FS = '0') and (Cout = '1'))
report "test failed for input combination 101" severity error;

FA <= '1';
FB <= '1';
Cin <= '0';
wait for 10 ns;
assert ((FS = '0') and (Cout = '1'))
report "test failed for input combination 110" severity error;

FA <= '1';
FB <= '1';
Cin <= '1';
wait for 10 ns;
assert ((FS = '1') and (Cout = '1'))
report "test failed for input combination 111" severity error;
wait;

end process;
end tb;