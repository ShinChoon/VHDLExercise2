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
    signal clk : std_logic := '1';
    signal rst : std_logic := '0';
    signal message : std_logic_vector(13 downto 0) := (others=>'0');
    signal instruction_in : std_logic_vector(13 downto 0) := (others=>'0');
    signal instruction_out : std_logic_vector(13 downto 0) := (others=>'0');
    signal output_lit : std_logic_vector(length-1 downto 0):=(others=>'0');
    signal bit_select : std_logic_vector(2 downto 0) := (others=> '0');
    signal input_select : std_logic := '0';

    signal A : std_logic_vector(N-1 downto 0) :=(others=>'0');
    signal B : std_logic_vector(N-1 downto 0) :=(0 => '1', others=>'0');
    signal W : std_logic_vector(N-1 downto 0) :=(others=>'0');
    signal statusIn : std_logic_vector(2 downto 0):=(others=>'0');
    signal statusOut : std_logic_vector(2 downto 0):=(others=>'0');

    signal instr_wr : std_logic := '0';
    signal addr : std_logic_vector(depth-1 downto 0):=(0 => '1', others=>'0');

    signal addrRAM : std_logic_vector(depth-1 downto 0):=(0 => '1', others=>'0');
    signal addrFSM : std_logic_vector(depth-1 downto 0):=(0 => '1', others=>'0');
    signal op_wr_RAM : std_logic := '0';
    signal op_wr_FSM : std_logic := '0';



    signal opcode_status : ALU_state := iFetch;
    signal opInstruction : instr_type := NOP;
    signal resultALU : std_logic_vector(length-1 downto 0):= (others=>'0');
    signal resultFromMem : std_logic_vector(length-1 downto 0):= (others=>'0');
    signal resultOutReg : std_logic_vector(length-1 downto 0):= (others=>'0');
    signal resultOutMem : std_logic_vector(length-1 downto 0):= (others=>'0');
    signal PC : integer := 0;
    signal PC_tot_FSM : integer := 0;
    signal PC_tot_RAM : integer := 0;
    signal last_time : time := now;


    
    begin
        

    DUT : entity work.ALU(rtl)
    generic map( N => N)
    port map (
        clk => clk,
        A => A,
        B => resultOutReg,
        operation => opInstruction,
        bit_select => bit_select,
        status_in => statusIn,
        instr_wr => instr_wr,
        status_out => statusOut,
        result => resultALU
    );


    DUT2 : entity work.RAM(rtl)
    generic map( depth => depth, length => length)
    port map (
        clk => clk,
        addr => addr,
        PC => PC,
        PC_tot => PC_tot_RAM,
        d_out => resultFromMem,
        d_in => resultOutMem,
        rst => rst,
        status_in => statusOut,
        status_out => statusIn,
        op_wr => op_wr_RAM,
        instr_wr => instr_wr,
        instruction_in => instruction_in,
        instruction_out => instruction_out
    );     
    


    
    DUT3 : entity work.FSM(rtl)
    port map (
        clk => clk,
        rst => rst,
        resultIn => resultALU,
        message => instruction_out,
        input_select => input_select,
        bit_select => bit_select,
        output_lit => output_lit,
        opInstruction => opInstruction,
        resultOutMem => resultOutMem,
        resultOutReg => W,
        addr => addrFSM,
        op_wr => op_wr_FSM,
        instr_wr => instr_wr,
        opcode_status => opcode_status,
        PC => PC,
        PC_tot => PC_tot_FSM
    );  


    MUX :entity work.MUX(rtl)
	port map(input1=>resultFromMem, input2=>output_lit,S=>input_select,output1=>A);


clk_finite : process is 
begin
    if (now - last_time < RUNNING_time ) then
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
     variable DATA : integer;
     variable INST : string(1 to 5);
     variable COM:character := ',';
     variable VADDR : std_logic_vector(depth-1 downto 0);

     variable STATUS : std_logic_vector(2 downto 0);
     variable StringMessage : std_logic_vector(13 downto 0);


     begin 
if rising_edge(clk) then 
    if not endfile(stimulus_file) then
                instr_wr <= '1'; 
                readline(stimulus_file,TEXT_LINE);
                read(TEXT_LINE, StringMessage);
                instruction_in <= StringMessage;
                PC_tot_RAM <= PC_tot_RAM + 1;
    else
        instr_wr <= '0';
        PC_tot_FSM <= PC_tot_RAM;
        addr <= addrFSM;
        op_wr_RAM <= op_wr_FSM;
        if opcode_status'event and (opcode_status = Mwrite) then
            write(TEXT_LINE2, to_integer(unsigned(addr)));
            write(TEXT_LINE2,COM); 
            write(TEXT_LINE2,to_integer(unsigned(resultOutMem)));
            write(TEXT_LINE2,COM);             
            STATUS := statusOut;
            write(TEXT_LINE2,STATUS);
            writeline(out_file,TEXT_LINE2);
        end if;
    end if;
end if;

 end process Reading_text;


reg:process(clk,instr_wr)is
	begin
if rising_edge(clk) then 
		if instr_wr='1'then
			resultOutReg<=(others=>'0');
		elsif rising_edge(clk) then
			resultOutReg<=W;
		end if;
end if;
	end process reg;


end architecture;