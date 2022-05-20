library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.InstructionSet.all;

entity ALU is
    generic(N : integer);
    port (
        clk : in std_logic;
        A : in std_logic_vector(N-1 downto 0);
        B : in std_logic_vector(N-1 downto 0);
        bit_select: in std_logic_vector(2 downto 0);
        operation: in instr_type;
        status_in : in std_logic_vector(2 downto 0);
        instr_wr : in std_logic;
        result : out std_logic_vector(N-1 downto 0);
        status_out : out std_logic_vector(2 downto 0)
        );
end ALU;

architecture rtl of ALU is
        signal resultOut : std_logic_vector(N-1 downto 0):=(others=>'0');
        signal statusOut : std_logic_vector(2 downto 0):=(others=>'0');
begin
    process(clk,instr_wr) is
    begin
            if rising_edge(clk) then
                resultOut <= (others=>'0');
                statusOut <= (others=>'0');
                if instr_wr = '0' then
                    case operation is
                        when ADDLW | ADDWF  => ADDWF(A,B,status_in, statusOut, resultOut);
                        when ANDLW | ANDWF => ANDWF(A,B,status_in, statusOut, resultOut);
                        when CLRF | CLRW => CLRF(A,B,status_in, statusOut, resultOut);
                        when COMF => COMF(A,B,status_in, statusOut, resultOut);
                        when DECF => DECF(A,B,status_in, statusOut, resultOut);
                        when INCF => INCF(A,B,status_in, statusOut, resultOut);
                        when IORLW | IORWF => IORWF(A,B,status_in, statusOut, resultOut);
                        when MOVF => MOVF(A, status_in, statusOut, resultOut);
                        when MOVWF| MOVLW => MOVWF(A,B,status_in, statusOut, resultOut);
                        when RLF => RLF(A,B,status_in, statusOut, resultOut);
                        when RRF => RRF(A,B,status_in, statusOut, resultOut);
                        when SUBLW | SUBWF => SUBWF(A,B,status_in, statusOut, resultOut);
                        when SWAPF => SWAPF(A,B,status_in, statusOut, resultOut);
                        when XORLW | XORWF => XORWF(A,B,status_in, statusOut, resultOut);
                        when BCF => BCF(A,bit_select,status_in, statusOut, resultOut);
                        when BSF => BSF(A,bit_select,status_in, statusOut, resultOut);
                        when others => NOP(A,B,status_in, statusOut, resultOut);
                    end case;

                end if;
            end if;
            result <= resultOut;
            status_out <= statusOut;
    end process;

end architecture;