library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--  PELO QUE TESTEI TA CERTO
entity pc_tb is
end entity;

architecture a_pc_tb of pc_tb is
  component pc is
    port( clk : in std_logic;
          rst : in std_logic;
          data_out : out unsigned(15 downto 0)
    );
  end component;

  signal s_clk, s_rst   :  std_logic;
  signal s_data_out     : unsigned(15 downto 0);
  constant CLK_PERIOD : time := 30 ns;

begin

  -- Geração do clock
  clk_proc : process
  begin
    while now < 3000 ns loop
      s_clk <= '0'; wait for CLK_PERIOD / 2;
      s_clk <= '1'; wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process;

  pc0 : pc port map(clk => s_clk, rst => s_rst, data_out => s_data_out);


  stim : process
  begin
    s_rst <= '1'; wait for 10 ns;
    s_rst <= '0';
    wait;
  end process;
end architecture;
