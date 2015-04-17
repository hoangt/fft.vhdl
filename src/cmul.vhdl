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

-------------------------
-- complex multiplication
-------------------------

-- Description
  -- This design unit `cmul` is for multiply two complex fixed point numbers with
  -- configurable data width. The value of the inputs are limited to (+1, -1]. The
  -- MSB is sign bit and the rest bits are all for decimal part.

-- library declaration for Cadence, not for Modelsim
library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;

entity cmul is

  generic (

    -- same data width is used for the real and imaginary component
    data_width : integer range 0 to 128 := 16

    );

  port (

    -- input a
      input_a_re : in sfixed (0 downto 1 - data_width);
      input_a_im : in sfixed (0 downto 1 - data_width);
    
    -- input b
      input_b_re : in sfixed (0 downto 1 - data_width);
      input_b_im : in sfixed (0 downto 1 - data_width);

    -- output
      output_re : out sfixed(0 downto 1 - data_width);
      output_im : out sfixed(0 downto 1 - data_width)

    );

  end cmul;

-- Function Implementation 0
architecture FIMP_0 of cmul is

  -- internal signals with short names
    -- input a = a + b * j
    -- input b = x + y * j
    signal a, b, x, y : sfixed (0 downto 1 - data_width);
    
    -- output = re + im * j
    -- cropping is required
    signal re, im : sfixed(2 downto 2 - 2 * data_width);

begin
  
  -- input a = a + b * j
    a <= input_a_re;
    b <= input_a_im;

  -- input b = x + y * j
    x <= input_b_re;
    y <= input_b_im;

  -- output real part
    -- a * x - b * y
    re <= (a * x) - (b * y);

  -- output imaginary part
    -- a * y + b * x
    im <= (a * y) + (b * x);

  -- crop the outputs to fit with data width
    output_re(0) <= re(2);
    output_re(-1 downto 1 - data_width) <= re(-1 downto 1 - data_width);
    
    output_im(0) <= im(2);
    output_im(-1 downto 1 - data_width) <= im(-1 downto 1 - data_width);

end FIMP_0;
