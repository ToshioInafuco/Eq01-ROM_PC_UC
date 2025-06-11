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
      uc_out  : out unsigned(7 downto 0)
    );
  end component;

  signal s_clk      : std_logic := '0';
  signal s_rst      : std_logic := '0';
  signal s_uc_out : unsigned(7 downto 0) := "00000000";

  constant CLK_PERIOD : time := 25 ns;

begin

  -- Geração do clock
  clk_proc : process
  begin
    while now < 1000 ns loop
      s_clk <= '0'; wait for CLK_PERIOD / 2;
      s_clk <= '1'; wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process;

  -- Instância do top
  dut : Rom_Pc_UC
    port map(
      clk      => s_clk,
      rst      => s_rst,
      uc_out   => s_uc_out
    );

  -- Reset
  stim : process
  begin
    s_rst <= '1'; wait for 10 ns;
    s_rst <= '0';
    wait;
  end process;
end architecture;
