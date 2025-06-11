library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom is
 port( 
  clk : in std_logic;
  endereco : in unsigned(15 downto 0);
  dado : out unsigned(7 downto 0)
 );
end entity;

architecture a_rom of rom is
 type mem is array (0 to 127) of unsigned(7 downto 0);
 constant conteudo_rom : mem := (
            -- caso endereco => conteudo (apenas exemplo. Altere para refletir o
            -- programa solicitado)
            0 => "00000000",
            1 => "00000000",
            2 => "11000101",
            3 => "00000000",
            4 => "00000000",
            5 => "00100000",
            6 => "00000010",
            7 => "00000000",
            8 => "00000000",
            9 => "11000010",
            10 => "00000000",
            -- abaixo: casos omissos => (zero em todos os bits a decodificação do pc
            --é parcial dos 7 least significat bits)
            others => (others=>'0')
    );
begin
  process(clk)
  begin
    if(rising_edge(clk)) then
      dado <= conteudo_rom(to_integer(endereco));
    end if;
  end process;
end architecture;
