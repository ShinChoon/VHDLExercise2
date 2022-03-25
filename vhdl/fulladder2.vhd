library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity fulladder2 is
    generic(N : integer);
    port (
        clk : in std_logic;
        rst : in std_logic;
        A : in std_logic_vector(N-1 downto 0);
        B : in std_logic_vector(N-1 downto 0);
        S : out std_logic_vector(N-1 downto 0);
        Cout : out std_logic
    );
end fulladder2;

architecture behav of fulladder2 is
signal result : std_logic_vector(N downto 0);
signal A2 : std_logic_vector(N-1 downto 0) :=x"0A";


begin
    process(result, A, B) is
    begin
        result <= ('0' & A ) + B;
        S <= result(N-1 downto 0);
        Cout <= result(N);
    end process;


end architecture;