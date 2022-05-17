library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use work.InstructionSet.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;

entity FSM is
    port (
        clk : in std_logic;
        rst : in std_logic;
        message : in std_logic_vector(13 downto 0);
        resultIn : in std_logic_vector(length-1 downto 0);
        input_select : out std_logic := '1'; 
        bit_select :out std_logic_vector(2 downto 0);
        output_lit : out std_logic_vector(7 downto 0);
        resultOutMem: out std_logic_vector(length-1 downto 0);
        resultOutReg: out std_logic_vector(length-1 downto 0);
        opInstruction : out instr_type;
        addr : out std_logic_vector(depth-1 downto 0);
        instr_wr : in std_logic;
        op_wr :  out std_logic;

        opcode_status : out ALU_state;
        PC_tot : in integer;
        PC : out integer
        );
end FSM;
        
architecture rtl of FSM is
    signal next_state : ALU_state := iFetch;
    signal current_state : ALU_state := iFetch;
    signal Instruction : instr_type := NOP;
    signal fsmPC : integer := 0;
    signal interResult1 : std_logic_vector(length-1 downto 0):=(others=>'0');
    signal interResult2 : std_logic_vector(length-1 downto 0):=(others=>'0');
    -- signal inter_lit : std_logic_vector(7 downto 0):=(others=>'0');
    signal o_select : std_logic := '0';
    signal in_select : std_logic := '0';
    signal b_select : std_logic_vector(2 downto 0):=(others=>'0');
    signal wr : std_logic := '0';
    signal addrIn : std_logic_vector(depth-1 downto 0):=(others=>'0');

begin



MAIN: process(current_state) is
        variable instruction_type : message_type := byteT;
        begin
                case current_state is
                when iFetch =>
                    op_wr <= '0';
                    -- instr_wr <= '0';
                    instruction_type := get_instr_type(message(13 downto 12));
                    string_to_insruction(message(13 downto 7), Instruction); --get instruction
                    case instruction_type is
                        when byteT =>
                            o_select <= '0';
                            in_select <= '0';
                            addrIn <= '0' & message(6 downto 0);
                        when bitT =>
                            o_select <= '1';
                            in_select <= '0';
                            addrIn <= '0' & message(6 downto 0);
                        when literT =>
                            o_select <= '0';
                            in_select <= '1';
                            -- inter_lit <= message(7 downto 0);
                    end case;
                    -- report "@@@@@o_select@@@@@@@: " & std_logic'image(o_select);
                    addrIn <= '0' & message(6 downto 0);
                    b_select <= message(9 downto 7);

                    next_state <= Mread;

                when Mread =>
                    op_wr <= '0';
                    -- instr_wr <= '0';
                    next_state <= Execute;

                when Execute =>
                    --jsut for delay
                    next_state <= Mwrite;
                
                when Mwrite =>
                    op_wr <='1';
                    -- instr_wr <= '0';
                    if  o_select = '1' then
                        interResult1 <= resultIn;
                    else
                        interResult2 <= resultIn;
                    end if;
                    if fsmPC < PC_tot then
                        fsmPC <= fsmPC + 1;
                    end if;
                    next_state <= iFetch;
                end case;
end process;

STATE_CHANGE: process(clk,rst, instr_wr) is
    begin
        if rst = '1' or instr_wr = '1' then
            current_state <= iFetch;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
        
        opcode_status <= current_state;
        resultOutMem <= interResult1;
        resultOutReg <= interResult2;
        output_lit <= message(7 downto 0);
        bit_select <= b_select;
        input_select <= in_select;
        -- op_wr <= wr;
        addr <= addrIn;
        opInstruction <= Instruction;
        PC <= fsmPC;
        -- report "fsmPC: " & integer'image(fsmPC);



end process;
end architecture;