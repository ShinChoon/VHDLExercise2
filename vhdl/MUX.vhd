library ieee;
use ieee.std_logic_1164.all;
entity MUX is
	port( input1:in std_logic_vector(7 downto 0);
		input2:in std_logic_vector(7 downto 0);
		output1:out std_logic_vector(7 downto 0); 
		S:in std_logic);
end entity MUX;

architecture rtl of MUX is
	signal muxOutput  : std_logic_vector(7 downto 0):= (others=>'0');
	
begin
	process(S,input1, input2) is
		begin	
			if S = '1' then
				muxOutput<=input2;
			else 
				muxOutput<=input1;
			end if;
	end process;

	process(muxOutput) is
		begin
			output1 <= muxOutput;
	end process;
end architecture;
