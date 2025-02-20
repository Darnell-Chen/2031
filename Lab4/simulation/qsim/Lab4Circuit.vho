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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "02/14/2025 15:07:33"

-- 
-- Device: Altera 5CSXFC6D6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Lab4Circuit IS
    PORT (
	Q : OUT std_logic_vector(1 DOWNTO 0);
	clock : IN std_logic;
	cool : IN std_logic;
	xmas : IN std_logic;
	resetn : IN std_logic
	);
END Lab4Circuit;

ARCHITECTURE structure OF Lab4Circuit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Q : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_clock : std_logic;
SIGNAL ww_cool : std_logic;
SIGNAL ww_xmas : std_logic;
SIGNAL ww_resetn : std_logic;
SIGNAL \Q[1]~output_o\ : std_logic;
SIGNAL \Q[0]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \inst10~combout\ : std_logic;
SIGNAL \resetn~input_o\ : std_logic;
SIGNAL \inst14|10~q\ : std_logic;
SIGNAL \cool~input_o\ : std_logic;
SIGNAL \xmas~input_o\ : std_logic;
SIGNAL \inst5~0_combout\ : std_logic;
SIGNAL \inst14|9~q\ : std_logic;
SIGNAL \inst14|ALT_INV_9~q\ : std_logic;
SIGNAL \inst14|ALT_INV_10~q\ : std_logic;
SIGNAL \ALT_INV_cool~input_o\ : std_logic;
SIGNAL \ALT_INV_xmas~input_o\ : std_logic;

BEGIN

Q <= ww_Q;
ww_clock <= clock;
ww_cool <= cool;
ww_xmas <= xmas;
ww_resetn <= resetn;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst14|ALT_INV_9~q\ <= NOT \inst14|9~q\;
\inst14|ALT_INV_10~q\ <= NOT \inst14|10~q\;
\ALT_INV_cool~input_o\ <= NOT \cool~input_o\;
\ALT_INV_xmas~input_o\ <= NOT \xmas~input_o\;

\Q[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst14|9~q\,
	devoe => ww_devoe,
	o => \Q[1]~output_o\);

\Q[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst14|10~q\,
	devoe => ww_devoe,
	o => \Q[0]~output_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

inst10 : cyclonev_lcell_comb
-- Equation(s):
-- \inst10~combout\ = (!\inst14|9~q\ & !\inst14|10~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst14|ALT_INV_9~q\,
	datab => \inst14|ALT_INV_10~q\,
	combout => \inst10~combout\);

\resetn~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_resetn,
	o => \resetn~input_o\);

\inst14|10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst10~combout\,
	clrn => \resetn~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst14|10~q\);

\cool~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cool,
	o => \cool~input_o\);

\xmas~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xmas,
	o => \xmas~input_o\);

\inst5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5~0_combout\ = (!\inst14|10~q\ & (\inst14|9~q\ & (\cool~input_o\))) # (\inst14|10~q\ & (((!\xmas~input_o\) # (\cool~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011100000111001101110000011100110111000001110011011100000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst14|ALT_INV_9~q\,
	datab => \inst14|ALT_INV_10~q\,
	datac => \ALT_INV_cool~input_o\,
	datad => \ALT_INV_xmas~input_o\,
	combout => \inst5~0_combout\);

\inst14|9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst5~0_combout\,
	clrn => \resetn~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst14|9~q\);

ww_Q(1) <= \Q[1]~output_o\;

ww_Q(0) <= \Q[0]~output_o\;
END structure;


