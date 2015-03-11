LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

component henry_test is
	port (
		clk_clk             : in  std_logic                     := 'X';             -- clk
		reset_reset_n       : in  std_logic                     := 'X';             -- reset_n
		switches_export     : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
		red_leds_export     : out std_logic_vector(15 downto 0);                    -- export
		hex_displays_export : out std_logic_vector(31 downto 0);                    -- export
		push_button_export  : in  std_logic                     := 'X'              -- export
		);
end component henry_test;

component henry_test is
	port map (
		clk_clk             => clk_clk,             --          clk.clk
		reset_reset_n       => KEY[0],       --        reset.reset_n
		switches_export     => SW,     --     switches.export
		red_leds_export     => LEDR,     --     red_leds.export
		hex_displays_export => HEX, -- hex_displays.export
		push_button_export  => KEY[1]   --  push_button.export
	);