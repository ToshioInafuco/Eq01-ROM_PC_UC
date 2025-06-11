library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--  PELO QUE TESTEI TA CERTO
entity pc is
  port( clk : in std_logic;
        rst : in std_logic;
        wr_en : in std_logic;
        jump_en : in std_logic;
        data_in  : in unsigned(15 downto 0);
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

  signal s_data_in: unsigned(15 downto 0);
  signal s_data_out : unsigned(15 downto 0);
begin
    s_data_in <=  s_data_out+1 when jump_en='0' else
                  data_in  when jump_en='1' else
                  x"0000";

    reg0 : reg16bits port map(clk => clk, rst => rst, wr_en  => wr_en,
                              data_in => s_data_in, data_out => s_data_out);

    data_out <= s_data_out;

end architecture;
