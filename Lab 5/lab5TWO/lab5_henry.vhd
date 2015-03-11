LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


entity lab5_henry is
	port (
		CLOCK_50          : in  std_logic                     := 'X';             -- clk
		KEY		        	: in  std_logic_vector(1 downto 0);          -- KEY buttons
		SW						: in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
		LEDR					: out std_logic_vector(15 downto 0);                    -- export
		LEDG					: out std_logic_vector(7 downto 0);
		HEX0					: out std_logic_vector(31 downto 0)                    -- export
		);
		
end entity lab5_henry;


architecture structure of lab5_henry is

component lab5 is
        port (
            clk_clk           : in  std_logic                     := 'X';             -- clk
            reset_reset_n     : in  std_logic                     := 'X';             -- reset_n
            sliders_export    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
            green_leds_export : out std_logic_vector(7 downto 0);                     -- export
            red_leds_export   : out std_logic_vector(15 downto 0);                    -- export
            hex_export        : out std_logic_vector(31 downto 0);                    -- export
            pushbutton_export : in  std_logic                     := 'X'              -- export
        );
    end component lab5;
begin
    u0 : component lab5
        port map (
            clk_clk           => CLOCK_50,           --        clk.clk
            reset_reset_n     => KEY(1),     --      reset.reset_n
            sliders_export    => SW,    --    sliders.export
            green_leds_export => LEDG, -- green_leds.export
            red_leds_export   => LEDR,   --   red_leds.export
            hex_export        => HEX0,        --        hex.export
            pushbutton_export => KEY(0)  -- pushbutton.export
        );

	  
end structure;

