library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Rom_Pc_UC is
      port( 
        clk : in std_logic;
        rst : in std_logic;
        uc_out : out unsigned(7 downto 0)
  );
end entity;

architecture a_Rom_Pc_UC of Rom_Pc_UC is
  component pc is
    port( clk : in std_logic;
        rst : in std_logic;
        wr_en : in std_logic;
        jump_en : in std_logic;
        data_in  : in unsigned(15 downto 0);
        data_out : out unsigned(15 downto 0)
    );
  end component;

  component rom is
    port( 
      clk : in std_logic;
      endereco : in unsigned(15 downto 0);
      dado : out unsigned(7 downto 0));
  end component;

  component maq_estados is
    port(
      clk    : in std_logic;
      rst    : in std_logic;
      estado : out std_logic
    );
  end component;

  signal s_data_out, s_data_in     : unsigned(15 downto 0);
  signal s_instrucao : unsigned(7 downto 0);
  signal opcode: unsigned(1 downto 0);
  signal s_estado, s_jump_en : std_logic;

begin
    opcode <= s_instrucao(7 downto 6);
    s_data_in <= "0000000000" & s_instrucao(5 downto 0);
    s_jump_en <= '1' when opcode="11" else
                  '0';
                  
    maq_estado0 : maq_estados port map(clk => clk, rst => rst, estado => s_estado);

    pc0 : pc port map(clk => clk, rst => rst, wr_en => s_estado, jump_en => s_jump_en,
                        data_in => s_data_in, data_out => s_data_out);

    rom0 : rom port map(clk => clk, endereco => s_data_out, dado => s_instrucao);

    uc_out <= s_instrucao;
end architecture;
