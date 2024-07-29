-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
-- CREATED		"Sat Nov 04 19:20:37 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY z_ff IS 
	PORT
	(
		reset :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		Z :  IN  STD_LOGIC;
		add :  IN  STD_LOGIC;
		sub :  IN  STD_LOGIC;
		inc :  IN  STD_LOGIC;
		dec :  IN  STD_LOGIC;
		t6 :  IN  STD_LOGIC;
		Z_out :  OUT  STD_LOGIC
	);
END z_ff;

ARCHITECTURE bdf_type OF z_ff IS 

COMPONENT d_ff
	PORT(reset : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 d : IN STD_LOGIC;
		 q : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT mux2
	PORT(in_1 : IN STD_LOGIC;
		 in_0 : IN STD_LOGIC;
		 sel : IN STD_LOGIC;
		 result : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	Z_d :  STD_LOGIC;
SIGNAL	Z_q :  STD_LOGIC;
SIGNAL	Z_sel :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_0 <= NOT(clock);



b2v_inst8 : d_ff
PORT MAP(reset => reset,
		 clock => SYNTHESIZED_WIRE_0,
		 d => Z_d,
		 q => Z_q);


Z_sel <= SYNTHESIZED_WIRE_1 AND t6;


b2v_Z_mux : mux2
PORT MAP(in_1 => Z,
		 in_0 => Z_q,
		 sel => Z_sel,
		 result => Z_d);


SYNTHESIZED_WIRE_1 <= add OR inc OR dec OR sub;

Z_out <= Z_q;

END bdf_type;