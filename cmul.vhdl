
--
-- complex multiplication
--

library ieee;
-- use ieee.std_logic_1164.all;

use ieee.fixed_float_types.all;
use ieee.fixed_pkg.all;

entity cmul is

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
end cmul;

architecture FIMP_0 of cmul is

signal a, b, x, y : sfixed (0 downto 1 - data_width);
signal re, im : sfixed(2 downto 2 - 2 * data_width);

begin

  a <= input_a_real;
  b <= input_a_imag;

  x <= input_b_real;
  y <= input_b_imag;

  re <= (a * x) - (b * y);
  im <= (a * y) + (b * x);

  output_real(0) <= re(2);
  output_real(-1 downto 1 - data_width) <= re(-1 downto 1 - data_width);
  
  output_imag(0) <= im(2);
  output_imag(-1 downto 1 - data_width) <= im(-1 downto 1 - data_width);

end FIMP_0;
