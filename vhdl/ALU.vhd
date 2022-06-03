library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.InstructionSet.all;

entity ALU is
    generic(length : integer);
    port (
        clk : in std_logic;
        A : in std_logic_vector(length-1 downto 0);
        B : in std_logic_vector(length-1 downto 0);
        bit_select: in std_logic_vector(2 downto 0);
        operation: in instr_type;
        status_in : in std_logic_vector(2 downto 0);
        instr_wr : in std_logic;
        result : out std_logic_vector(length-1 downto 0);
        status_out : out std_logic_vector(2 downto 0)
        );
end ALU;

architecture rtl of ALU is
begin
    process(clk) is
    begin
        if rising_edge(clk) then
            if instr_wr = '1' then
            result <= (others=>'0');
            status_out <= (others=>'0');
            else
                case operation is
                when ADDLW | ADDWF  => ADDWF(A,B,status_in, status_out, result);
                when ANDLW | ANDWF => ANDWF(A,B,status_in, status_out, result);
                when CLRF | CLRW => CLRF(A,B,status_in, status_out, result);
                when COMF => COMF(A,B,status_in, status_out, result);
                when DECF => DECF(A,B,status_in, status_out, result);
                when INCF => INCF(A,B,status_in, status_out, result);
                when IORLW | IORWF => IORWF(A,B,status_in, status_out, result);
                when MOVF => MOVF(A, status_in, status_out, result);
                when MOVWF => MOVWF(A,B,status_in, status_out, result);
                when MOVLW => MOVLW(A,B,status_in, status_out, result);
                when RLF => RLF(A,B,status_in, status_out, result);
                when RRF => RRF(A,B,status_in, status_out, result);
                when SUBLW | SUBWF => SUBWF(A,B,status_in, status_out, result);
                when SWAPF => SWAPF(A,B,status_in, status_out, result);
                when XORLW | XORWF => XORWF(A,B,status_in, status_out, result);
                when BCF => BCF(A,bit_select,status_in, status_out, result);
                when BSF => BSF(A,bit_select,status_in, status_out, result);
                when others => NOP(A,B,status_in, status_out, result);
                end case;
            end if;
        end if;
        -- result <= resultOut;
        -- status_out <= statusOut;
    end process;

end architecture;