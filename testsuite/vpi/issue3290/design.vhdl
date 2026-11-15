library ieee;
use ieee.std_logic_1164.all;

entity adder is
  port (
    clk : in std_logic;
    a   : in std_logic;
    b   : in std_logic;
    v   : in std_logic_vector(3 downto 0);
    sum : out std_logic
  );
end entity;

architecture arch of adder is
begin
  sum <= a xor b;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity wrap is
  port (
    clk : in std_logic;
    x   : in std_logic;
    y   : in std_logic;
    s   : out std_logic
  );
end entity;

architecture arch of wrap is
  signal vec : std_logic_vector(3 downto 0);
begin
  u_in : entity work.adder
    port map (clk => clk, a => x, b => y, v => vec, sum => s);
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity myentity is
  port (
    top_in  : in std_logic;
    top_out : out std_logic
  );
end entity;

architecture arch of myentity is
  signal clk, x, y, s1, s2, s3 : std_logic;
  signal vec  : std_logic_vector(7 downto 0);
  signal nvec : std_logic_vector(3 downto 0);
begin
  clk <= top_in;
  x <= top_in;
  y <= not top_in;
  vec <= (others => top_in);
  nvec <= (others => y);

  u1 : entity work.adder
    port map (clk => clk, a => x, b => y, v => vec(3 downto 0), sum => s1);

  u2 : entity work.adder
    port map (clk => clk, a => x, b => not y, v => nvec, sum => s2);

  u3 : entity work.adder
    port map (clk => clk, a => x, b => y, v => vec(7 downto 4), sum => open);

  u_wrap : entity work.wrap
    port map (clk => clk, x => x, y => y, s => s3);

  top_out <= s1 xor s2 xor s3;
end architecture;
