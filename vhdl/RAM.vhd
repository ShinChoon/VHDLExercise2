library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
    generic (depth:integer; length:integer);
    port (
        clk : in std_logic;
        addr : in std_logic_vector(depth-1 downto 0);
        PC : in integer;
        PC_tot : in integer;
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
end RAM;

architecture rtl of RAM is
    type mem_array is array (0 to 2**depth -1 ) of std_logic_vector(length-1 downto 0);
    type instr_array is array (0 to 2**depth -1) of std_logic_vector(13 downto 0);
    signal instruction_array : instr_array := (others=>(others=>'0'));
    signal operand_array : mem_array := (others=>(others=>'0'));
    signal pipelined_d_out : std_logic_vector(length-1 downto 0):=(others=>'0');--data output
    signal pipelined_s_out : std_logic_vector(2 downto 0):=(others=>'0');--status
    signal pipelined_i_out : std_logic_vector(13 downto 0):=(others=>'0');--status

begin
    

    state_reg: process(clk) is

        begin
            if rst = '1' then
                instruction_array <= (others=>(others=>'0'));--data output
                operand_array <= (others=>(others=>'0'));--status
            else
                if rising_edge(clk) then
                    pipelined_d_out<= operand_array(to_integer(unsigned(addr)));
                    pipelined_s_out<= operand_array(3)(2 downto 0);              
                    d_out <= pipelined_d_out;
                    status_out <= pipelined_s_out;
                    if op_wr = '1' then
                        operand_array(to_integer(unsigned(addr))) <= d_in;
                        if addr = x"03" then
                            operand_array(3) <= d_in;
                        else
                            operand_array(3)(2 downto 0) <= status_in;                    
                        end if;
                    end if;

                    if instr_wr = '1' then
                        instruction_array(PC_tot) <= instruction_in;
                    else
                        pipelined_i_out<= instruction_array(PC);
                        -- report "pipelined_i_out:  " & integer'image(to_integer(unsigned(pipelined_i_out)));
                        instruction_out <= pipelined_i_out;  
                    end if;

                -- report "instruction written: " & instruction_in;
                end if;
        end if;
    end process state_reg;

end architecture;