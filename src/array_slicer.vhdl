-- The MIT License (MIT)

  -- Copyright (c) 2014 Shuo Li

  -- Permission is hereby granted, free of charge, to any person obtaining a copy
  -- of this software and associated documentation files (the "Software"), to deal
  -- in the Software without restriction, including without limitation the rights
  -- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  -- copies of the Software, and to permit persons to whom the Software is
  -- furnished to do so, subject to the following conditions:

  -- The above copyright notice and this permission notice shall be included in all
  -- copies or substantial portions of the Software.

  -- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  -- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  -- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  -- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  -- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  -- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  -- SOFTWARE.

---------------
-- array slicer
---------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity array_slicer is

  generic (
    data_width : integer := 16;
    array_length : integer := 8;
    address_width : integer := 3
    );

  port (
    array_in : in std_logic_vector(array_length * data_width - 1 downto 0);
    address_in : in std_logic_vector(address_width - 1 downto 0);
    data_out : out std_logic_vector(data_width - 1 downto 0)
    );

  end array_slicer;

-- Function Implementation 0
architecture FIMP_0 of array_slicer is
  
  signal address_integer : integer range 0 to array_length - 1;
  signal address_unsigned : unsigned(address_width - 1 downto 0);

begin

  address_integer <= to_integer(address_unsigned);
  address_unsigned <= unsigned(address_in);

  data_out <= array_in((address_integer + 1) * data_width - 1 downto address_integer * data_width);

end FIMP_0;