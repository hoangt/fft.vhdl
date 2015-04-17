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

----------------------
-- butterfly operation
----------------------

-- Description
  -- This design unit `bf` is for performing butterfly operation on complex fixed point
  -- numbers with configurable data width. The value of the inputs are limited to (+1, -1].
  -- The MSB is the sign bit and the rest bits are all decimal part.

library ieee_proposed;

use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;

entity bf is

  generic (

    -- data width of the real and imaginary part
      data_width : integer range 0 to 128 := 16

    );

  port (

    -- x0, input 0
      x0_re : in sfixed (0 downto 1 - data_width);
      x0_im : in sfixed (0 downto 1 - data_width);
    
    -- x1, input 1
      x1_re : in sfixed (0 downto 1 - data_width);
      x1_im : in sfixed (0 downto 1 - data_width);
    
    -- wk, twiddle factor
      wk_re : in sfixed (0 downto 1 - data_width);
      wk_im : in sfixed (0 downto 1 - data_width);
    
    -- y0, output 0
      y0_re : out sfixed(0 downto 1 - data_width);
      y0_im : out sfixed(0 downto 1 - data_width);
    
    -- y1, output 1
      y1_re : out sfixed(0 downto 1 - data_width);
      y1_im : out sfixed(0 downto 1 - data_width)

    );

  end bf;

-- Function Implementation 0
architecture FIMP_0 of bf is
  
  -- intermediate result siganls for x1 * wk
    signal x1_wk_re,  x1_wk_im  : sfixed(0 downto 1 - data_width);

  -- uncropped internal signals for y0 and y1
    signal y0_re_int, y0_im_int : sfixed(1 downto 1 - data_width);
    signal y1_re_int, y1_im_int : sfixed(1 downto 1 - data_width);

  -- complex multiplier
    component cmul is

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

      end component;

begin

  -- x1_wk = x1 * w
    cmul_0: cmul
      generic map (data_width)
      port map (x1_re, x1_im, wk_re, wk_im, x1_wk_re, x1_wk_im);

  -- y0 = x0 + x1 * w
    y0_re_int <= x0_re + x1_wk_re;
    y0_im_int <= x0_im + x1_wk_im;
    
  -- y1 = x0 - x1 * w
    y1_re_int <= x0_re - x1_wk_re;
    y1_im_int <= x0_im - x1_wk_im;

  -- crop outputs
    y0_re(0)                        <= y0_re_int(1);
    y0_re(-1 downto 1 - data_width) <= y0_re_int(-1 downto 1 - data_width);
    
    y0_im(0)                        <= y0_im_int(1);
    y0_im(-1 downto 1 - data_width) <= y0_im_int(-1 downto 1 - data_width);

    y1_re(0)                        <= y1_re_int(1);
    y1_re(-1 downto 1 - data_width) <= y1_re_int(-1 downto 1 - data_width);
    
    y1_im(0)                        <= y1_im_int(1);
    y1_im(-1 downto 1 - data_width) <= y1_im_int(-1 downto 1 - data_width);

end FIMP_0;
