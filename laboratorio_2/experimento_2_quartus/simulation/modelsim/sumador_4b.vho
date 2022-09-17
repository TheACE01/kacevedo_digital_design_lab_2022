-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "09/02/2022 12:15:02"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
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

ENTITY 	sumador_deco_4 IS
    PORT (
	A : IN std_logic_vector(3 DOWNTO 0);
	B : IN std_logic_vector(3 DOWNTO 0);
	Cin : IN std_logic;
	Cout : BUFFER std_logic;
	S : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END sumador_deco_4;

-- Design Ports Information
-- Cout	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[0]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[1]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[2]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[4]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[5]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[6]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cin	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF sumador_deco_4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Cin : std_logic;
SIGNAL ww_Cout : std_logic;
SIGNAL ww_S : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \Cin~input_o\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \sumador|FA1|U3|Z~combout\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \sumador|FA3|U3|Z~combout\ : std_logic;
SIGNAL \sumador|FA3|U1|S~combout\ : std_logic;
SIGNAL \sumador|FA1|U2|S~combout\ : std_logic;
SIGNAL \sumador|FA0|U2|S~combout\ : std_logic;
SIGNAL \deco|S[0]~0_combout\ : std_logic;
SIGNAL \deco|S[1]~1_combout\ : std_logic;
SIGNAL \deco|S[2]~2_combout\ : std_logic;
SIGNAL \deco|S[3]~3_combout\ : std_logic;
SIGNAL \deco|S[4]~4_combout\ : std_logic;
SIGNAL \deco|S[5]~5_combout\ : std_logic;
SIGNAL \deco|S[6]~6_combout\ : std_logic;
SIGNAL \ALT_INV_Cin~input_o\ : std_logic;
SIGNAL \ALT_INV_B[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[3]~input_o\ : std_logic;
SIGNAL \sumador|FA1|U2|ALT_INV_S~combout\ : std_logic;
SIGNAL \sumador|FA0|U2|ALT_INV_S~combout\ : std_logic;
SIGNAL \sumador|FA3|U1|ALT_INV_S~combout\ : std_logic;
SIGNAL \sumador|FA1|U3|ALT_INV_Z~combout\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_Cin <= Cin;
Cout <= ww_Cout;
S <= ww_S;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Cin~input_o\ <= NOT \Cin~input_o\;
\ALT_INV_B[0]~input_o\ <= NOT \B[0]~input_o\;
\ALT_INV_A[0]~input_o\ <= NOT \A[0]~input_o\;
\ALT_INV_B[1]~input_o\ <= NOT \B[1]~input_o\;
\ALT_INV_A[1]~input_o\ <= NOT \A[1]~input_o\;
\ALT_INV_B[2]~input_o\ <= NOT \B[2]~input_o\;
\ALT_INV_A[2]~input_o\ <= NOT \A[2]~input_o\;
\ALT_INV_B[3]~input_o\ <= NOT \B[3]~input_o\;
\ALT_INV_A[3]~input_o\ <= NOT \A[3]~input_o\;
\sumador|FA1|U2|ALT_INV_S~combout\ <= NOT \sumador|FA1|U2|S~combout\;
\sumador|FA0|U2|ALT_INV_S~combout\ <= NOT \sumador|FA0|U2|S~combout\;
\sumador|FA3|U1|ALT_INV_S~combout\ <= NOT \sumador|FA3|U1|S~combout\;
\sumador|FA1|U3|ALT_INV_Z~combout\ <= NOT \sumador|FA1|U3|Z~combout\;

-- Location: IOOBUF_X52_Y0_N2
\Cout~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sumador|FA3|U3|Z~combout\,
	devoe => ww_devoe,
	o => ww_Cout);

-- Location: IOOBUF_X89_Y4_N96
\S[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \deco|S[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_S(0));

-- Location: IOOBUF_X89_Y13_N39
\S[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \deco|S[1]~1_combout\,
	devoe => ww_devoe,
	o => ww_S(1));

-- Location: IOOBUF_X89_Y13_N56
\S[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \deco|S[2]~2_combout\,
	devoe => ww_devoe,
	o => ww_S(2));

-- Location: IOOBUF_X89_Y4_N79
\S[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \deco|S[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_S(3));

-- Location: IOOBUF_X89_Y11_N96
\S[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \deco|S[4]~4_combout\,
	devoe => ww_devoe,
	o => ww_S(4));

-- Location: IOOBUF_X89_Y11_N79
\S[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \deco|S[5]~5_combout\,
	devoe => ww_devoe,
	o => ww_S(5));

-- Location: IOOBUF_X89_Y8_N39
\S[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \deco|S[6]~6_combout\,
	devoe => ww_devoe,
	o => ww_S(6));

-- Location: IOIBUF_X8_Y0_N35
\B[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

-- Location: IOIBUF_X2_Y0_N58
\A[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: IOIBUF_X12_Y0_N18
\B[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

-- Location: IOIBUF_X4_Y0_N35
\A[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: IOIBUF_X16_Y0_N18
\Cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cin,
	o => \Cin~input_o\);

-- Location: IOIBUF_X4_Y0_N1
\A[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\B[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

-- Location: LABCELL_X22_Y4_N30
\sumador|FA1|U3|Z\ : cyclonev_lcell_comb
-- Equation(s):
-- \sumador|FA1|U3|Z~combout\ = ( \B[1]~input_o\ & ( ((!\B[0]~input_o\ & (\A[0]~input_o\ & \Cin~input_o\)) # (\B[0]~input_o\ & ((\Cin~input_o\) # (\A[0]~input_o\)))) # (\A[1]~input_o\) ) ) # ( !\B[1]~input_o\ & ( (\A[1]~input_o\ & ((!\B[0]~input_o\ & 
-- (\A[0]~input_o\ & \Cin~input_o\)) # (\B[0]~input_o\ & ((\Cin~input_o\) # (\A[0]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000000000001011100010111111111110001011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[0]~input_o\,
	datab => \ALT_INV_A[0]~input_o\,
	datac => \ALT_INV_Cin~input_o\,
	datad => \ALT_INV_A[1]~input_o\,
	dataf => \ALT_INV_B[1]~input_o\,
	combout => \sumador|FA1|U3|Z~combout\);

-- Location: IOIBUF_X4_Y0_N52
\B[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

-- Location: IOIBUF_X4_Y0_N18
\A[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: LABCELL_X22_Y4_N39
\sumador|FA3|U3|Z\ : cyclonev_lcell_comb
-- Equation(s):
-- \sumador|FA3|U3|Z~combout\ = ( \A[2]~input_o\ & ( (!\A[3]~input_o\ & (\B[3]~input_o\ & ((\sumador|FA1|U3|Z~combout\) # (\B[2]~input_o\)))) # (\A[3]~input_o\ & (((\B[3]~input_o\) # (\sumador|FA1|U3|Z~combout\)) # (\B[2]~input_o\))) ) ) # ( !\A[2]~input_o\ 
-- & ( (!\A[3]~input_o\ & (\B[2]~input_o\ & (\sumador|FA1|U3|Z~combout\ & \B[3]~input_o\))) # (\A[3]~input_o\ & (((\B[2]~input_o\ & \sumador|FA1|U3|Z~combout\)) # (\B[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100110111000000010011011100010011011111110001001101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[2]~input_o\,
	datab => \ALT_INV_A[3]~input_o\,
	datac => \sumador|FA1|U3|ALT_INV_Z~combout\,
	datad => \ALT_INV_B[3]~input_o\,
	dataf => \ALT_INV_A[2]~input_o\,
	combout => \sumador|FA3|U3|Z~combout\);

-- Location: LABCELL_X22_Y4_N12
\sumador|FA3|U1|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \sumador|FA3|U1|S~combout\ = ( \B[3]~input_o\ & ( !\A[3]~input_o\ ) ) # ( !\B[3]~input_o\ & ( \A[3]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011110011001100110000110011001100111100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_A[3]~input_o\,
	datae => \ALT_INV_B[3]~input_o\,
	combout => \sumador|FA3|U1|S~combout\);

-- Location: LABCELL_X22_Y4_N33
\sumador|FA1|U2|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \sumador|FA1|U2|S~combout\ = ( \A[1]~input_o\ & ( !\B[1]~input_o\ $ (((!\B[0]~input_o\ & (\A[0]~input_o\ & \Cin~input_o\)) # (\B[0]~input_o\ & ((\Cin~input_o\) # (\A[0]~input_o\))))) ) ) # ( !\A[1]~input_o\ & ( !\B[1]~input_o\ $ (((!\B[0]~input_o\ & 
-- ((!\A[0]~input_o\) # (!\Cin~input_o\))) # (\B[0]~input_o\ & (!\A[0]~input_o\ & !\Cin~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111001111000000111100111100011100001100001111110000110000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[0]~input_o\,
	datab => \ALT_INV_A[0]~input_o\,
	datac => \ALT_INV_B[1]~input_o\,
	datad => \ALT_INV_Cin~input_o\,
	dataf => \ALT_INV_A[1]~input_o\,
	combout => \sumador|FA1|U2|S~combout\);

-- Location: LABCELL_X22_Y4_N36
\sumador|FA0|U2|S\ : cyclonev_lcell_comb
-- Equation(s):
-- \sumador|FA0|U2|S~combout\ = ( \A[0]~input_o\ & ( !\B[0]~input_o\ $ (\Cin~input_o\) ) ) # ( !\A[0]~input_o\ & ( !\B[0]~input_o\ $ (!\Cin~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000011110000000011111111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_B[0]~input_o\,
	datad => \ALT_INV_Cin~input_o\,
	dataf => \ALT_INV_A[0]~input_o\,
	combout => \sumador|FA0|U2|S~combout\);

-- Location: LABCELL_X22_Y4_N48
\deco|S[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \deco|S[0]~0_combout\ = ( \sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (!\B[2]~input_o\ & ((!\sumador|FA3|U1|S~combout\ & (\sumador|FA1|U2|S~combout\ & !\sumador|FA1|U3|Z~combout\)) # (\sumador|FA3|U1|S~combout\ & (!\sumador|FA1|U2|S~combout\ & 
-- \sumador|FA1|U3|Z~combout\)))) # (\B[2]~input_o\ & (\sumador|FA3|U1|S~combout\ & (!\sumador|FA1|U2|S~combout\ $ (\sumador|FA1|U3|Z~combout\)))) ) ) ) # ( !\sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (!\sumador|FA1|U2|S~combout\ & 
-- (!\sumador|FA3|U1|S~combout\ $ (((!\B[2]~input_o\) # (!\sumador|FA1|U3|Z~combout\))))) ) ) ) # ( \sumador|FA0|U2|S~combout\ & ( !\A[2]~input_o\ & ( (!\B[2]~input_o\ & (!\sumador|FA3|U1|S~combout\ & (!\sumador|FA1|U2|S~combout\ $ 
-- (\sumador|FA1|U3|Z~combout\)))) # (\B[2]~input_o\ & ((!\sumador|FA3|U1|S~combout\ & (\sumador|FA1|U2|S~combout\ & !\sumador|FA1|U3|Z~combout\)) # (\sumador|FA3|U1|S~combout\ & (!\sumador|FA1|U2|S~combout\ & \sumador|FA1|U3|Z~combout\)))) ) ) ) # ( 
-- !\sumador|FA0|U2|S~combout\ & ( !\A[2]~input_o\ & ( (!\sumador|FA1|U2|S~combout\ & (!\sumador|FA3|U1|S~combout\ $ (((\sumador|FA1|U3|Z~combout\) # (\B[2]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001000000110000100001000001100000110000011000000001100000100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[2]~input_o\,
	datab => \sumador|FA3|U1|ALT_INV_S~combout\,
	datac => \sumador|FA1|U2|ALT_INV_S~combout\,
	datad => \sumador|FA1|U3|ALT_INV_Z~combout\,
	datae => \sumador|FA0|U2|ALT_INV_S~combout\,
	dataf => \ALT_INV_A[2]~input_o\,
	combout => \deco|S[0]~0_combout\);

-- Location: LABCELL_X22_Y4_N54
\deco|S[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \deco|S[1]~1_combout\ = ( \sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( !\sumador|FA3|U1|S~combout\ $ (((!\B[2]~input_o\ & ((!\sumador|FA1|U2|S~combout\) # (\sumador|FA1|U3|Z~combout\))) # (\B[2]~input_o\ & ((!\sumador|FA1|U3|Z~combout\) # 
-- (\sumador|FA1|U2|S~combout\))))) ) ) ) # ( !\sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (\sumador|FA3|U1|S~combout\ & (\sumador|FA1|U2|S~combout\ & (!\B[2]~input_o\ $ (!\sumador|FA1|U3|Z~combout\)))) ) ) ) # ( \sumador|FA0|U2|S~combout\ & ( 
-- !\A[2]~input_o\ & ( !\sumador|FA3|U1|S~combout\ $ (((!\B[2]~input_o\ & (!\sumador|FA1|U2|S~combout\ & \sumador|FA1|U3|Z~combout\)) # (\B[2]~input_o\ & ((!\sumador|FA1|U2|S~combout\) # (\sumador|FA1|U3|Z~combout\))))) ) ) ) # ( !\sumador|FA0|U2|S~combout\ 
-- & ( !\A[2]~input_o\ & ( (\sumador|FA1|U2|S~combout\ & ((!\B[2]~input_o\ & (!\sumador|FA3|U1|S~combout\ & !\sumador|FA1|U3|Z~combout\)) # (\B[2]~input_o\ & (\sumador|FA3|U1|S~combout\ & \sumador|FA1|U3|Z~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000001100111000011100100000001000000100011100101100011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[2]~input_o\,
	datab => \sumador|FA3|U1|ALT_INV_S~combout\,
	datac => \sumador|FA1|U2|ALT_INV_S~combout\,
	datad => \sumador|FA1|U3|ALT_INV_Z~combout\,
	datae => \sumador|FA0|U2|ALT_INV_S~combout\,
	dataf => \ALT_INV_A[2]~input_o\,
	combout => \deco|S[1]~1_combout\);

-- Location: LABCELL_X22_Y4_N0
\deco|S[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \deco|S[2]~2_combout\ = ( \sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (!\B[2]~input_o\ & ((!\sumador|FA3|U1|S~combout\ & ((!\sumador|FA1|U2|S~combout\) # (!\sumador|FA1|U3|Z~combout\))) # (\sumador|FA3|U1|S~combout\ & 
-- ((\sumador|FA1|U3|Z~combout\))))) # (\B[2]~input_o\ & (((!\sumador|FA1|U2|S~combout\ & !\sumador|FA1|U3|Z~combout\)) # (\sumador|FA3|U1|S~combout\))) ) ) ) # ( !\sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (!\sumador|FA1|U2|S~combout\ & 
-- ((!\B[2]~input_o\ & (!\sumador|FA3|U1|S~combout\ & !\sumador|FA1|U3|Z~combout\)) # (\B[2]~input_o\ & (\sumador|FA3|U1|S~combout\ & \sumador|FA1|U3|Z~combout\)))) ) ) ) # ( \sumador|FA0|U2|S~combout\ & ( !\A[2]~input_o\ & ( (!\sumador|FA1|U2|S~combout\ & 
-- ((!\sumador|FA3|U1|S~combout\) # (!\B[2]~input_o\ $ (\sumador|FA1|U3|Z~combout\)))) # (\sumador|FA1|U2|S~combout\ & (!\sumador|FA3|U1|S~combout\ $ (((\B[2]~input_o\ & \sumador|FA1|U3|Z~combout\))))) ) ) ) # ( !\sumador|FA0|U2|S~combout\ & ( 
-- !\A[2]~input_o\ & ( (!\sumador|FA3|U1|S~combout\ & (!\sumador|FA1|U2|S~combout\ & (!\B[2]~input_o\ $ (!\sumador|FA1|U3|Z~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000010000000111011001101100110000000000100001101100110110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[2]~input_o\,
	datab => \sumador|FA3|U1|ALT_INV_S~combout\,
	datac => \sumador|FA1|U2|ALT_INV_S~combout\,
	datad => \sumador|FA1|U3|ALT_INV_Z~combout\,
	datae => \sumador|FA0|U2|ALT_INV_S~combout\,
	dataf => \ALT_INV_A[2]~input_o\,
	combout => \deco|S[2]~2_combout\);

-- Location: LABCELL_X22_Y4_N6
\deco|S[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \deco|S[3]~3_combout\ = ( \sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (!\sumador|FA1|U2|S~combout\ & (\sumador|FA3|U1|S~combout\ & (!\B[2]~input_o\ $ (!\sumador|FA1|U3|Z~combout\)))) # (\sumador|FA1|U2|S~combout\ & (!\B[2]~input_o\ $ 
-- (((\sumador|FA1|U3|Z~combout\))))) ) ) ) # ( !\sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (!\B[2]~input_o\ & (!\sumador|FA3|U1|S~combout\ & (!\sumador|FA1|U2|S~combout\ $ (\sumador|FA1|U3|Z~combout\)))) # (\B[2]~input_o\ & 
-- ((!\sumador|FA3|U1|S~combout\ & (\sumador|FA1|U2|S~combout\ & !\sumador|FA1|U3|Z~combout\)) # (\sumador|FA3|U1|S~combout\ & (!\sumador|FA1|U2|S~combout\ & \sumador|FA1|U3|Z~combout\)))) ) ) ) # ( \sumador|FA0|U2|S~combout\ & ( !\A[2]~input_o\ & ( 
-- (!\sumador|FA1|U2|S~combout\ & ((!\B[2]~input_o\ & (!\sumador|FA3|U1|S~combout\ & !\sumador|FA1|U3|Z~combout\)) # (\B[2]~input_o\ & (\sumador|FA3|U1|S~combout\ & \sumador|FA1|U3|Z~combout\)))) # (\sumador|FA1|U2|S~combout\ & (!\B[2]~input_o\ $ 
-- (((!\sumador|FA1|U3|Z~combout\))))) ) ) ) # ( !\sumador|FA0|U2|S~combout\ & ( !\A[2]~input_o\ & ( (!\B[2]~input_o\ & ((!\sumador|FA3|U1|S~combout\ & (!\sumador|FA1|U2|S~combout\ & \sumador|FA1|U3|Z~combout\)) # (\sumador|FA3|U1|S~combout\ & 
-- (\sumador|FA1|U2|S~combout\ & !\sumador|FA1|U3|Z~combout\)))) # (\B[2]~input_o\ & (!\sumador|FA3|U1|S~combout\ & (!\sumador|FA1|U2|S~combout\ $ (\sumador|FA1|U3|Z~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100001010000100100001010001101010000100000110000001101000100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[2]~input_o\,
	datab => \sumador|FA3|U1|ALT_INV_S~combout\,
	datac => \sumador|FA1|U2|ALT_INV_S~combout\,
	datad => \sumador|FA1|U3|ALT_INV_Z~combout\,
	datae => \sumador|FA0|U2|ALT_INV_S~combout\,
	dataf => \ALT_INV_A[2]~input_o\,
	combout => \deco|S[3]~3_combout\);

-- Location: LABCELL_X22_Y4_N42
\deco|S[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \deco|S[4]~4_combout\ = ( \sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (\sumador|FA1|U2|S~combout\ & ((!\B[2]~input_o\ & (\sumador|FA3|U1|S~combout\ & !\sumador|FA1|U3|Z~combout\)) # (\B[2]~input_o\ & (!\sumador|FA3|U1|S~combout\ & 
-- \sumador|FA1|U3|Z~combout\)))) ) ) ) # ( !\sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (!\B[2]~input_o\ & (\sumador|FA3|U1|S~combout\ & ((!\sumador|FA1|U3|Z~combout\) # (\sumador|FA1|U2|S~combout\)))) # (\B[2]~input_o\ & ((!\sumador|FA3|U1|S~combout\ 
-- & ((\sumador|FA1|U3|Z~combout\))) # (\sumador|FA3|U1|S~combout\ & (\sumador|FA1|U2|S~combout\ & !\sumador|FA1|U3|Z~combout\)))) ) ) ) # ( \sumador|FA0|U2|S~combout\ & ( !\A[2]~input_o\ & ( (\sumador|FA3|U1|S~combout\ & (\sumador|FA1|U2|S~combout\ & 
-- (!\B[2]~input_o\ $ (!\sumador|FA1|U3|Z~combout\)))) ) ) ) # ( !\sumador|FA0|U2|S~combout\ & ( !\A[2]~input_o\ & ( (!\sumador|FA1|U2|S~combout\ & (\sumador|FA3|U1|S~combout\ & (!\B[2]~input_o\ $ (!\sumador|FA1|U3|Z~combout\)))) # 
-- (\sumador|FA1|U2|S~combout\ & (!\sumador|FA3|U1|S~combout\ $ (((\sumador|FA1|U3|Z~combout\) # (\B[2]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001100100100011000000010000001000100011010001100000001000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[2]~input_o\,
	datab => \sumador|FA3|U1|ALT_INV_S~combout\,
	datac => \sumador|FA1|U2|ALT_INV_S~combout\,
	datad => \sumador|FA1|U3|ALT_INV_Z~combout\,
	datae => \sumador|FA0|U2|ALT_INV_S~combout\,
	dataf => \ALT_INV_A[2]~input_o\,
	combout => \deco|S[4]~4_combout\);

-- Location: LABCELL_X22_Y4_N18
\deco|S[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \deco|S[5]~5_combout\ = ( \sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (!\sumador|FA3|U1|S~combout\ & (!\sumador|FA1|U2|S~combout\ $ (((\sumador|FA1|U3|Z~combout\) # (\B[2]~input_o\))))) # (\sumador|FA3|U1|S~combout\ & ((!\B[2]~input_o\ & 
-- (\sumador|FA1|U2|S~combout\ & !\sumador|FA1|U3|Z~combout\)) # (\B[2]~input_o\ & (!\sumador|FA1|U2|S~combout\ & \sumador|FA1|U3|Z~combout\)))) ) ) ) # ( !\sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (!\B[2]~input_o\ & (!\sumador|FA1|U3|Z~combout\ & 
-- ((\sumador|FA1|U2|S~combout\) # (\sumador|FA3|U1|S~combout\)))) # (\B[2]~input_o\ & (\sumador|FA1|U3|Z~combout\ & ((!\sumador|FA3|U1|S~combout\) # (\sumador|FA1|U2|S~combout\)))) ) ) ) # ( \sumador|FA0|U2|S~combout\ & ( !\A[2]~input_o\ & ( 
-- (!\sumador|FA1|U2|S~combout\ & (!\sumador|FA3|U1|S~combout\ & (!\B[2]~input_o\ $ (!\sumador|FA1|U3|Z~combout\)))) # (\sumador|FA1|U2|S~combout\ & (!\sumador|FA3|U1|S~combout\ $ (((!\B[2]~input_o\) # (!\sumador|FA1|U3|Z~combout\))))) ) ) ) # ( 
-- !\sumador|FA0|U2|S~combout\ & ( !\A[2]~input_o\ & ( (!\sumador|FA3|U1|S~combout\ & (\sumador|FA1|U2|S~combout\ & (!\B[2]~input_o\ $ (!\sumador|FA1|U3|Z~combout\)))) # (\sumador|FA3|U1|S~combout\ & (!\B[2]~input_o\ $ (((!\sumador|FA1|U3|Z~combout\))))) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010100101010010000111000011000101010010001011000011000011100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[2]~input_o\,
	datab => \sumador|FA3|U1|ALT_INV_S~combout\,
	datac => \sumador|FA1|U2|ALT_INV_S~combout\,
	datad => \sumador|FA1|U3|ALT_INV_Z~combout\,
	datae => \sumador|FA0|U2|ALT_INV_S~combout\,
	dataf => \ALT_INV_A[2]~input_o\,
	combout => \deco|S[5]~5_combout\);

-- Location: LABCELL_X22_Y4_N24
\deco|S[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \deco|S[6]~6_combout\ = ( \sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (!\sumador|FA1|U2|S~combout\ & (!\sumador|FA3|U1|S~combout\ $ (((!\B[2]~input_o\) # (!\sumador|FA1|U3|Z~combout\))))) # (\sumador|FA1|U2|S~combout\ & (!\sumador|FA3|U1|S~combout\ 
-- & (!\B[2]~input_o\ $ (!\sumador|FA1|U3|Z~combout\)))) ) ) ) # ( !\sumador|FA0|U2|S~combout\ & ( \A[2]~input_o\ & ( (!\sumador|FA1|U2|S~combout\ & ((!\B[2]~input_o\ & (!\sumador|FA3|U1|S~combout\ & !\sumador|FA1|U3|Z~combout\)) # (\B[2]~input_o\ & 
-- (\sumador|FA3|U1|S~combout\ & \sumador|FA1|U3|Z~combout\)))) ) ) ) # ( \sumador|FA0|U2|S~combout\ & ( !\A[2]~input_o\ & ( (!\sumador|FA3|U1|S~combout\ & ((!\B[2]~input_o\ & (!\sumador|FA1|U2|S~combout\ & !\sumador|FA1|U3|Z~combout\)) # (\B[2]~input_o\ & 
-- (\sumador|FA1|U2|S~combout\ & \sumador|FA1|U3|Z~combout\)))) # (\sumador|FA3|U1|S~combout\ & (!\sumador|FA1|U2|S~combout\ $ (((!\B[2]~input_o\ & !\sumador|FA1|U3|Z~combout\))))) ) ) ) # ( !\sumador|FA0|U2|S~combout\ & ( !\A[2]~input_o\ & ( 
-- (!\sumador|FA3|U1|S~combout\ & (!\sumador|FA1|U2|S~combout\ & (!\B[2]~input_o\ $ (!\sumador|FA1|U3|Z~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000010000000100100100011010010000000000100000011010001101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[2]~input_o\,
	datab => \sumador|FA3|U1|ALT_INV_S~combout\,
	datac => \sumador|FA1|U2|ALT_INV_S~combout\,
	datad => \sumador|FA1|U3|ALT_INV_Z~combout\,
	datae => \sumador|FA0|U2|ALT_INV_S~combout\,
	dataf => \ALT_INV_A[2]~input_o\,
	combout => \deco|S[6]~6_combout\);

-- Location: LABCELL_X30_Y60_N3
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


