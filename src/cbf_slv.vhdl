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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;

entity cbf_slv is

  generic (

    -- data width of the real and imaginary part
      data_width : integer range 0 to 128 := 16

    );

  port (
    -- clock
      clk   : in std_logic;
      nrst  : in std_logic;

    -- x0, input 0
      x0_re : in std_logic_vector (data_width - 1 downto 0);
      x0_im : in std_logic_vector (data_width - 1 downto 0);
    
    -- x1, input 1
      x1_re : in std_logic_vector (data_width - 1 downto 0);
      x1_im : in std_logic_vector (data_width - 1 downto 0);
    
    -- wk, twiddle factor
      wk_re : in std_logic_vector (data_width - 1 downto 0);
      wk_im : in std_logic_vector (data_width - 1 downto 0);
    
    -- y0, output 0
      y0_re : out std_logic_vector (data_width - 1 downto 0);
      y0_im : out std_logic_vector (data_width - 1 downto 0);
    
    -- y1, output 1
      y1_re : out std_logic_vector (data_width - 1 downto 0);
      y1_im : out std_logic_vector (data_width - 1 downto 0)

    );

  end cbf_slv;

-- Function Implementation 0
architecture FIMP_0 of cbf_slv is


  component cbf is

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

    end component;

  -- internal signals for x
    signal x0_re_int : sfixed (0 downto 1 - data_width);
    signal x0_im_int : sfixed (0 downto 1 - data_width);
    signal x1_re_int : sfixed (0 downto 1 - data_width);
    signal x1_im_int : sfixed (0 downto 1 - data_width);
  
  -- internal signals for twiddle factor
    signal wk_re_int : sfixed (0 downto 1 - data_width);
    signal wk_im_int : sfixed (0 downto 1 - data_width);
  
  -- internal signals for output 
    signal y0_re_int : sfixed (0 downto 1 - data_width);
    signal y0_im_int : sfixed (0 downto 1 - data_width);
    signal y1_re_int : sfixed (0 downto 1 - data_width);
    signal y1_im_int : sfixed (0 downto 1 - data_width);

begin

  -- convert input std_logic_vector to signed fixed point
    x0_re_int <= to_sfixed(x0_re, 0, 1 - data_width);
    x0_im_int <= to_sfixed(x0_im, 0, 1 - data_width);
    x1_re_int <= to_sfixed(x1_re, 0, 1 - data_width);
    x1_im_int <= to_sfixed(x1_im, 0, 1 - data_width);
    wk_re_int <= to_sfixed(wk_re, 0, 1 - data_width);
    wk_im_int <= to_sfixed(wk_im, 0, 1 - data_width);

  -- convert output signed fixed point to std_logic_vector
    y0_re <= to_slv(y0_re_int);
    y0_im <= to_slv(y0_im_int);
    y1_re <= to_slv(y1_re_int);
    y1_im <= to_slv(y1_im_int);

  cbf_0: cbf
    generic map (data_width)
    port map(clk, nrst,
      x0_re_int, x0_im_int,
      x1_re_int, x1_im_int,

      wk_re_int, wk_im_int,

      y0_re_int, y0_im_int,
      y1_re_int, y1_im_int);

end FIMP_0;
