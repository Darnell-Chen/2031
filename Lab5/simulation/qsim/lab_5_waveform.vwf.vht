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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "02/18/2025 19:01:38"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Lab_5_State_Machine
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab_5_State_Machine_vhd_vec_tst IS
END Lab_5_State_Machine_vhd_vec_tst;
ARCHITECTURE Lab_5_State_Machine_arch OF Lab_5_State_Machine_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL b_en : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL cool : STD_LOGIC;
SIGNAL g_en : STD_LOGIC;
SIGNAL r_en : STD_LOGIC;
SIGNAL resetn : STD_LOGIC;
SIGNAL xmas : STD_LOGIC;
COMPONENT Lab_5_State_Machine
	PORT (
	b_en : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	cool : IN STD_LOGIC;
	g_en : OUT STD_LOGIC;
	r_en : OUT STD_LOGIC;
	resetn : IN STD_LOGIC;
	xmas : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab_5_State_Machine
	PORT MAP (
-- list connections between master ports and signals
	b_en => b_en,
	clk => clk,
	cool => cool,
	g_en => g_en,
	r_en => r_en,
	resetn => resetn,
	xmas => xmas
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 25000 ps;
	clk <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- resetn
t_prcs_resetn: PROCESS
BEGIN
	resetn <= '0';
	WAIT FOR 10000 ps;
	resetn <= '1';
	WAIT FOR 630000 ps;
	resetn <= '0';
	WAIT FOR 20000 ps;
	resetn <= '1';
	WAIT FOR 130000 ps;
	resetn <= '0';
	WAIT FOR 20000 ps;
	resetn <= '1';
	WAIT FOR 100000 ps;
	resetn <= '0';
WAIT;
END PROCESS t_prcs_resetn;

-- xmas
t_prcs_xmas: PROCESS
BEGIN
	xmas <= '0';
	WAIT FOR 20000 ps;
	xmas <= '1';
	WAIT FOR 240000 ps;
	xmas <= '0';
	WAIT FOR 190000 ps;
	xmas <= '1';
	WAIT FOR 190000 ps;
	xmas <= '0';
WAIT;
END PROCESS t_prcs_xmas;

-- cool
t_prcs_cool: PROCESS
BEGIN
	cool <= '0';
	WAIT FOR 240000 ps;
	cool <= '1';
	WAIT FOR 350000 ps;
	cool <= '0';
WAIT;
END PROCESS t_prcs_cool;
END Lab_5_State_Machine_arch;
