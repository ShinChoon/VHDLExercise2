use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_unsigned.all;
use work.InstructionSet.all;

entity ALU_tb is
end ALU_tb;

architecture sim of ALU_tb is
    constant RUNNING_time : time := 20000 ns;
    constant clk_hz : integer := 10000000;
    constant clk_period : time := 1 sec / clk_hz;
    constant N : integer := 8;
    constant depth : integer := 8;
    constant length : integer := 8;
    signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal instr_wr : std_logic := '0';
    signal PC_tot : std_logic_vector(depth-1 downto 0) := (others=>'0');
    signal PC_out : std_logic_vector(depth-1 downto 0) := (others=>'0');
    signal instruction_in : std_logic_vector(13 downto 0) := (others=>'0');
    signal opcode_status : ALU_state := iFetch;
    signal statusOut : std_logic_vector(2 downto 0):=(others=>'0');
    signal resultOutMem : std_logic_vector(length-1 downto 0):= (others=>'0');
    signal addr : std_logic_vector(length-1 downto 0):=(0 => '1', others=>'0');
    signal addrSPI : std_logic_vector(length-1 downto 0):=(0 => '1', others=>'0');
    signal last_time : time := now;
    signal opInstruction : instr_type := NOP;
    signal A : std_logic_vector(length-1 downto 0):= (others=>'0');
    signal W : std_logic_vector(length-1 downto 0):= (others=>'0');
    begin
        

    
    DUT3 : entity work.microcontroller_interface(struct)
    generic map( depth => depth, length => length)
    port map (
        clk => clk,
        rst => rst,
        instr_wr => instr_wr,
        PC_tot => PC_tot,
        instruction_in => instruction_in,
        opcode_status => opcode_status,
        statusOutSPI => statusOut,
        resultOutMemSPI => resultOutMem,
        addrSPI => addrSPI,
        Instruction => opInstruction,
        PC_out => PC_out,
        A_out => A,
        W_out => W
    );  

clk_finite : process is 
begin
    if (now - last_time < RUNNING_time/200 ) then
        rst <= '1';
        clk <= not clk;
        wait for clk_period/2; 
    elsif (now - last_time < RUNNING_time ) then
        rst <= '0';
        clk <= not clk;
        wait for clk_period/2;  
    else
        wait;
    end if;
end process clk_finite;

 Reading_text : process(clk,opcode_status) is
     file stimulus_file : text open read_mode is "input.csv";
     file out_file : text open write_mode is "output.csv";
     variable TEXT_LINE : line;
     variable TEXT_LINE2 : line;
     variable COM:character := ',';

     variable STATUS : std_logic_vector(2 downto 0);
     variable StringMessage : std_logic_vector(13 downto 0);


     begin 
    if rising_edge(clk) then 
        if not endfile(stimulus_file) then
                    instr_wr <= '1'; 
                    readline(stimulus_file,TEXT_LINE);
                    read(TEXT_LINE, StringMessage);
                    instruction_in <= StringMessage;
                    PC_tot <= PC_tot + 1;
        else
            instr_wr <= '0';
            addr <= addrSPI;
        end if;
    end if;

    if opcode_status'event and (opcode_status = iFetch) then
        write(TEXT_LINE2, to_integer(unsigned(addr)));
        write(TEXT_LINE2,COM); 
        write(TEXT_LINE2,to_integer(unsigned(resultOutMem)));
        write(TEXT_LINE2,COM);             
        STATUS := statusOut;
        write(TEXT_LINE2,STATUS);
        writeline(out_file,TEXT_LINE2);
    end if;

 end process Reading_text;

end architecture;