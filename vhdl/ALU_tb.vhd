use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

entity ALU_tb is
end ALU_tb;

architecture sim of ALU_tb is
    constant RUNNING_time : time := 100000 ns;
    constant clk_hz : integer := 10000000;
    constant clk_period : time := 1 sec / clk_hz;
    constant N : integer := 8; --N bit

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';
    signal instruction : string(1 to 5);
    signal A : std_logic_vector(N-1 downto 0) :=x"0A";
    signal B : std_logic_vector(N-1 downto 0) :=x"0B";
    signal bit_select : std_logic_vector(2 downto 0) := "000";
    signal status_in : std_logic_vector(2 downto 0):=(others=>'0');
    signal status_out : std_logic_vector(2 downto 0);
    signal result : std_logic_vector(N-1 downto 0);


    signal  last_time : time := now;

    
    begin
        
    DUT : entity work.ALU(rtl)
    generic map( N => N)
    port map (
    clk => clk,
    rst => rst,
    A => A,
    B => B,
    instruction => instruction,
    bit_select => bit_select,
    status_in => status_in,
    status_out => status_out,
    result => result
    );
                    


clk_finite : process is 
begin
    if (now - last_time < RUNNING_time ) then
        clk <= not clk;
        wait for clk_period/2;  
    else
        wait;
    end if;
end process clk_finite;

 Reading_text : process is
     file stimulus_file : text open read_mode is "input.csv";
     file out_file : text open write_mode is "output.csv";
     variable text_line : line;
     variable data : integer;
     variable inst : string(1 to 5);
     variable int: integer;
     variable com:character;

     variable status : std_logic_vector(2 downto 0);

     begin 
     while not endfile(stimulus_file) loop
                rst <= '0';
     		    readline(stimulus_file,text_line);
                read(text_line,inst);	
                instruction<=inst;

                read(text_line, com);
                read(text_line, data);
     		    A<=std_logic_vector(to_unsigned(data, A'length));


     		    read(text_line,com);
     	        read(text_line,data);	
     		    B<=std_logic_vector(to_unsigned(data, B'length));

                 
     		    read(text_line,com);
     	        read(text_line,data);	
     		    bit_select<=std_logic_vector(to_unsigned(data, bit_select'length));
                 
                wait for clk_period*10;
                write(text_line,inst);
                write(text_line,com);             
                int := to_integer(unsigned(result));
                write(text_line,int);
                write(text_line,com);
                status := status_out;
                write(text_line,status);
                writeline(out_file,text_line);
     end loop;
     wait;
 end process Reading_text;

end architecture;