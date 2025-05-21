library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--  PELO QUE TESTEI TA CERTO
entity pc is
  port( clk : in std_logic;
        rst : in std_logic;
        data_out : out unsigned(15 downto 0)
  );
end entity;

architecture a_pc of pc is
  component reg16bits is
    port(
        clk : in std_logic;
        rst : in std_logic;
        wr_en : in std_logic;
        data_in : in unsigned(15 downto 0);
        data_out : out unsigned(15 downto 0)
    );
  end component;

  signal contador: unsigned(15 downto 0);
  signal s_data_out : unsigned(15 downto 0);
begin
    contador <= s_data_out+1;
    reg0 : reg16bits port map(clk => clk, rst => rst, wr_en  => '1',
                              data_in => contador, data_out => s_data_out);

    data_out <= s_data_out;

end architecture;
