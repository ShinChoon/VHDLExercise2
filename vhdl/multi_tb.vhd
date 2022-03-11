use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

entity multi_tb is
end multi_tb;

architecture sim of multi_tb is
    constant size:integer := 8;
    constant clk_hz : integer := 10000000;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : bit := '1';
    signal rst : bit := '0';
    signal A : bit_vector(7 downto 0) :=x"AA";
    signal B : bit_vector(7 downto 0) :=x"BB";
    signal Q : bit_vector(7 downto 0);
    signal S : bit := '0';
    
    begin

    
    DUT : entity work.multiplexer(rtl)
    port map (
        clk => clk,
        rst => rst,
        A => A,
        B => B,
        Q => Q,
        S => S
        );
        
    
        Reading_text : process is
            file stimulus_file : text open read_mode is "input.txt";
    file out_file : text open write_mode is "output.txt";
    variable text_line : line;
    variable ok : boolean;
    variable data : bit_vector(7 downto 0);
    variable selector : bit;
    variable int: integer;
    variable com:character;
    variable wait_time : time;
    
    begin 
        rst <= '0'; -- initialization
    while not endfile(stimulus_file) loop
            clk <= '0';
    		readline(stimulus_file,text_line);
            read(text_line, int);
            wait_time := int*1 ns;
            read(text_line, com);
    		read(text_line,selector);
            S <= selector;
            read(text_line, com);
            read(text_line, data);
    		A<=data;
    		read(text_line,com);
    	    read(text_line,data);	
    		B<=data;
    		wait for wait_time;
            write(text_line,Q);
		    writeline(out_file,text_line);
            clk <= '1';
            wait for wait_time;
    end loop;

    wait;

end process;

end architecture;