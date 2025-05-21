library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Rom_Pc_UC_tb is
end entity;

architecture a_Rom_Pc_UC_tb of Rom_Pc_UC_tb is
  component Rom_Pc_UC is
    port(
      clk       : in std_logic;
      rst       : in std_logic;
      dado_rom  : out unsigned(7 downto 0)
    );
  end component;
  signal clk      : std_logic := '0';
  signal rst      : std_logic := '0';
  signal dado_rom : unsigned(7 downto 0);

  constant CLK_PERIOD : time := 30 ns;

begin

  -- Geração do clock
  clk_proc : process
  begin
    while now < 500 ns loop
      clk <= '0'; wait for CLK_PERIOD / 2;
      clk <= '1'; wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process;

  -- Instância do top
  dut : Rom_Pc_UC
    port map(
      clk      => clk,
      rst      => rst,
      dado_rom => dado_rom
    );

  -- Reset
  stim : process
  begin
    rst <= '1'; wait for 10 ns;
    rst <= '0';
    wait;
  end process;

end architecture;
