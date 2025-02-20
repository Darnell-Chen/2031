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

-- DATE "02/18/2025 19:01:39"

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

ENTITY 	Lab_5_State_Machine IS
    PORT (
	xmas : IN std_logic;
	cool : IN std_logic;
	clk : IN std_logic;
	resetn : IN std_logic;
	r_en : OUT std_logic;
	g_en : OUT std_logic;
	b_en : OUT std_logic
	);
END Lab_5_State_Machine;

ARCHITECTURE structure OF Lab_5_State_Machine IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_xmas : std_logic;
SIGNAL ww_cool : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_resetn : std_logic;
SIGNAL ww_r_en : std_logic;
SIGNAL ww_g_en : std_logic;
SIGNAL ww_b_en : std_logic;
SIGNAL \r_en~output_o\ : std_logic;
SIGNAL \g_en~output_o\ : std_logic;
SIGNAL \b_en~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \state.s1~0_combout\ : std_logic;
SIGNAL \resetn~input_o\ : std_logic;
SIGNAL \state.s1~q\ : std_logic;
SIGNAL \cool~input_o\ : std_logic;
SIGNAL \xmas~input_o\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \state.s2~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \state.s0~q\ : std_logic;
SIGNAL \ALT_INV_state.s0~q\ : std_logic;
SIGNAL \ALT_INV_state.s1~q\ : std_logic;
SIGNAL \ALT_INV_state.s2~q\ : std_logic;
SIGNAL \ALT_INV_cool~input_o\ : std_logic;
SIGNAL \ALT_INV_xmas~input_o\ : std_logic;

BEGIN

ww_xmas <= xmas;
ww_cool <= cool;
ww_clk <= clk;
ww_resetn <= resetn;
r_en <= ww_r_en;
g_en <= ww_g_en;
b_en <= ww_b_en;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_state.s0~q\ <= NOT \state.s0~q\;
\ALT_INV_state.s1~q\ <= NOT \state.s1~q\;
\ALT_INV_state.s2~q\ <= NOT \state.s2~q\;
\ALT_INV_cool~input_o\ <= NOT \cool~input_o\;
\ALT_INV_xmas~input_o\ <= NOT \xmas~input_o\;

\r_en~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state.s0~q\,
	devoe => ww_devoe,
	o => \r_en~output_o\);

\g_en~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \state.s1~q\,
	devoe => ww_devoe,
	o => \g_en~output_o\);

\b_en~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \state.s2~q\,
	devoe => ww_devoe,
	o => \b_en~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\state.s1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \state.s1~0_combout\ = !\state.s0~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.s0~q\,
	combout => \state.s1~0_combout\);

\resetn~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_resetn,
	o => \resetn~input_o\);

\state.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \state.s1~0_combout\,
	clrn => \resetn~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s1~q\);

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

\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (!\state.s1~q\ & (\state.s2~q\ & (\cool~input_o\))) # (\state.s1~q\ & (((!\xmas~input_o\) # (\cool~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011100000111010101110000011101010111000001110101011100000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.s1~q\,
	datab => \ALT_INV_state.s2~q\,
	datac => \ALT_INV_cool~input_o\,
	datad => \ALT_INV_xmas~input_o\,
	combout => \Selector1~0_combout\);

\state.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector1~0_combout\,
	clrn => \resetn~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s2~q\);

\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ((!\state.s2~q\ & ((!\state.s1~q\) # (!\xmas~input_o\)))) # (\cool~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100111110001111110011111000111111001111100011111100111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.s1~q\,
	datab => \ALT_INV_state.s2~q\,
	datac => \ALT_INV_cool~input_o\,
	datad => \ALT_INV_xmas~input_o\,
	combout => \Selector0~0_combout\);

\state.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector0~0_combout\,
	clrn => \resetn~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s0~q\);

ww_r_en <= \r_en~output_o\;

ww_g_en <= \g_en~output_o\;

ww_b_en <= \b_en~output_o\;
END structure;


