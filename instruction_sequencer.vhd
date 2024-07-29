LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity instruction_sequencer is 
	port
	(
			opcode : in std_logic_vector(2 downto 0);
			reset : in std_logic;
			clock : in std_logic;
			t0 : out std_logic;
			t1 : out std_logic;
			t2 : out std_logic;
			t3 : out std_logic;
			t4 : out std_logic;
			t5 : out std_logic;
			t6 : out std_logic;
			t7 : out std_logic;
			execute : out std_logic
	);
end instruction_sequencer;

architecture rtf of instruction_sequencer is 
signal t_counter0 : std_logic;
signal t_counter1 : std_logic;
signal t_counter2 : std_logic;
signal t_counter_next0 : std_logic;
signal t_counter_next1 : std_logic;
signal t_counter_next2 : std_logic;


component d_ff
	port(reset : in std_logic;
			clock : in std_logic;
			d : in std_logic;
			q : out std_logic
			);
end component;

begin 

--3 current state flip flops
tc0_ff : d_ff 
	port map(reset => reset,
				clock => clock,
				d => t_counter_next0,
				q => t_counter0);
tc1_ff : d_ff
	port map(reset => reset,
				clock => clock,
				d => t_counter_next1,
				q => t_counter1);
tc2_ff : d_ff
	port map(reset => reset,
				clock => clock,
				d => t_counter_next2,
				q => t_counter2);
				
--3 next state questions
t_counter_next0 <= (not(opcode(1)) and not(t_counter0)) or (opcode(1) and not(t_counter2) and not(t_counter0)) or (not(opcode(2)) and opcode(1) and t_counter2 and not(t_counter0));
t_counter_next1 <= (not(t_counter2) and not(t_counter1) and t_counter0) or (opcode(1) and not(t_counter1) and t_counter0) or (opcode(2) and not(t_counter1) and t_counter0) or (t_counter1 and not(t_counter0));
t_counter_next2 <= (t_counter2 and t_counter1 and not(t_counter0)) or (not(t_counter2) and t_counter1 and t_counter0) or (not(opcode(2)) and not(opcode(1)) and t_counter2 and not(t_counter1) and not(t_counter0)) or (not(opcode(2)) and opcode(1) and t_counter2 and not(t_counter1)) or (opcode(2) and not(opcode(1)) and t_counter2 and not(t_counter1));

--8 output equations
t0 <= not(t_counter2) and not(t_counter1) and not(t_counter0);
t1 <= not(t_counter2) and not(t_counter1) and (t_counter0);
t2 <= not(t_counter2) and (t_counter1) and not(t_counter0);
t3 <= not(t_counter2) and (t_counter1) and (t_counter0);
t4 <= (t_counter2) and not(t_counter1) and not(t_counter0);
t5 <= (t_counter2) and not(t_counter1) and (t_counter0);
t6 <= (t_counter2) and (t_counter1) and not(t_counter0);
t7 <= (t_counter2) and (t_counter1) and (t_counter0);
execute <= t_counter2;
end rtf;
				



