library ieee;
use ieee.std_logic_1164.all;

entity orgate is
end entity;

architecture arch of orgate is
    signal a, b, c : std_logic;
begin
    
    c <= a or b;

    run_sim : process is
    begin
        a <= '0';
        b <= '0';

        wait for 1 ns;
        b <= '1';
        wait for 1 ns;
        b <= '0';
        wait for 2 ns;
        a <= '1';
        wait for 1 ns;

        wait;
    end process;

end architecture;
