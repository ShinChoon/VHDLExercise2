library ieee;
use ieee.std_logic_1164.all;
<<<<<<< HEAD
use ieee.numeric_std.all;

<<<<<<< HEAD
entity multiplexer is
    port (
        clk : in bit;
        rst : in bit;
        A : in bit_vector( 7 downto 0);
        B : in bit_vector( 7 downto 0);
        Q : out bit_vector(7 downto 0);
        S : in bit
    );
end multiplexer;

architecture rtl of multiplexer is

begin
    process(clk,S,A,B,rst) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                Q <= x"00";
            else
                if S = '1' then
                    Q <= A;
                else
                    Q <= B;
                end if;
            end if;
        end if;
    end process;

end architecture;
=======


>>>>>>> f496601 (populated placeholders)
=======
-- your code here
>>>>>>> e37ba31 (small edits, template can be cloned)
