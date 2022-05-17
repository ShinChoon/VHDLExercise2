library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
package InstructionSet is

    constant clk_hz : integer := 10000000;
    constant clk_period : time := 1 sec / clk_hz;
    constant N : integer := 8; --N bit
    constant depth : integer := 8; --depth
    constant length : integer := 8; --width
    type reading_state is (ReadOperand, ReadInstr);
    type writing_state is (Running, WriteResult);
    type instr_type is (ADDWF, ANDWF, CLRF, CLRW, COMF, DECF, INCF, IORWF, MOVF, MOVWF, NOP, RLF, RRF, SUBWF, SWAPF, XORWF, 
                       BCF, BSF, 
                       ADDLW, ANDLW, IORLW, MOVLW, SUBLW, XORLW);
    
    type message_type is (byteT, bitT, literT);
    type ALU_state is (iFetch, Mread, Execute, Mwrite);
    function generate_status(result: in std_logic_vector(8 downto 0)) 
    return std_logic_vector;

    function get_instr_type(message: in std_logic_vector(1 downto 0))
    return message_type;

    procedure string_to_insruction(signal str_read: in std_logic_vector(6 downto 0);
                                   signal instruction : out instr_type);

    procedure ADDWF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure ANDWF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure BCF(signal f: in std_logic_vector(7 downto 0);
                    signal b: in std_logic_vector(2 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));
    procedure BSF(signal f: in std_logic_vector(7 downto 0);
                    signal b: in std_logic_vector(2 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure COMF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure DECF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure INCF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure CLRF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));


    procedure IORWF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));


    
    procedure MOVF(signal W : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure MOVWF(signal W,f : in std_logic_vector(7 downto 0);
                signal status_in : in std_logic_vector(2 downto 0);
                signal status_out : out std_logic_vector(2 downto 0);
                signal result :  out std_logic_vector(7 downto 0));


    procedure RLF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure RRF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));


    procedure SUBWF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));


    procedure SWAPF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure XORWF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));
    

    procedure NOP(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));


end package InstructionSet;



package body InstructionSet is


    function generate_status(result: in std_logic_vector(8 downto 0)) return std_logic_vector is
        variable status : std_logic_vector(2 downto 0);
        begin
        status := "000";
        if result = "000000000" then
            status(2) := '1';
        else
            status(2) := '0';
        end if;

        if result(4) = '1' then
            status(1) := '1';
        else
            status(1) := '0';
        end if;
            
        if result(8) = '1' then
            status(0) := '1';
        else
            status(0) := '0';  
        end if; 

        -- status(1) := '1' when result(4) = '1' else '0';
        -- status(0) := '1' when result(8) = '1' else '0';
        return status;
    end function generate_status;

    function get_instr_type(message: in std_logic_vector(1 downto 0)) return message_type is
        begin
            case message is
                when "00"  => return byteT;
                when "01"  => return bitT; 
                when "11"  => return literT; 
                when others => return literT;
            end case;
    end function get_instr_type;

    procedure string_to_insruction(signal str_read: in std_logic_vector(6 downto 0);
                                   signal instruction : out instr_type) is
        begin
            case str_read is 
                when "0001110" => instruction <= ADDWF;
                when "0001111" => instruction <= ADDWF;
			    when "0001010" => instruction <= ANDWF;
                when "0001011" => instruction <= ANDWF;
			    when "0000011" => instruction <= CLRF;
			    when "0000010" => instruction <= CLRW;
			    when "0010010" => instruction <= COMF;
                when "0010011" => instruction <= COMF;
			    when "0000110" => instruction <= DECF;
                when "0000111" => instruction <= DECF;
			    when "0010100" => instruction <= INCF;
                when "0010101" => instruction <= INCF;
			    when "0010000" => instruction <= MOVF;
                when "0010001" => instruction <= MOVF;
			    when "0000001" => instruction <= MOVWF;
			    when "0000000" => instruction <= NOP;
			    when "0011010" => instruction <= RLF;
                when "0011011" => instruction <= RLF;
			    when "0011000" => instruction <= RRF;
                when "0011001" => instruction <= RRF;
			    when "0000100" => instruction <= SUBWF;
                when "0000101" => instruction <= SUBWF;
			    when "0011100" => instruction <= SWAPF;
                when "0011101" => instruction <= SWAPF;
			    when "0001100" => instruction <= XORWF;
                when "0001101" => instruction <= XORWF;

			    when "0100000" => instruction <= BCF;
			    when "0100001" => instruction <= BCF;
			    when "0100010" => instruction <= BCF;
                when "0100011" => instruction <= BCF;
			    when "0100100" => instruction <= BCF;
			    when "0100101" => instruction <= BCF;
			    when "0100110" => instruction <= BCF;
			    when "0100111" => instruction <= BCF;
            
			    when "0101000" => instruction <= BSF;
			    when "0101001" => instruction <= BSF;
                when "0101010" => instruction <= BSF;
                when "0101011" => instruction <= BSF;
                when "0101100" => instruction <= BSF;
                when "0101101" => instruction <= BSF;       
                when "0101110" => instruction <= BSF;
                when "0101111" => instruction <= BSF;

			    when "1111100" => instruction <= ADDLW;
			    when "1111101" => instruction <= ADDLW;
			    when "1111110" => instruction <= ADDLW; 
			    when "1111111" => instruction <= ADDLW;

                when "1110010" => instruction <= ANDLW;
                when "1110011" => instruction <= ANDLW;
			    when "1110000" => instruction <= IORLW;
                when "1110001" => instruction <= IORLW;

			    when "1100000" => instruction <= MOVLW;
                when "1100001" => instruction <= MOVLW;
                when "1100010" => instruction <= MOVLW;
                when "1100011" => instruction <= MOVLW;
                when "1100100" => instruction <= MOVLW;
                when "1100101" => instruction <= MOVLW;
                when "1100110" => instruction <= MOVLW;
                when "1100111" => instruction <= MOVLW;

			    when "1111000" => instruction <= SUBLW;
                when "1111001" => instruction <= SUBLW;
                when "1111010" => instruction <= SUBLW;
                when "1111011" => instruction <= SUBLW;

			    when "1110100" => instruction <= XORLW;
                when "1110101" => instruction <= XORLW;

			    when "0001000" => instruction <= IORWF;
                when "0001001" => instruction <= IORWF;
			    when others => instruction <= NOP;

            end case;

    end procedure string_to_insruction;

    procedure ADDWF(signal W,f: in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        variable interResult : std_logic_vector(8 downto 0);
        begin
            interResult := ('0' & W )+ f;
            result <= interResult(7 downto 0);
            status_out <= generate_status(interResult);
    end procedure ADDWF;


    procedure ANDWF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        variable inter : std_logic_vector(8 downto 0);
        begin
            inter := ('0' & W) and ('0' & f);
            result <= inter(7 downto 0);
            status_out <= generate_status(inter);
    end procedure ANDWF;


    procedure BCF(signal f: in std_logic_vector(7 downto 0);
                    signal b: in std_logic_vector(2 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
            begin
                result <= f;
                result(to_integer(unsigned(b)))<='0';
                status_out <= status_in;
    end procedure BCF;

    procedure BSF(signal f: in std_logic_vector(7 downto 0);
                    signal b: in std_logic_vector(2 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
            begin
                result <= f;
                result(to_integer(unsigned(b)))<='1';
                status_out <= status_in;
    end procedure BSF;

    procedure COMF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        variable inter : std_logic_vector(8 downto 0);
        begin
            for i in f'range loop
                inter(i) := not f(i);
            end loop;
            result <= inter(7 downto 0);
            status_out <= status_in;
            if inter = "000000000" then
            status_out(2) <= '1'; 
            else 
            status_out(2) <= '0';
            end if;
    end procedure COMF;

    procedure DECF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        variable inter : std_logic_vector(8 downto 0);
        begin
            inter := std_logic_vector(unsigned('0' & f)-1);
            result <= inter(7 downto 0);
            status_out <= status_in;
            if inter = "000000000" then
            status_out(2) <= '1'; 
            else 
            status_out(2) <= '0';
            end if;
    end procedure DECF;

    procedure INCF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        variable inter : std_logic_vector(8 downto 0);
        begin
            inter := ('0' & f) + 1;
            result <= inter(7 downto 0);
            status_out <= status_in;
            if inter = "000000000" then
            status_out(2) <= '1'; 
            else 
            status_out(2) <= '0';
            end if;
    end procedure INCF;

    procedure CLRF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        begin
            result <= "00000000";
            status_out(2) <= '1';
            status_out(1 downto 0) <= status_in(1 downto 0);
    end procedure CLRF;


    procedure IORWF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        begin
            result <= W or f;
            status_out <= status_in;
            if W = "00000000" then
            status_out(2) <= '1'; 
            else 
            status_out(2) <= '0';
            end if;
    end procedure IORWF;

    procedure MOVF(signal W : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        begin
            result <= W;
            status_out <= status_in;
    end procedure MOVF;


    
    procedure MOVWF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        begin
            result <= W;
            status_out <= status_in;
    end procedure MOVWF;


    procedure RLF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
            variable inter : std_logic_vector( 8 downto 0);
            variable rotated : std_logic_vector( 8 downto 0);
        begin
            inter := status_in(0) & f;
            rotated := inter(7 downto 0) & inter(8);
            result <= rotated(7 downto 0);
            status_out <= status_in;
    end procedure RLF;

    procedure RRF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
            variable inter : std_logic_vector( 8 downto 0);
            variable rotated : std_logic_vector( 8 downto 0);
        begin
            inter := status_in(0) & f;
            rotated := inter(0) & inter(8 downto 1);
            result <= rotated(7 downto 0);
            status_out <= status_in;
    end procedure RRF;


    procedure SUBWF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
            variable inter : std_logic_vector(8 downto 0);
        begin
            inter := std_logic_vector(unsigned('0'&W)-unsigned('0'&f));
            result <= inter(7 downto 0);
            status_out <= status_in;
            status_out <= generate_status(inter);

    end procedure SUBWF;

    procedure SWAPF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
                variable inter : std_logic_vector(7 downto 0);
            begin
                inter := W(3 downto 0) & W(7 downto 4);
                    result <= inter;
                    status_out <= status_in;
    end procedure SWAPF;

    procedure XORWF(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
            begin
                result <= W XOR f;
                status_out <= status_in;
                if W = "00000000" then
                status_out(2) <= '1'; 
                else 
                status_out(2) <= '0';
                end if;               
    end procedure XORWF;

    procedure NOP(signal W,f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
            begin
                result <= W;
                status_out <= status_in;
    end procedure NOP;

end package body InstructionSet;
