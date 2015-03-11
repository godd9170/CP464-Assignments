--IP Functional Simulation Model
--VERSION_BEGIN 13.0 cbx_mgl 2013:06:12:18:04:42:SJ cbx_simgen 2013:06:12:18:03:40:SJ  VERSION_END


-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- You may only use these simulation model output files for simulation
-- purposes and expressly not for synthesis or any other purposes (in which
-- event Altera disclaims all warranties of any kind).


--synopsys translate_off

--synthesis_resources = mux21 33 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  lab5_addr_router_001 IS 
	 PORT 
	 ( 
		 clk	:	IN  STD_LOGIC;
		 reset	:	IN  STD_LOGIC;
		 sink_data	:	IN  STD_LOGIC_VECTOR (87 DOWNTO 0);
		 sink_endofpacket	:	IN  STD_LOGIC;
		 sink_ready	:	OUT  STD_LOGIC;
		 sink_startofpacket	:	IN  STD_LOGIC;
		 sink_valid	:	IN  STD_LOGIC;
		 src_channel	:	OUT  STD_LOGIC_VECTOR (6 DOWNTO 0);
		 src_data	:	OUT  STD_LOGIC_VECTOR (87 DOWNTO 0);
		 src_endofpacket	:	OUT  STD_LOGIC;
		 src_ready	:	IN  STD_LOGIC;
		 src_startofpacket	:	OUT  STD_LOGIC;
		 src_valid	:	OUT  STD_LOGIC
	 ); 
 END lab5_addr_router_001;

 ARCHITECTURE RTL OF lab5_addr_router_001 IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_30m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_31m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_36m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_41m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_42m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_47m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_48m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_52m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_53m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_58m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_59m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_60m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_63m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_64m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_69m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_70m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_71m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_72m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_74m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_channel_75m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_34m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_43m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_44m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_45m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_54m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_55m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_56m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_65m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_66m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_67m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_76m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_77m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_lab5_addr_router_001_src_data_78m_dataout	:	STD_LOGIC;
	 SIGNAL  wire_w_lg_w_sink_data_range123w291w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range144w269w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w2w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range126w274w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range147w268w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  s_wire_lab5_addr_router_001_src_channel_0_297_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_lab5_addr_router_001_src_channel_1_313_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_lab5_addr_router_001_src_channel_2_329_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_lab5_addr_router_001_src_channel_3_345_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_lab5_addr_router_001_src_channel_4_361_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_lab5_addr_router_001_src_channel_5_377_dataout :	STD_LOGIC;
	 SIGNAL  wire_w_sink_data_range123w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sink_data_range126w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sink_data_range144w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sink_data_range147w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
 BEGIN

	wire_w_lg_w_sink_data_range123w291w(0) <= wire_w_sink_data_range123w(0) AND wire_w_lg_w_sink_data_range126w274w(0);
	wire_w_lg_w_sink_data_range144w269w(0) <= wire_w_sink_data_range144w(0) AND wire_w_lg_w_sink_data_range147w268w(0);
	wire_w1w(0) <= NOT s_wire_lab5_addr_router_001_src_channel_0_297_dataout;
	wire_w2w(0) <= NOT s_wire_lab5_addr_router_001_src_channel_1_313_dataout;
	wire_w_lg_w_sink_data_range126w274w(0) <= NOT wire_w_sink_data_range126w(0);
	wire_w_lg_w_sink_data_range147w268w(0) <= NOT wire_w_sink_data_range147w(0);
	s_wire_lab5_addr_router_001_src_channel_0_297_dataout <= ((wire_w_lg_w_sink_data_range144w269w(0) AND (NOT sink_data(49))) AND sink_data(50));
	s_wire_lab5_addr_router_001_src_channel_1_313_dataout <= (((((((((((NOT sink_data(40)) AND wire_w_lg_w_sink_data_range126w274w(0)) AND (NOT sink_data(42))) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND sink_data(50));
	s_wire_lab5_addr_router_001_src_channel_2_329_dataout <= (((((((((wire_w_lg_w_sink_data_range123w291w(0) AND (NOT sink_data(42))) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND sink_data(50));
	s_wire_lab5_addr_router_001_src_channel_3_345_dataout <= (((((((((((NOT sink_data(40)) AND sink_data(41)) AND (NOT sink_data(42))) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND sink_data(50));
	s_wire_lab5_addr_router_001_src_channel_4_361_dataout <= ((((((((((sink_data(40) AND sink_data(41)) AND (NOT sink_data(42))) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND sink_data(50));
	s_wire_lab5_addr_router_001_src_channel_5_377_dataout <= (((((((((((NOT sink_data(40)) AND wire_w_lg_w_sink_data_range126w274w(0)) AND sink_data(42)) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND sink_data(50));
	sink_ready <= src_ready;
	src_channel <= ( wire_lab5_addr_router_001_src_channel_69m_dataout & wire_lab5_addr_router_001_src_channel_70m_dataout & wire_lab5_addr_router_001_src_channel_71m_dataout & wire_lab5_addr_router_001_src_channel_72m_dataout & s_wire_lab5_addr_router_001_src_channel_5_377_dataout & wire_lab5_addr_router_001_src_channel_74m_dataout & wire_lab5_addr_router_001_src_channel_75m_dataout);
	src_data <= ( sink_data(87 DOWNTO 78) & wire_lab5_addr_router_001_src_data_76m_dataout & wire_lab5_addr_router_001_src_data_77m_dataout & wire_lab5_addr_router_001_src_data_78m_dataout & sink_data(74 DOWNTO 0));
	src_endofpacket <= sink_endofpacket;
	src_startofpacket <= sink_startofpacket;
	src_valid <= sink_valid;
	wire_w_sink_data_range123w(0) <= sink_data(40);
	wire_w_sink_data_range126w(0) <= sink_data(41);
	wire_w_sink_data_range144w(0) <= sink_data(47);
	wire_w_sink_data_range147w(0) <= sink_data(48);
	wire_lab5_addr_router_001_src_channel_30m_dataout <= wire_w1w(0) AND NOT(s_wire_lab5_addr_router_001_src_channel_1_313_dataout);
	wire_lab5_addr_router_001_src_channel_31m_dataout <= s_wire_lab5_addr_router_001_src_channel_0_297_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_1_313_dataout);
	wire_lab5_addr_router_001_src_channel_36m_dataout <= s_wire_lab5_addr_router_001_src_channel_1_313_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_2_329_dataout);
	wire_lab5_addr_router_001_src_channel_41m_dataout <= wire_lab5_addr_router_001_src_channel_30m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_2_329_dataout);
	wire_lab5_addr_router_001_src_channel_42m_dataout <= wire_lab5_addr_router_001_src_channel_31m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_2_329_dataout);
	wire_lab5_addr_router_001_src_channel_47m_dataout <= wire_lab5_addr_router_001_src_channel_36m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_3_345_dataout);
	wire_lab5_addr_router_001_src_channel_48m_dataout <= s_wire_lab5_addr_router_001_src_channel_2_329_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_3_345_dataout);
	wire_lab5_addr_router_001_src_channel_52m_dataout <= wire_lab5_addr_router_001_src_channel_41m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_3_345_dataout);
	wire_lab5_addr_router_001_src_channel_53m_dataout <= wire_lab5_addr_router_001_src_channel_42m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_3_345_dataout);
	wire_lab5_addr_router_001_src_channel_58m_dataout <= wire_lab5_addr_router_001_src_channel_47m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_4_361_dataout);
	wire_lab5_addr_router_001_src_channel_59m_dataout <= wire_lab5_addr_router_001_src_channel_48m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_4_361_dataout);
	wire_lab5_addr_router_001_src_channel_60m_dataout <= s_wire_lab5_addr_router_001_src_channel_3_345_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_4_361_dataout);
	wire_lab5_addr_router_001_src_channel_63m_dataout <= wire_lab5_addr_router_001_src_channel_52m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_4_361_dataout);
	wire_lab5_addr_router_001_src_channel_64m_dataout <= wire_lab5_addr_router_001_src_channel_53m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_4_361_dataout);
	wire_lab5_addr_router_001_src_channel_69m_dataout <= wire_lab5_addr_router_001_src_channel_58m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_5_377_dataout);
	wire_lab5_addr_router_001_src_channel_70m_dataout <= wire_lab5_addr_router_001_src_channel_59m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_5_377_dataout);
	wire_lab5_addr_router_001_src_channel_71m_dataout <= wire_lab5_addr_router_001_src_channel_60m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_5_377_dataout);
	wire_lab5_addr_router_001_src_channel_72m_dataout <= s_wire_lab5_addr_router_001_src_channel_4_361_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_5_377_dataout);
	wire_lab5_addr_router_001_src_channel_74m_dataout <= wire_lab5_addr_router_001_src_channel_63m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_5_377_dataout);
	wire_lab5_addr_router_001_src_channel_75m_dataout <= wire_lab5_addr_router_001_src_channel_64m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_5_377_dataout);
	wire_lab5_addr_router_001_src_data_34m_dataout <= wire_w1w(0) AND NOT(s_wire_lab5_addr_router_001_src_channel_1_313_dataout);
	wire_lab5_addr_router_001_src_data_43m_dataout <= s_wire_lab5_addr_router_001_src_channel_1_313_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_2_329_dataout);
	wire_lab5_addr_router_001_src_data_44m_dataout <= wire_w2w(0) AND NOT(s_wire_lab5_addr_router_001_src_channel_2_329_dataout);
	wire_lab5_addr_router_001_src_data_45m_dataout <= wire_lab5_addr_router_001_src_data_34m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_2_329_dataout);
	wire_lab5_addr_router_001_src_data_54m_dataout <= wire_lab5_addr_router_001_src_data_43m_dataout OR s_wire_lab5_addr_router_001_src_channel_3_345_dataout;
	wire_lab5_addr_router_001_src_data_55m_dataout <= wire_lab5_addr_router_001_src_data_44m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_3_345_dataout);
	wire_lab5_addr_router_001_src_data_56m_dataout <= wire_lab5_addr_router_001_src_data_45m_dataout OR s_wire_lab5_addr_router_001_src_channel_3_345_dataout;
	wire_lab5_addr_router_001_src_data_65m_dataout <= wire_lab5_addr_router_001_src_data_54m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_4_361_dataout);
	wire_lab5_addr_router_001_src_data_66m_dataout <= wire_lab5_addr_router_001_src_data_55m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_4_361_dataout);
	wire_lab5_addr_router_001_src_data_67m_dataout <= wire_lab5_addr_router_001_src_data_56m_dataout OR s_wire_lab5_addr_router_001_src_channel_4_361_dataout;
	wire_lab5_addr_router_001_src_data_76m_dataout <= wire_lab5_addr_router_001_src_data_65m_dataout OR s_wire_lab5_addr_router_001_src_channel_5_377_dataout;
	wire_lab5_addr_router_001_src_data_77m_dataout <= wire_lab5_addr_router_001_src_data_66m_dataout OR s_wire_lab5_addr_router_001_src_channel_5_377_dataout;
	wire_lab5_addr_router_001_src_data_78m_dataout <= wire_lab5_addr_router_001_src_data_67m_dataout AND NOT(s_wire_lab5_addr_router_001_src_channel_5_377_dataout);

 END RTL; --lab5_addr_router_001
--synopsys translate_on
--VALID FILE
