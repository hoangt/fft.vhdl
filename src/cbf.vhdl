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
-- clocked butterfly operation
----------------------

-- Description
  -- This design unit `cbf` is for performing clocked butterfly operation on complex
  -- fixed point numbers with configurable data width. The value of the inputs are
  -- limited to (+1, -1]. MSB is sign bit and the rest bits are all decimal part.

library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;

library ieee;
use ieee.std_logic_1164.all;

entity cbf is

  generic (

    -- data width of the real and imaginary part
      data_width : integer range 0 to 128 := 16

    );

  port (
    -- clock
      clk   : in std_logic;
      nrst  : in std_logic;

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

  end cbf;

-- Function Implementation 0
architecture FIMP_0 of cbf is

  -- internal signals for x
    signal x0_re_int : sfixed (0 downto 1 - data_width);
    signal x0_im_int : sfixed (0 downto 1 - data_width);
    signal x1_re_int : sfixed (0 downto 1 - data_width);
    signal x1_im_int : sfixed (0 downto 1 - data_width);
  
  -- internal signals for twiddle factor
    signal wk_re_int : sfixed (0 downto 1 - data_width);
    signal wk_im_int : sfixed (0 downto 1 - data_width);  
 
  -- combinatorial butterfly operation
    component bf is

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

      end component;
    
begin

-- registered inputs
  process(clk, nrst)
  begin

    if (nrst = '0') then

      x0_re_int <= (others => '0');
      x0_im_int <= (others => '0');
      x1_re_int <= (others => '0');
      x1_im_int <= (others => '0');

      wk_re_int <= (others => '0');
      wk_im_int <= (others => '0');

    elsif (clk'event and clk = '1') then
      
      x0_re_int <= x0_re;
      x0_im_int <= x0_im;
      x1_re_int <= x1_re;
      x1_im_int <= x1_im;

      wk_re_int <= wk_re;
      wk_im_int <= wk_im;

    end if;

  end process;

-- connect the combinatorial butterfly operation
  bf_0: bf
    generic map (data_width)
    port map (x0_re_int, x0_im_int, x1_re_int, x1_im_int,
              wk_re_int, wk_im_int,
              y0_re, y0_im, y1_re, y1_im);

end FIMP_0;
