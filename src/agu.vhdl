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

--------------------------
-- address generation unit
-- for N-point FFT
--------------------------

library ieee;
use ieee.std_logic_1164.all;

library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;

entity agu is

  generic ( address_width : integer := 8 );

    port (
      count_in : in std_logic_vector(address_width - 2 downto 0);
      current_stage : in integer range 0 to address_width - 1;

      address_out_0 : out std_logic_vector(address_width - 1 downto 0);
      address_out_1 : out std_logic_vector(address_width - 1 downto 0)
 
      );

  end agu;

-- Function Implementation 0
architecture FIMP_0 of agu is

begin

  process(count_in, current_stage)
    begin
    if current_stage = 0 then
      address_out_0 <= count_in & '0';
      address_out_1 <= count_in & '1';
    elsif current_stage = address_width - 1 then
      address_out_0 <= '0' & count_in;
      address_out_1 <= '1' & count_in;
    else
      for i in 1 to address_width - 2 loop
        if current_stage = i then
          address_out_0 <= count_in(address_width-2 downto i) & '0' & count_in(i - 1 downto 0);
          address_out_1 <= count_in(address_width-2 downto i) & '0' & count_in(i - 1 downto 0);
        end if;
      end loop;
    end if;
    end process;

end FIMP_0;