--
-- complex multiplication
--

library ieee;
-- use ieee.std_logic_1164.all;

use ieee.fixed_float_types.all;
use ieee.fixed_pkg.all;

library work;
use work.all;

entity TB is end TB;

architecture test_cmul of TB is

  constant data_width : integer := 8;
  component cmul is

    generic (
      data_width : integer range 0 to 128 := 16
    );

    port (
  
      input_a_real : in sfixed (0 downto 1 - data_width);
      input_a_imag : in sfixed (0 downto 1 - data_width);

      input_b_real : in sfixed (0 downto 1 - data_width);
      input_b_imag : in sfixed (0 downto 1 - data_width);

      output_real : out sfixed(0 downto 1 - data_width);
      output_imag : out sfixed(0 downto 1 - data_width)

    );

    end component;

  signal a, b, x, y : sfixed (0 downto 1 - data_width);
  signal ree, imm : sfixed(0 downto 1 - data_width);

begin

DUT: cmul
  generic map (data_width)
  port map (a, b, x, y, ree, imm);

a <= to_sfixed(0.2, 0, 1- data_width);
b <= to_sfixed(0.4, 0, 1- data_width);

x <= to_sfixed(0.3, 0, 1- data_width);
y <= to_sfixed(0.6, 0, 1- data_width);

end test_cmul;

