library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use work.InstructionSet.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;

entity FSM is
    generic (depth:integer; length:integer);
    port (
        clk : in std_logic; -- clock 
        rst : in std_logic; -- reset
        message : in std_logic_vector(13 downto 0); -- message from external source 
        resultIn : in std_logic_vector(length-1 downto 0); --result from ALU or RAM
        input_select : out std_logic; -- select where to receive the result
        bit_select :out std_logic_vector(2 downto 0); -- select bit to set/reset
        output_lit : out std_logic_vector(length-1 downto 0); --output literal value
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
end FSM;
        
architecture rtl of FSM is    
    begin
    MAIN: process(clk,rst,instr_wr) is
        variable instruction_type : message_type;
        variable Instruction : instr_type;
        variable fsmPC : std_logic_vector(depth-1 downto 0);
        variable o_select : std_logic;
        variable next_state : ALU_state;

        begin
            if rst = '1' or instr_wr = '1' then
                fsmPC := (others=>'0');
                next_state := iFetch;
                opInstruction <= NOP;
                PC <= (others=>'0');
            elsif rising_edge(clk) then

            case next_state is
                when iFetch =>
                    op_wr <= '0';

                    string_to_insruction(message(13 downto 7), Instruction); --get instruction  
                    instruction_type := get_instr_type(message(13 downto 12));
                    case instruction_type is
                        when byteT =>
                            o_select := '0';
                            input_select <= '0';
                            if message(7) = '1'then
                                o_select := '1';
                                addr<='0' & message(6 DOWNTO 0);
                            else
                                o_select := '0';
                            end if;
                        	if Instruction=CLRF then
							    next_state:=Execute;
                                addr<='0' & message(6 DOWNTO 0);                                
                            elsif (Instruction=CLRW or Instruction=NOP) then
							    next_state:=Execute;
                                -- addr<='0' & message(6 DOWNTO 0);
						    else
							    next_state:=Mread;
							    addr<='0' & message(6 DOWNTO 0);
						    end if;

                        when bitT =>
                            o_select := '1';
                            input_select <= '0';
                            addr <= '0' & message(6 downto 0);
                            bit_select <= message(9 downto 7);
                            next_state := Mread;

                        when literT =>
                            o_select := '0';
                            input_select <= '1';
                            output_lit <= message(7 downto 0);
                            next_state := Mread;
                    end case;                        
                    -- next_state <= Mread;
                 
                when Mread =>
                    op_wr <= '0';
                    next_state := Execute;

                when Execute =>
                    op_wr <='0';
                    next_state := Mwrite;
                    
                when Mwrite =>
                    if  fsmPC <  PC_tot then
                        fsmPC := fsmPC + 1;   
                    else
                        fsmPC := fsmPC;                 
                    end if;
                    PC <= fsmPC;
                    if  o_select = '1' then
                        resultOutMem <= resultIn;
                        op_wr <='1';
                    else
                        resultOutReg <= resultIn;
                        op_wr <='0';
                    end if;
                    next_state := iFetch;
                end case;
            opcode_status <= next_state;
            opInstruction <= Instruction;
        end if;

end process;
end architecture;