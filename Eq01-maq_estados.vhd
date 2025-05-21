library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maq_estados is
   port(
    clk    : in std_logic;
    rst    : in std_logic;
    estado : out std_logic
  );
end entity;

architecture a_maq_estados of maq_estados is
  signal s_estado : std_logic := '0';
begin
  process(clk, rst)
  begin
    if rst = '1' then
      s_estado <= '0';  -- reset para estado 0
    elsif rising_edge(clk) then
      s_estado <= not s_estado; -- alterna o estado (T flip-flop)
    end if;
  end process;

  estado <= s_estado;
end architecture;
