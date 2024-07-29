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
-- CREATED		"Fri Dec 01 02:12:30 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY port_register IS 
	PORT
	(
		r :  IN  STD_LOGIC;
		enable :  IN  STD_LOGIC;
		w :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		data_in :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END port_register;

ARCHITECTURE bdf_type OF port_register IS 

COMPONENT dreg_e
	PORT(reset : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT tri_state_model
	PORT(enable : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	read_enable :  STD_LOGIC;
SIGNAL	register_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	write_enable :  STD_LOGIC;


BEGIN 



b2v_port_register : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => write_enable,
		 d => data_in,
		 q => register_out);


b2v_port_register_buffer : tri_state_model
PORT MAP(enable => read_enable,
		 data_in => register_out,
		 data_out => data_out);


read_enable <= r AND enable;


write_enable <= w AND enable;


END bdf_type;