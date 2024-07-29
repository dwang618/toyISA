LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL;
entity control_signals_logic is
port (
load : in std_logic;
store : in std_logic;
add : in std_logic;
sub : in std_logic;
inc : in std_logic;
dec : in std_logic;
bra : in std_logic;
beq : in std_logic;
t0 : in std_logic;
t1 : in std_logic;
t2 : in std_logic;
t3 : in std_logic;
t4 : in std_logic;
t5 : in std_logic;
t6 : in std_logic;
t7 : in std_logic;
Z : in std_logic;
r : out std_logic; -- read signal
w : out std_logic; -- write signal
cmar : out std_logic;
cmbr : out std_logic;
embr : out std_logic;
cir : out std_logic;
eir : out std_logic;
cpc : out std_logic;
epc : out std_logic;
cd0 : out std_logic;
ed0 : out std_logic;
calu : out std_logic;
ealu : out std_logic;
F0 : out std_logic;
F1 : out std_logic
);
end control_signals_logic;
architecture rtl of control_signals_logic is
begin -- rtl
	r <= (t1) OR (load AND t5) OR (add AND t5) OR (sub AND t5) OR (inc AND t5) OR (dec AND t5);
	w <= (store AND t5) OR (inc AND t7) OR (dec AND t7);
	cmar <= (t0) OR (load AND t4) OR (store AND t4) OR (add AND t4) OR (sub AND t4) OR (inc AND t4) OR (dec AND t4);
	cmbr <= (add AND t5) OR (sub AND t5) OR (inc AND t5) OR (dec AND t5);
	embr <= (add AND t6) OR (sub AND t6) OR (inc AND t6) OR (dec AND t6);
	cir <= (t1);
	eir <= (load AND t4) OR (store AND t4) OR (add AND t4) OR (sub AND t4) OR (inc AND t4) OR (dec AND t4) OR (bra AND t4) OR (beq AND t4 AND Z);
	cpc <= (t3) OR (bra AND t4) OR (beq AND t4 and Z);
	epc <= (t0) OR (t2);
	cd0 <= (load AND t5) OR (add AND t7) OR (sub AND t7);
	ed0 <= (store AND t5);
	calu <= (t2) OR (add AND t6) OR (sub AND t6) OR (inc AND t6) OR (dec AND t6);
	ealu <= (t3) OR (add AND t7) OR (sub AND t7) OR (inc AND t7) OR (dec AND t7);
	F0 <= (sub AND t6) OR (dec AND t6);
	F1 <= (t2) OR (inc AND t6) OR (dec AND t6);
end rtl;
