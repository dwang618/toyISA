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
-- CREATED		"Fri Sep 15 02:20:34 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;



ENTITY opcode_decoder IS 
	PORT
	(
		execute :  IN  STD_LOGIC;
		opcode :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		load : OUT STD_LOGIC;
		store : OUT STD_LOGIC;
		add : OUT STD_LOGIC;
		sub : OUT STD_LOGIC;
		inc : OUT STD_LOGIC;
		dec : OUT STD_LOGIC;
		bra : OUT STD_LOGIC;
		beq : OUT STD_LOGIC
	);
END opcode_decoder;

ARCHITECTURE gate_level OF opcode_decoder IS 

BEGIN 
	load <= NOT(opcode(0)) AND NOT(opcode(1)) AND NOT(opcode(2)) AND execute;
	store <= (opcode(0)) AND NOT(opcode(1)) AND NOT (opcode(2)) AND execute;
	add <= NOT(opcode(0)) AND (opcode(1)) AND NOT(opcode(2)) AND execute;
	sub <= (opcode(0)) AND (opcode(1)) AND NOT (opcode(2)) AND execute;
	inc <= NOT(opcode(0)) AND NOT(opcode(1)) AND (opcode(2)) AND execute;
	dec <= (opcode(0)) AND NOT(opcode(1)) AND (opcode(2)) AND execute;
	bra <= NOT(opcode(0)) AND (opcode(1)) AND (opcode(2)) AND execute;
	beq <= (opcode(0)) AND (opcode(1)) AND (opcode(2)) AND execute;





END gate_level;