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

-- DATE "01/14/2025 19:28:59"

-- 
-- Device: Altera 5CSXFC6D6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ActivitySuggestions IS
    PORT (
	HG_out : OUT std_logic;
	M_W : IN std_logic;
	M_R : IN std_logic;
	PS_out : OUT std_logic;
	C_R : IN std_logic;
	C_T : IN std_logic;
	VB_out : OUT std_logic;
	C_W : IN std_logic;
	CY_out : OUT std_logic;
	BW_out : OUT std_logic;
	M_T : IN std_logic
	);
END ActivitySuggestions;

-- Design Ports Information
-- HG_out	=>  Location: PIN_AB28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- PS_out	=>  Location: PIN_AE29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- VB_out	=>  Location: PIN_AA28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- CY_out	=>  Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- BW_out	=>  Location: PIN_AB27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- M_T	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- M_W	=>  Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- M_R	=>  Location: PIN_AD30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- C_R	=>  Location: PIN_AC30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- C_T	=>  Location: PIN_Y26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- C_W	=>  Location: PIN_AD29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF ActivitySuggestions IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_HG_out : std_logic;
SIGNAL ww_M_W : std_logic;
SIGNAL ww_M_R : std_logic;
SIGNAL ww_PS_out : std_logic;
SIGNAL ww_C_R : std_logic;
SIGNAL ww_C_T : std_logic;
SIGNAL ww_VB_out : std_logic;
SIGNAL ww_C_W : std_logic;
SIGNAL ww_CY_out : std_logic;
SIGNAL ww_BW_out : std_logic;
SIGNAL ww_M_T : std_logic;
SIGNAL \M_T~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \M_W~input_o\ : std_logic;
SIGNAL \M_R~input_o\ : std_logic;
SIGNAL \inst1~combout\ : std_logic;
SIGNAL \C_R~input_o\ : std_logic;
SIGNAL \C_T~input_o\ : std_logic;
SIGNAL \inst4~combout\ : std_logic;
SIGNAL \C_W~input_o\ : std_logic;
SIGNAL \inst5~combout\ : std_logic;
SIGNAL \inst6~combout\ : std_logic;
SIGNAL \inst14~combout\ : std_logic;
SIGNAL \ALT_INV_inst6~combout\ : std_logic;
SIGNAL \ALT_INV_M_W~input_o\ : std_logic;
SIGNAL \ALT_INV_M_R~input_o\ : std_logic;
SIGNAL \ALT_INV_C_T~input_o\ : std_logic;
SIGNAL \ALT_INV_C_R~input_o\ : std_logic;
SIGNAL \ALT_INV_C_W~input_o\ : std_logic;

BEGIN

HG_out <= ww_HG_out;
ww_M_W <= M_W;
ww_M_R <= M_R;
PS_out <= ww_PS_out;
ww_C_R <= C_R;
ww_C_T <= C_T;
VB_out <= ww_VB_out;
ww_C_W <= C_W;
CY_out <= ww_CY_out;
BW_out <= ww_BW_out;
ww_M_T <= M_T;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_inst6~combout\ <= NOT \inst6~combout\;
\ALT_INV_M_W~input_o\ <= NOT \M_W~input_o\;
\ALT_INV_M_R~input_o\ <= NOT \M_R~input_o\;
\ALT_INV_C_T~input_o\ <= NOT \C_T~input_o\;
\ALT_INV_C_R~input_o\ <= NOT \C_R~input_o\;
\ALT_INV_C_W~input_o\ <= NOT \C_W~input_o\;

-- Location: IOOBUF_X89_Y21_N39
\HG_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1~combout\,
	devoe => ww_devoe,
	o => ww_HG_out);

-- Location: IOOBUF_X89_Y23_N39
\PS_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4~combout\,
	devoe => ww_devoe,
	o => ww_PS_out);

-- Location: IOOBUF_X89_Y21_N56
\VB_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5~combout\,
	devoe => ww_devoe,
	o => ww_VB_out);

-- Location: IOOBUF_X89_Y23_N5
\CY_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_inst6~combout\,
	devoe => ww_devoe,
	o => ww_CY_out);

-- Location: IOOBUF_X89_Y23_N22
\BW_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst14~combout\,
	devoe => ww_devoe,
	o => ww_BW_out);

-- Location: IOIBUF_X89_Y25_N21
\M_W~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_M_W,
	o => \M_W~input_o\);

-- Location: IOIBUF_X89_Y25_N38
\M_R~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_M_R,
	o => \M_R~input_o\);

-- Location: LABCELL_X88_Y23_N30
inst1 : cyclonev_lcell_comb
-- Equation(s):
-- \inst1~combout\ = ( !\M_R~input_o\ & ( \M_W~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_M_W~input_o\,
	dataf => \ALT_INV_M_R~input_o\,
	combout => \inst1~combout\);

-- Location: IOIBUF_X89_Y25_N55
\C_R~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_C_R,
	o => \C_R~input_o\);

-- Location: IOIBUF_X89_Y25_N4
\C_T~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_C_T,
	o => \C_T~input_o\);

-- Location: LABCELL_X88_Y23_N39
inst4 : cyclonev_lcell_comb
-- Equation(s):
-- \inst4~combout\ = ( \C_T~input_o\ & ( (!\C_R~input_o\ & ((!\M_W~input_o\) # (\M_R~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101000101010001000000000000000001010001010100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_C_R~input_o\,
	datab => \ALT_INV_M_R~input_o\,
	datac => \ALT_INV_M_W~input_o\,
	datae => \ALT_INV_C_T~input_o\,
	combout => \inst4~combout\);

-- Location: IOIBUF_X89_Y23_N55
\C_W~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_C_W,
	o => \C_W~input_o\);

-- Location: LABCELL_X88_Y23_N42
inst5 : cyclonev_lcell_comb
-- Equation(s):
-- \inst5~combout\ = ( !\C_W~input_o\ & ( (\C_T~input_o\ & !\C_R~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000000000000000000000110000001100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_C_T~input_o\,
	datac => \ALT_INV_C_R~input_o\,
	datae => \ALT_INV_C_W~input_o\,
	combout => \inst5~combout\);

-- Location: LABCELL_X88_Y23_N51
inst6 : cyclonev_lcell_comb
-- Equation(s):
-- \inst6~combout\ = ( \C_R~input_o\ & ( \M_R~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_M_R~input_o\,
	datae => \ALT_INV_C_R~input_o\,
	combout => \inst6~combout\);

-- Location: LABCELL_X88_Y23_N24
inst14 : cyclonev_lcell_comb
-- Equation(s):
-- \inst14~combout\ = ( \C_R~input_o\ & ( !\M_R~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_M_R~input_o\,
	datae => \ALT_INV_C_R~input_o\,
	combout => \inst14~combout\);

-- Location: IOIBUF_X28_Y81_N52
\M_T~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_M_T,
	o => \M_T~input_o\);

-- Location: LABCELL_X36_Y27_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


