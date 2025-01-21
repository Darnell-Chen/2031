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
-- Generated on "01/14/2025 19:28:58"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ActivitySuggestions
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ActivitySuggestions_vhd_vec_tst IS
END ActivitySuggestions_vhd_vec_tst;
ARCHITECTURE ActivitySuggestions_arch OF ActivitySuggestions_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL BW_out : STD_LOGIC;
SIGNAL C_R : STD_LOGIC;
SIGNAL C_T : STD_LOGIC;
SIGNAL C_W : STD_LOGIC;
SIGNAL CY_out : STD_LOGIC;
SIGNAL HG_out : STD_LOGIC;
SIGNAL M_R : STD_LOGIC;
SIGNAL M_T : STD_LOGIC;
SIGNAL M_W : STD_LOGIC;
SIGNAL PS_out : STD_LOGIC;
SIGNAL VB_out : STD_LOGIC;
COMPONENT ActivitySuggestions
	PORT (
	BW_out : OUT STD_LOGIC;
	C_R : IN STD_LOGIC;
	C_T : IN STD_LOGIC;
	C_W : IN STD_LOGIC;
	CY_out : OUT STD_LOGIC;
	HG_out : OUT STD_LOGIC;
	M_R : IN STD_LOGIC;
	M_T : IN STD_LOGIC;
	M_W : IN STD_LOGIC;
	PS_out : OUT STD_LOGIC;
	VB_out : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ActivitySuggestions
	PORT MAP (
-- list connections between master ports and signals
	BW_out => BW_out,
	C_R => C_R,
	C_T => C_T,
	C_W => C_W,
	CY_out => CY_out,
	HG_out => HG_out,
	M_R => M_R,
	M_T => M_T,
	M_W => M_W,
	PS_out => PS_out,
	VB_out => VB_out
	);

-- C_R
t_prcs_C_R: PROCESS
BEGIN
LOOP
	C_R <= '0';
	WAIT FOR 1600000 ps;
	C_R <= '1';
	WAIT FOR 1600000 ps;
	IF (NOW >= 3200000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_C_R;

-- C_T
t_prcs_C_T: PROCESS
BEGIN
LOOP
	C_T <= '0';
	WAIT FOR 800000 ps;
	C_T <= '1';
	WAIT FOR 800000 ps;
	IF (NOW >= 3200000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_C_T;

-- C_W
t_prcs_C_W: PROCESS
BEGIN
LOOP
	C_W <= '0';
	WAIT FOR 400000 ps;
	C_W <= '1';
	WAIT FOR 400000 ps;
	IF (NOW >= 3200000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_C_W;

-- M_R
t_prcs_M_R: PROCESS
BEGIN
LOOP
	M_R <= '0';
	WAIT FOR 200000 ps;
	M_R <= '1';
	WAIT FOR 200000 ps;
	IF (NOW >= 3200000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_M_R;

-- M_T
t_prcs_M_T: PROCESS
BEGIN
LOOP
	M_T <= '0';
	WAIT FOR 100000 ps;
	M_T <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 3200000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_M_T;

-- M_W
t_prcs_M_W: PROCESS
BEGIN
LOOP
	M_W <= '0';
	WAIT FOR 50000 ps;
	M_W <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 3200000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_M_W;
END ActivitySuggestions_arch;
