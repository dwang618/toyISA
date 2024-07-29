LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY alu IS
PORT
(
p : in std_logic_vector(7 downto 0);
q : in std_logic_vector(7 downto 0);
f0 : in std_logic;
f1 : in std_logic;
alu_out : out std_logic_vector(7 downto 0);
Z : out std_logic
);
end alu;

ARCHITECTURE gate_level of alu IS

COMPONENT adder_subtractor
PORT
(
sel : in std_logic;
cin : in std_logic;
a : in std_logic_vector(7 downto 0);
b : in std_logic_vector(7 downto 0);
cout : out std_logic;
sum : out std_logic_vector(7 downto 0)
);
END COMPONENT;

signal a : std_logic_vector(7 downto 0);
signal b : std_logic_vector(7 downto 0);
signal output : std_logic_vector(7 downto 0);

BEGIN

a(0) <= (f1 and q(0)) or (not(f1) and p(0));
a(1) <= (f1 and q(1)) or (not(f1) and p(1));
a(2) <= (f1 and q(2)) or (not(f1) and p(2));
a(3) <= (f1 and q(3)) or (not(f1) and p(3));
a(4) <= (f1 and q(4)) or (not(f1) and p(4));
a(5) <= (f1 and q(5)) or (not(f1) and p(5));
a(6) <= (f1 and q(6)) or (not(f1) and p(6));
a(7) <= (f1 and q(7)) or (not(f1) and p(7));
b(0) <= (q(0) and not(f1)) or (f1 and '1');
b(1) <= (q(1) and not(f1)) or (f1 and '0');
b(2) <= (q(2) and not(f1)) or (f1 and '0');
b(3) <= (q(3) and not(f1)) or (f1 and '0');
b(4) <= (q(4) and not(f1)) or (f1 and '0');
b(5) <= (q(5) and not(f1)) or (f1 and '0');  
b(6) <= (q(6) and not(f1)) or (f1 and '0');
b(7) <= (q(7) and not(f1)) or (f1 and '0');

add_sub : adder_subtractor
PORT MAP
(
sel => f0,
cin => f0,
a => a,
b => b,
sum => output
);

Z <= not(output(0) or output(1) or output(2) or output(3) or output(4) or output(5) or output(6) or output(7));
alu_out <= output;

END gate_level;