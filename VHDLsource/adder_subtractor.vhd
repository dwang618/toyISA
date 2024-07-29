LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY adder_subtractor IS 
	PORT
	(
		cin :  IN  STD_LOGIC;
		sel :  IN  STD_LOGIC;
		a :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		b :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		cout :  OUT  STD_LOGIC;
		sum :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END adder_subtractor;

ARCHITECTURE bdf_type OF adder_subtractor IS 

COMPONENT full_adder
	PORT(a : IN STD_LOGIC;
		 b : IN STD_LOGIC;
		 cin : IN STD_LOGIC;
		 sum : OUT STD_LOGIC;
		 cout : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	sum_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_0 <= sel XOR b(0);


SYNTHESIZED_WIRE_1 <= sel XOR b(1);


SYNTHESIZED_WIRE_3 <= sel XOR b(2);


SYNTHESIZED_WIRE_5 <= sel XOR b(3);


SYNTHESIZED_WIRE_7 <= sel XOR b(4);


SYNTHESIZED_WIRE_9 <= sel XOR b(5);


SYNTHESIZED_WIRE_11 <= sel XOR b(6);


SYNTHESIZED_WIRE_13 <= sel XOR b(7);


b2v_fa_0 : full_adder
PORT MAP(a => a(0),
		 b => SYNTHESIZED_WIRE_0,	
		 cin => cin,
		 sum => sum_ALTERA_SYNTHESIZED(0),
		 cout => SYNTHESIZED_WIRE_2);


b2v_fa_1 : full_adder
PORT MAP(a => a(1),
		 b => SYNTHESIZED_WIRE_1,
		 cin => SYNTHESIZED_WIRE_2,
		 sum => sum_ALTERA_SYNTHESIZED(1),
		 cout => SYNTHESIZED_WIRE_4);


b2v_fa_2 : full_adder
PORT MAP(a => a(2),
		 b => SYNTHESIZED_WIRE_3,
		 cin => SYNTHESIZED_WIRE_4,
		 sum => sum_ALTERA_SYNTHESIZED(2),
		 cout => SYNTHESIZED_WIRE_6);


b2v_fa_3 : full_adder
PORT MAP(a => a(3),
		 b => SYNTHESIZED_WIRE_5,
		 cin => SYNTHESIZED_WIRE_6,
		 sum => sum_ALTERA_SYNTHESIZED(3),
		 cout => SYNTHESIZED_WIRE_8);


b2v_fa_4 : full_adder
PORT MAP(a => a(4),
		 b => SYNTHESIZED_WIRE_7,
		 cin => SYNTHESIZED_WIRE_8,
		 sum => sum_ALTERA_SYNTHESIZED(4),
		 cout => SYNTHESIZED_WIRE_10);


b2v_fa_5 : full_adder
PORT MAP(a => a(5),
		 b => SYNTHESIZED_WIRE_9,
		 cin => SYNTHESIZED_WIRE_10,
		 sum => sum_ALTERA_SYNTHESIZED(5),
		 cout => SYNTHESIZED_WIRE_12);


b2v_fa_6 : full_adder
PORT MAP(a => a(6),
		 b => SYNTHESIZED_WIRE_11,
		 cin => SYNTHESIZED_WIRE_12,
		 sum => sum_ALTERA_SYNTHESIZED(6),
		 cout => SYNTHESIZED_WIRE_14);


b2v_fa_7 : full_adder
PORT MAP(a => a(7),
		 b => SYNTHESIZED_WIRE_13,
		 cin => SYNTHESIZED_WIRE_14,
		 sum => sum_ALTERA_SYNTHESIZED(7),
		 cout => cout);

sum <= sum_ALTERA_SYNTHESIZED;

END bdf_type;