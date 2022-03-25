library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity adder is
    port (
        clk : in std_logic;
        rst : in std_logic;
        a : in std_logic;
        b : in std_logic;
        ci : in std_logic;
        s : out std_logic;
        co : out std_logic
    );
end adder;

architecture rtl of adder is
begin
    s <= (a xor b) xor ci;
    co <= (a and b) or (ci and (a xor b));

end architecture;
