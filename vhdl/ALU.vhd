library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.InstructionSet.all;

entity ALU is
    generic(N : integer);
    port (
        clk : in std_logic;
        rst : in std_logic;
        A : in std_logic_vector(N-1 downto 0);
        B : in std_logic_vector(N-1 downto 0);
        bit_select: in std_logic_vector(2 downto 0);
        instruction: in string(1 to 5);
        result : out std_logic_vector(N-1 downto 0);
        status_out : out std_logic_vector(2 downto 0);
        status_in : in std_logic_vector(2 downto 0)
        );
end ALU;

architecture rtl of ALU is
     signal operation : instr_type;

begin
    process(clk) is
    begin
        if rising_edge(clk) then
            if rst = '0' then
                string_to_insruction(instruction, operation);
                case operation is
                    when ADDLW => ADDLW(A,B,status_in, status_out, result);
                    when ANDLW => ANDLW(A,B,status_in, status_out, result);
                    when CLRF => CLRF(A,B,status_in, status_out, result);
                    when COMF => COMF(A,B,status_in, status_out, result);
                    when DECF => DECF(A,B,status_in, status_out, result);
                    when INCF => INCF(A,B,status_in, status_out, result);
                    when IORLW => IORLW(A,B,status_in, status_out, result);
                    when MOVLW => MOVLW(A,B,status_in, status_out, result);
                    when NOP => NOP(A,B,status_in, status_out, result);
                    when RLF => RLF(A,B,status_in, status_out, result);
                    when RRF => RRF(A,B,status_in, status_out, result);
                    when SUBLW => SUBLW(A,B,status_in, status_out, result);
                    when SWAPF => SWAPF(A,B,status_in, status_out, result);
                    when XORLW => XORLW(A,B,status_in, status_out, result);
                    when BCF => BCF(A,bit_select,status_in, status_out, result);
                    when BSF => BSF(A,bit_select,status_in, status_out, result);
                    when others => NOP(A,B,status_in, status_out, result);
                end case;
        end if;
    end if;
    end process;

end architecture;