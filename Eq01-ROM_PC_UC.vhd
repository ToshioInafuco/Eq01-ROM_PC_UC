library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Rom_Pc_UC is
      port( 
        clk : in std_logic;
        rst : in std_logic;
        dado_rom : out unsigned(7 downto 0)
  );
end entity;

architecture a_Rom_Pc_UC of Rom_Pc_UC is
  component pc is
    port( clk : in std_logic;
        rst : in std_logic;
        data_out : out unsigned(15 downto 0)
    );
  end component;

  component rom is
    port( 
      clk : in std_logic;
      endereco : in unsigned(15 downto 0);
      dado : out unsigned(7 downto 0));
  end component;

  signal s_data_out     : unsigned(15 downto 0);
  signal s_instrucao : unsigned(7 downto 0);

  
begin
    pc0 : pc port map(clk => clk, rst => rst, data_out => s_data_out);
    rom0 : rom port map(clk => clk, endereco => s_data_out(7 downto 0), dado => s_instrucao);

    dado_rom <= s_instrucao;

end architecture;
