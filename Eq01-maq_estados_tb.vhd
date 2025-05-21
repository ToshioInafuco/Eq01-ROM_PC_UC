library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maq_estados_tb is
end entity;

architecture a_maq_estados_tb of maq_estados_tb is
  component maq_estados is 
    port(
      clk    : in std_logic;
      rst    : in std_logic;
      estado : out std_logic
    );
  end component;

  signal clk,rst    : std_logic := '0';
  signal estado : std_logic;
  constant CLK_PERIOD : time := 10 ns;


begin
   -- Clock
  clk_process : process
  begin
    while now < 100 ns loop
      clk <= '0';
      wait for CLK_PERIOD / 2;
      clk <= '1';
      wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process;

  -- Instancia o módulo
  uut: maq_estados
    port map(
      clk    => clk,
      rst    => rst,
      estado => estado
    );

  -- Estímulos
  stimulus : process
  begin
    -- Reset inicial
    rst <= '1';
    wait for 15 ns;
    rst <= '0';

    -- Deixe rodar os clocks
    wait;
  end process;

end architecture;
