library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package InstructionSet is
    type instr_type is (ADDLW, ANDLW, CLRF, COMF, 
                       DECF, INCF, IORLW, MOVLW, NOP, RLF,
                       RRF, SUBLW, SWAPF, XORLW, BCF,
                       BSF);
    function generate_status(result: in std_logic_vector(8 downto 0)) 
    return std_logic_vector;

    procedure string_to_insruction(signal str_read: in string(1 to 5);
                                   signal instruction : out instr_type);

    procedure ADDLW(signal W : in std_logic_vector(7 downto 0);
                    signal f: in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure ANDLW(signal W : in std_logic_vector(7 downto 0);
                    signal f: in std_logic_vector(7 downto 0);
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

    procedure COMF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure DECF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure INCF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure CLRF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));


    procedure IORLW(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));


    
    procedure MOVLW(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));


    procedure RLF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure RRF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));


    procedure SUBLW(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));


    procedure SWAPF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));

    procedure XORLW(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0));
    

    procedure NOP(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
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

    procedure string_to_insruction(signal str_read: in string(1 to 5);
                                   signal instruction : out instr_type) is
        begin

            case str_read is 
                when "ADDWF" => instruction <= ADDLW;
                when "ADDLW" => instruction <= ADDLW;
                when "ANDWF" => instruction <= ANDLW;
                when "ANDLW" => instruction <= ANDLW;
                when "CLRFZ" => instruction <= CLRF;
                when "CLRWZ" => instruction <= CLRF;
                when "COMFZ" => instruction <= COMF;
                when "DECFZ" => instruction <= DECF;
                when "INCFZ" => instruction <= INCF;
                when "IORWF" => instruction <= IORLW;
                when "IORLW" => instruction <= IORLW;
                when "MOVFZ" => instruction <=  MOVLW;
                when "MOVLW" => instruction <= MOVLW;
                when "MOVWF" => instruction <= MOVLW;
                when "RLFZZ" => instruction <= RLF;
                when "RRFZZ" => instruction <= RRF;
                when "SUBLW" => instruction <= SUBLW;
                when "SUBWF" => instruction <= SUBLW;
                when "SWAPF" => instruction <= SWAPF;
                when "XORWF" => instruction <= XORLW;
                when "BCFZZ" => instruction <= BCF;
                when "BSFZZ" => instruction <= BSF;
                when "NOPZZ" => instruction <= NOP;
                when others => instruction <= NOP;
            end case;



    end procedure string_to_insruction;

    procedure ADDLW(signal W : in std_logic_vector(7 downto 0);
                    signal f: in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        variable inter : std_logic_vector(8 downto 0);
        begin
            inter := std_logic_vector(unsigned('0' & W) + unsigned('0' & f));
            result <= inter(7 downto 0);
            status_out <= generate_status(inter);
    end procedure ADDLW;

    -- procedure ADDWF(signal W,f : in std_logic_vector(7 downto 0),
    --                 signal d : in std_logic,
    --                 signal status: in std_logic_vector(2 downto 0)) is
    --     variable result : std_logic_vector(8 downto 0);
    --     begin
    --         result := std_logic_vector(unsigned('0' & W) + unsigned('0' & f));
    --         if d = '0' then
    --             W <= result(7 downto 0);
    --         else
    --             f <= result(7 downto 0);
    --         end if;
    --         status <= generate_status(result);
    -- end procedure ADDWF;

    procedure ANDLW(signal W : in std_logic_vector(7 downto 0);
                    signal f: in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        variable inter : std_logic_vector(8 downto 0);
        begin
            inter := ('0' & W) and ('0' & f);
            result <= inter(7 downto 0);
            status_out <= generate_status(inter);
    end procedure ANDLW;

    -- procedure ANDWF(signal W,f : in std_logic_vector(7 downto 0),
    --                 signal d: in std_logic,
    --                 signal status: in std_logic_vector(2 downto 0)) is
    --     variable result : std_logic_vector(8 downto 0);
    --     begin
    --         result := ('0' & W) and ('0' & f);
    --         if d='0' then
    --             W <= result(7 downto 0);
    --         else
    --             f <= result(7 downto 0);
    --         end if;
    --         status <= generate_status(result);
    -- end procedure ANDWF;

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

    procedure COMF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
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

    procedure DECF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
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

    procedure INCF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        variable inter : std_logic_vector(8 downto 0);
        begin
            inter := std_logic_vector(unsigned('0' & f)+1);
            result <= inter(7 downto 0);
            status_out <= status_in;
            if inter = "000000000" then
            status_out(2) <= '1'; 
            else 
            status_out(2) <= '0';
            end if;
    end procedure INCF;

    procedure CLRF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        begin
            result <= "00000000" and f;
            status_out <= status_in;
            status_out(2) <= '1';
    end procedure CLRF;


    procedure IORLW(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
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
    end procedure IORLW;

    -- procedure IORWF(signal W,f:in std_logic_vector(7 downto 0),
    --             signal d: in std_logic,
    --             signal status_in : in std_logic_vector(2 downto 0),signal status_out : out std_logic_vector(2 downto 0))is
    -- variable result : std_logic_vector(8 downto 0);
    -- begin
    --     result <= W or k;
    --     if d = '0' then
    --         W <= result(7 downto 0);
    --     else
    --         f <= result(7 downto 0);
    --     end if;
    --     status(2) <= '1' when result = "00000000" else '0';
    -- end procedure IORWF;

    -- procedure MOVF(signal W, f: in std_logic_vector(7 downto 0),
    --                 signal d : in std_logic,
    --                 signal status: in std_logic_vector(2 downto 0)) is
    --     begin

    --         if d = '0' then
    --             f <= W;
    --         else:
    --             W <= W;
    --         end if;

    --         status(2) <= W(7);

    -- end procedure MOVF;


    
    procedure MOVLW(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
        begin
            result <= f;
            status_out <= status_in;
            status_out(2) <= W(7);
    end procedure MOVLW;


    -- procedure MOVWF(signal W:in std_logic_vector(7 downto 0),
    --                 signal f : out std_logic_vector(7 downto 0),
    --                 signal status: in std_logic_vector(2 downto 0)) is
    --     begin
    --         f <= W;
    -- end procedure MOVWF;


    procedure RLF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
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

    procedure RRF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
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


    procedure SUBLW(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
            variable inter : std_logic_vector(8 downto 0);
        begin
            inter := std_logic_vector(unsigned('0'&W)-unsigned('0'&f));
            result <= inter(7 downto 0);
            status_out <= status_in;
            status_out <= generate_status(inter);

    end procedure SUBLW;

    -- procedure SUBWF(signal f: in std_logic_vector(7 downto 0);
    --                 signal W: out std_logic_vector(7 downto 0),
    --                 signal d: in std_logic,
    --                 signal status: out std_logic_vector(2 downto 0))is
    --         variable result : std_logic_vector(8 downto 0);
    --     begin
    --         result := std_logic_vector(unsigned('0'&W)-unsigned('0'&k));
    --         if d = '0' then
    --         status <= generate_status(result);
    --         W <= result(7 downto 0);
    --         else:
    --             status <= generate_status(result);
    --             f <= result(7 downto 0);
    --         end if;
    -- end procedure SUBWF;


    procedure SWAPF(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
                variable inter : std_logic_vector(7 downto 0);
            begin
                inter := W(3 downto 0) & W(7 downto 4);
                -- if d = '0' then
                result <= inter;
                status_out <= status_in;
                -- else
                --     f <= result;
                -- end if;
    end procedure SWAPF;

    procedure XORLW(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
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
    end procedure XORLW;
    


    -- procedure XORWF(signal W, f: in std_logic_vector(7 downto 0),
    --                 signal d: in std_logic),
    --                 signal status: in std_logic_vector(2 downto 0)) is
    --             variable result : std_logic_vector(7 downto 0);
    --         begin
    --             result := W XOR k;
    --             if d = '0' then
    --                 W <= result;
    --             else
    --                 f <= result;
    --             end if;
    --             status(2) <= '0' when result = "000000000" else '0';
    -- end procedure XORWF;

    procedure NOP(signal W : in std_logic_vector(7 downto 0);
                    signal f : in std_logic_vector(7 downto 0);
                    signal status_in : in std_logic_vector(2 downto 0);
                    signal status_out : out std_logic_vector(2 downto 0);
                    signal result :  out std_logic_vector(7 downto 0))is
            begin
                result <= W;
                status_out <= status_in;
    end procedure NOP;

end package body InstructionSet;
