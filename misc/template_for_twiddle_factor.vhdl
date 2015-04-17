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

---------------------
-- twiddle factor for
-- {{N}}-point FFT
---------------------

-- Description
  -- This is an automatically generated twiddle factor file for {{N}} points FFT


library ieee;
use ieee.std_logic_1164.all;

library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;

entity twiddle_factor is

  generic (

    -- data width of the real and imaginary part
      data_width : integer := {{default_data_width}}

    );

  port (

    -- twiddle factor output
    wk_out_re : out std_logic_vector ({{N}} / 2 * data_width - 1 downto 0);
    wk_out_im : out std_logic_vector ({{N}} / 2 * data_width - 1 downto 0)

    );

  end twiddle_factor;

-- Function Implementation 0
architecture FIMP_0 of twiddle_factor is
  
begin
  -- twiddle factor values
  {% for twiddle_factor in twddle_factor_set %}
    wk_out_re( ({{twiddle_factor.i}} + 1) * data_width - 1 
               downto 
               {{twiddle_factor.i}} * data_width
             ) <= to_slv(to_sfixed({{twiddle_factor.re}}, 0, 1- data_width));

    wk_out_im( ({{twiddle_factor.i}} + 1) * data_width - 1 
               downto 
               {{twiddle_factor.i}} * data_width
             ) <= to_slv(to_sfixed({{twiddle_factor.im}}, 0, 1- data_width));
  {% endfor %}

end FIMP_0;
