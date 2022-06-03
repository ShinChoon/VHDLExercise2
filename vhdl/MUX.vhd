library ieee;
use ieee.std_logic_1164.all;
entity MUX is
	generic (length:integer);
	port(   
		input1:in std_logic_vector(length-1 downto 0);
		input2:in std_logic_vector(length-1 downto 0);
		output1:out std_logic_vector(length-1 downto 0); 
		S:in std_logic	
		);
end entity MUX;

architecture rtl of MUX is
	
begin
	process(S,input1, input2) is
		begin	
			if S = '0' then
				output1<=input1;
			else 
				output1<=input2;
				-- report "output: ";
			end if;
	end process;

end architecture;
