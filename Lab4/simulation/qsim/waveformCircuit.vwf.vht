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
-- Generated on "02/11/2025 03:10:40"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Lab4Circuit
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab4Circuit_vhd_vec_tst IS
END Lab4Circuit_vhd_vec_tst;
ARCHITECTURE Lab4Circuit_arch OF Lab4Circuit_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL cool : STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL resetn : STD_LOGIC;
SIGNAL xmas : STD_LOGIC;
COMPONENT Lab4Circuit
	PORT (
	clock : IN STD_LOGIC;
	cool : IN STD_LOGIC;
	Q : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	resetn : IN STD_LOGIC;
	xmas : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab4Circuit
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	cool => cool,
	Q => Q,
	resetn => resetn,
	xmas => xmas
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
	clock <= '0';
WAIT;
END PROCESS t_prcs_clock;

-- cool
t_prcs_cool: PROCESS
BEGIN
	cool <= '0';
WAIT;
END PROCESS t_prcs_cool;

-- resetn
t_prcs_resetn: PROCESS
BEGIN
	resetn <= '0';
WAIT;
END PROCESS t_prcs_resetn;

-- xmas
t_prcs_xmas: PROCESS
BEGIN
	xmas <= '0';
WAIT;
END PROCESS t_prcs_xmas;
END Lab4Circuit_arch;
