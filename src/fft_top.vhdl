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
-- N-point FFT control
----------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;

entity fft_top is

  generic (

    -- data width of the real and imaginary part
      data_width : integer := 16;

    -- points
      number_of_points : integer := 64;

    -- stages
    -- 2^nos = nop
      number_of_stages : integer := 6;

    -- number of bufferfly operators
      number_of_butterfly_operators : integer := 1

    );

  port (

    -- system clock
    clk : in std_logic;
    
    -- system reset
    nrst : in std_logic;

    -- all operations are done
    done :  out std_logic;

    -- initial data
    data_in_re : in std_logic_vector (number_of_points * data_width - 1 downto 0);
    data_in_im : in std_logic_vector (number_of_points * data_width - 1 downto 0);

    -- output data
    data_out_re : out std_logic_vector (number_of_points * data_width - 1 downto 0);
    data_out_im : out std_logic_vector (number_of_points * data_width - 1 downto 0)
   
    );

  end fft_top;

-- Function Implementation 0
architecture FIMP_0 of fft_top is

  -- signals between controller and butterfly operators
    signal x0_re : std_logic_vector (number_of_butterfly_operators * data_width - 1 downto 0);
    signal x0_im : std_logic_vector (number_of_butterfly_operators * data_width - 1 downto 0);
    signal x1_re : std_logic_vector (number_of_butterfly_operators * data_width - 1 downto 0);
    signal x1_im : std_logic_vector (number_of_butterfly_operators * data_width - 1 downto 0);
    
    signal y0_re : std_logic_vector (number_of_butterfly_operators * data_width - 1 downto 0);
    signal y0_im : std_logic_vector (number_of_butterfly_operators * data_width - 1 downto 0);
    signal y1_re : std_logic_vector (number_of_butterfly_operators * data_width - 1 downto 0);
    signal y1_im : std_logic_vector (number_of_butterfly_operators * data_width - 1 downto 0);

    signal wk_re : std_logic_vector (number_of_butterfly_operators * data_width - 1 downto 0);
    signal wk_im : std_logic_vector (number_of_butterfly_operators * data_width - 1 downto 0);

  -- twiddle factors
    signal wk_in_re : std_logic_vector (number_of_points/2 * data_width - 1 downto 0);
    signal wk_in_im : std_logic_vector (number_of_points/2 * data_width - 1 downto 0);
    
  component cbf_slv is

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

    end component;

  component radix_2_fft_control is

    generic (

      -- data width of the real and imaginary part
        data_width : integer := 16;

      -- points
        number_of_points : integer := 64;

      -- stages
      -- 2^nos = nop
        number_of_stages : integer := 6;

      -- number of bufferfly operators
        number_of_butterfly_operators : integer := 1

      );

    port (

      -- system clock
      clk : in std_logic;
      
      -- system reset
      nrst : in std_logic;

      -- all operations are done
      done :  out std_logic;

      -- x0 for butterfly operators
      x0_re : out std_logic_vector(number_of_butterfly_operators * data_width - 1 downto 0);
      x0_im : out std_logic_vector(number_of_butterfly_operators * data_width - 1 downto 0);

      -- x1 for butterfly operators
      x1_re : out std_logic_vector(number_of_butterfly_operators * data_width - 1 downto 0);
      x1_im : out std_logic_vector(number_of_butterfly_operators * data_width - 1 downto 0);

      -- twiddle factor for butterfly operators
      wk_re : out std_logic_vector(number_of_butterfly_operators * data_width - 1 downto 0);
      wk_im : out std_logic_vector(number_of_butterfly_operators * data_width - 1 downto 0);

      -- y0 for butterfly operators
      y0_re : in std_logic_vector(number_of_butterfly_operators * data_width - 1 downto 0);
      y0_im : in std_logic_vector(number_of_butterfly_operators * data_width - 1 downto 0);

      -- y1 for butterfly operators
      y1_re : in std_logic_vector(number_of_butterfly_operators * data_width - 1 downto 0);
      y1_im : in std_logic_vector(number_of_butterfly_operators * data_width - 1 downto 0);

      -- initial data
      data_in_re : in std_logic_vector (number_of_points * data_width - 1 downto 0);
      data_in_im : in std_logic_vector (number_of_points * data_width - 1 downto 0);

      -- output data
      data_out_re : out std_logic_vector (number_of_points * data_width - 1 downto 0);
      data_out_im : out std_logic_vector (number_of_points * data_width - 1 downto 0);

      -- twiddle factor
      wk_in_re : in std_logic_vector (number_of_points/2 * data_width - 1 downto 0);
      wk_in_im : in std_logic_vector (number_of_points/2 * data_width - 1 downto 0)
      
      );

    end component;

  component twiddle_factor is

    generic (

      -- data width of the real and imaginary part
        data_width : integer := 16

      );

    port (

      -- twiddle factor output
      wk_out_re : out std_logic_vector (64 / 2 * data_width - 1 downto 0);
      wk_out_im : out std_logic_vector (64 / 2 * data_width - 1 downto 0)

      );

    end component;

begin

  GEN_CBF: for i in 0 to number_of_butterfly_operators - 1 generate
    cbf_slv_0: cbf_slv
      generic map (data_width)
      port map ( clk, nrst,
                 x0_re( (i+1) * data_width - 1 downto i * data_width),
                 x0_im( (i+1) * data_width - 1 downto i * data_width),
                 x1_re( (i+1) * data_width - 1 downto i * data_width),
                 x1_im( (i+1) * data_width - 1 downto i * data_width),

                 wk_re( (i+1) * data_width - 1 downto i * data_width),
                 wk_im( (i+1) * data_width - 1 downto i * data_width),

                 y0_re( (i+1) * data_width - 1 downto i * data_width),
                 y0_im( (i+1) * data_width - 1 downto i * data_width),
                 y1_re( (i+1) * data_width - 1 downto i * data_width),
                 y1_im( (i+1) * data_width - 1 downto i * data_width));
    end generate GEN_CBF;

  radix_2_fft_control_0: radix_2_fft_control
    generic map(data_width, number_of_points, number_of_stages, number_of_butterfly_operators)
    port map( clk, nrst, done, 
              x0_re, x0_im, 
              x1_re, x1_im, 
              wk_re, wk_im, 
              y0_re, y0_im, 
              y1_re, y1_im, 
              data_in_re, data_in_im,
              data_out_re, data_out_im,
              wk_in_re, wk_in_im);

  twiddle_factor_0: twiddle_factor
    generic map (data_width)
    port map(wk_in_re, wk_in_im);

end FIMP_0;
