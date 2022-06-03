use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_unsigned.all;
use work.InstructionSet.all;

entity microcontroller_interface is
    generic(depth : integer := 8; --depth
            length : integer := 8); --width
    port (
        clk : in std_logic;
        rst : in std_logic;
        instr_wr : in std_logic;-- load file content: 1, reading commands from RAM:0 
        PC_tot : in std_logic_vector(depth-1 downto 0); -- accumulated number of instructions
        instruction_in : in std_logic_vector(13 downto 0); -- instruction input from text file 
        opcode_status : out ALU_state; -- it is state name for FSM, typo error here.
        statusOutSPI : out std_logic_vector(2 downto 0); -- status output
        resultOutMemSPI : out std_logic_vector(length-1 downto 0); --result output
        addrSPI : out std_logic_vector(length-1 downto 0); -- address
        Instruction : out instr_type; -- instruction after decoding from FSM
        PC_out : out std_logic_vector(depth-1 downto 0); -- monitor program counter status
        A_out: out std_logic_vector(length-1 downto 0); -- operand A from RAM
        W_out: out std_logic_vector(length-1 downto 0) --operand W from register
        );
end microcontroller_interface;

architecture struct of microcontroller_interface is
    component ALU is
      generic(length : integer);
      port(
        clk : in std_logic;
        A : in std_logic_vector(length-1 downto 0);
        B : in std_logic_vector(length-1 downto 0);
        bit_select: in std_logic_vector(2 downto 0);
        operation: in instr_type;
        status_in : in std_logic_vector(2 downto 0);
        instr_wr : in std_logic;
        result : out std_logic_vector(length-1 downto 0);
        status_out : out std_logic_vector(2 downto 0)        );
   end component;

   component RAM is
    generic (depth:integer; length:integer);
    port(
      clk : in std_logic;
      addr : in std_logic_vector(length-1 downto 0);
      PC : in std_logic_vector(depth-1 downto 0);
      PC_tot : in std_logic_vector(depth-1 downto 0);
      d_in : in std_logic_vector(length-1 downto 0);
      op_wr : in std_logic;
      instr_wr : in std_logic;
      rst : in std_logic;
      status_in: in std_logic_vector(2 downto 0);
      status_out: out std_logic_vector(2 downto 0);
      d_out : out std_logic_vector(length-1 downto 0);
      instruction_in : in std_logic_vector(13 downto 0);
      instruction_out : out std_logic_vector(13 downto 0)
         );
   end component;

   component FSM is
    generic (depth:integer; length:integer);
    port(
      clk : in std_logic;
      rst : in std_logic;
      message : in std_logic_vector(13 downto 0);
      resultIn : in std_logic_vector(length-1 downto 0);
      input_select : out std_logic; 
      bit_select :out std_logic_vector(2 downto 0);
      output_lit : out std_logic_vector(length-1 downto 0);
      resultOutMem: out std_logic_vector(length-1 downto 0);
      resultOutReg: out std_logic_vector(length-1 downto 0);
      opInstruction : out instr_type;
      addr : out std_logic_vector(length-1 downto 0);
      instr_wr : in std_logic;
      op_wr :  out std_logic;
      opcode_status : out ALU_state;
      PC_tot : in std_logic_vector(depth-1 downto 0);
      PC : out std_logic_vector(depth-1 downto 0)
         );
   end component;   

   component MUX is
    generic(length : integer);
      port(	input1:in std_logic_vector(length-1 downto 0);
		    input2:in std_logic_vector(length-1 downto 0);
		    output1:out std_logic_vector(length-1 downto 0); 
		    S:in std_logic);
   end component;      
   
    signal instruction_out : std_logic_vector(13 downto 0);
    signal output_lit : std_logic_vector(length-1 downto 0);
    signal bit_select : std_logic_vector(2 downto 0);
    signal input_select : std_logic;

    signal A : std_logic_vector(length-1 downto 0);
    signal W : std_logic_vector(length-1 downto 0);
    signal statusIn : std_logic_vector(2 downto 0);
    signal addr : std_logic_vector(length-1 downto 0);

    signal op_wr : std_logic;
    signal opInstruction : instr_type;
    signal resultALU : std_logic_vector(length-1 downto 0);
    signal resultFromMem : std_logic_vector(length-1 downto 0);
    signal resultOutReg : std_logic_vector(length-1 downto 0);
    signal PC : std_logic_vector(depth-1 downto 0);
    signal statusOut : std_logic_vector(2 downto 0);
    signal resultOutMem : std_logic_vector(length-1 downto 0);
    -- signal addrFSM : std_logic_vector(depth-1 downto 0);

    

    -- signal last_time : time := now;


    
    begin
        

    DUT : ALU
    generic map( length => length)
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


    DUT2 : RAM
    generic map( depth => depth, length => length)
    port map (
        clk => clk,
        addr => addr,
        PC => PC,
        PC_tot => PC_tot,
        d_out => resultFromMem,
        d_in => resultOutMem,
        rst => rst,
        status_in => statusOut,
        status_out => statusIn,
        op_wr => op_wr,
        instr_wr => instr_wr,
        instruction_in => instruction_in,
        instruction_out => instruction_out
    );     
    


    
    DUT3 : FSM
    generic map( depth => depth, length => length)
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
        addr => addr,
        op_wr => op_wr,
        instr_wr => instr_wr,
        opcode_status => opcode_status,
        PC => PC,
        PC_tot => PC_tot
    );  


    DUT4 : MUX
    generic map(length => length)
	port map(input1=>resultFromMem, input2=>output_lit,S=>input_select,output1=>A);

    process(clk) is
    begin
    if rising_edge(clk) then
        statusOutSPI <= statusOut;
        resultOutMemSPI <= resultALU;
        addrSPI <= addr;
        resultOutReg<=W;
        Instruction <= opInstruction;
        PC_out <= PC;
        A_out <= A;
        W_out <= W;
    -- --     report "resultALU: " & integer'image(to_integer(unsigned(resultALU)));
    end if;
    end process;




end struct;