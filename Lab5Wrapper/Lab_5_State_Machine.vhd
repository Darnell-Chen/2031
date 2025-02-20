-- Quartus Prime VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity Lab_5_State_Machine is

	port(
		xmas	 : in	std_logic;
		cool	 : in	std_logic;
		clk		 : in	std_logic;
		resetn	 : in	std_logic;
		r_en		: out std_logic;
		g_en		: out std_logic;
		b_en		: out std_logic
	);

end entity;

architecture rtl of Lab_5_State_Machine is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2);

	-- Register to hold the current state
	signal state   : state_type;

begin

	-- Logic to advance to the next state
	process (clk, resetn)
	begin
		if resetn = '0' then
			state <= s0;
		elsif (rising_edge(clk)) then
			case state is
				when s0=>
					state <= s1;
				when s1=>
					if xmas = '1' and cool = '0' then
						state <= s0;
					else
						state <= s2;
					end if;
				when s2=>
					if cool = '1' then
						state <= s2;
					else
						state <= s0;
					end if;
			end case;
		end if;
	end process;
	
	r_en <= '1' when state = s0 else '0';
	g_en <= '1' when state = s1 else '0';
	b_en <= '1' when state = s2 else '0';


end rtl;
