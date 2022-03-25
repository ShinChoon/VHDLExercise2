library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity fulladder1 is
    generic (N : integer);
    port (
        clk : in std_logic;
        rst : in std_logic;
        A : in std_logic_vector(N-1 downto 0);
        B : in std_logic_vector(N-1 downto 0);
        S : out std_logic_vector(N-1 downto 0);
        Cout : inout std_logic
    );
end fulladder1;

architecture behav of fulladder1 is
    component adder  is
    port(
        clk : in std_logic;
        rst : in std_logic;
        a : in std_logic;
        b : in std_logic;
        s : out std_logic;
        ci : in std_logic;
        co : inout std_logic
    );
    end component adder;
    signal CI : std_logic;
    signal COLH : std_logic_vector(N-1 downto 0);
        signal A2 : std_logic_vector(N-1 downto 0) :=x"0A";

begin
    Adder0 : component adder
        port map(a=>A(0), b=>B(0),ci=>'0', s=>S(0), clk=>clk, rst=>rst,co=>COLH(1));

    Adder1 : for bit_index in 1 to N - 2 generate
    begin
        singleAdder: component adder
        port map(a=>A(bit_index), b=>B(bit_index),ci=>COLH(bit_index), s=>S(bit_index), clk=>clk, rst=>rst,co=>COLH(bit_index+1));
    end generate Adder1;

    AdderN : component adder
        port map(a=>A(N-1), b=>B(N-1), ci=>COLH(N-1), s=>S(N-1), clk=>clk, rst=>rst,co=>Cout);

end architecture;