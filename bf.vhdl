--
-- butterfly operation
--

library ieee;

use ieee.fixed_float_types.all;
use ieee.fixed_pkg.all;

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

architecture FIMP_0 of bf is
  
  -- intermediate result siganls for x1 * wk
    signal x1_wk_re,  x1_wk_im  : sfixed(0 downto 1 - data_width);

  -- uncropped internal signals for y0 and y1
    signal y0_re_int, y0_im_int : sfixed(1 downto 1 - data_width);
    signal y1_re_int, y1_im_int : sfixed(1 downto 1 - data_width);

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
