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
-- 256-point FFT
---------------------

-- Description
  -- This is an automatically generated twiddle factor file for 256 points FFT


library ieee;
use ieee.std_logic_1164.all;

library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;

entity twiddle_factor is

  generic (

    -- data width of the real and imaginary part
      data_width : integer := 16

    );

  port (

    -- twiddle factor output
    wk_out_re : out std_logic_vector (256 / 2 * data_width - 1 downto 0);
    wk_out_im : out std_logic_vector (256 / 2 * data_width - 1 downto 0)

    );

  end twiddle_factor;

-- Function Implementation 0
architecture FIMP_0 of twiddle_factor is
  
begin
  -- twiddle factor values
  
    wk_out_re( (0 + 1) * data_width - 1 
               downto 
               0 * data_width
             ) <= to_slv(to_sfixed(1.0, 0, 1- data_width));

    wk_out_im( (0 + 1) * data_width - 1 
               downto 
               0 * data_width
             ) <= to_slv(to_sfixed(0.0, 0, 1- data_width));
  
    wk_out_re( (1 + 1) * data_width - 1 
               downto 
               1 * data_width
             ) <= to_slv(to_sfixed(0.999698818696, 0, 1- data_width));

    wk_out_im( (1 + 1) * data_width - 1 
               downto 
               1 * data_width
             ) <= to_slv(to_sfixed(-0.0245412285229, 0, 1- data_width));
  
    wk_out_re( (2 + 1) * data_width - 1 
               downto 
               2 * data_width
             ) <= to_slv(to_sfixed(0.998795456205, 0, 1- data_width));

    wk_out_im( (2 + 1) * data_width - 1 
               downto 
               2 * data_width
             ) <= to_slv(to_sfixed(-0.0490676743274, 0, 1- data_width));
  
    wk_out_re( (3 + 1) * data_width - 1 
               downto 
               3 * data_width
             ) <= to_slv(to_sfixed(0.997290456679, 0, 1- data_width));

    wk_out_im( (3 + 1) * data_width - 1 
               downto 
               3 * data_width
             ) <= to_slv(to_sfixed(-0.0735645635997, 0, 1- data_width));
  
    wk_out_re( (4 + 1) * data_width - 1 
               downto 
               4 * data_width
             ) <= to_slv(to_sfixed(0.995184726672, 0, 1- data_width));

    wk_out_im( (4 + 1) * data_width - 1 
               downto 
               4 * data_width
             ) <= to_slv(to_sfixed(-0.0980171403296, 0, 1- data_width));
  
    wk_out_re( (5 + 1) * data_width - 1 
               downto 
               5 * data_width
             ) <= to_slv(to_sfixed(0.992479534599, 0, 1- data_width));

    wk_out_im( (5 + 1) * data_width - 1 
               downto 
               5 * data_width
             ) <= to_slv(to_sfixed(-0.122410675199, 0, 1- data_width));
  
    wk_out_re( (6 + 1) * data_width - 1 
               downto 
               6 * data_width
             ) <= to_slv(to_sfixed(0.989176509965, 0, 1- data_width));

    wk_out_im( (6 + 1) * data_width - 1 
               downto 
               6 * data_width
             ) <= to_slv(to_sfixed(-0.146730474455, 0, 1- data_width));
  
    wk_out_re( (7 + 1) * data_width - 1 
               downto 
               7 * data_width
             ) <= to_slv(to_sfixed(0.985277642389, 0, 1- data_width));

    wk_out_im( (7 + 1) * data_width - 1 
               downto 
               7 * data_width
             ) <= to_slv(to_sfixed(-0.17096188876, 0, 1- data_width));
  
    wk_out_re( (8 + 1) * data_width - 1 
               downto 
               8 * data_width
             ) <= to_slv(to_sfixed(0.980785280403, 0, 1- data_width));

    wk_out_im( (8 + 1) * data_width - 1 
               downto 
               8 * data_width
             ) <= to_slv(to_sfixed(-0.195090322016, 0, 1- data_width));
  
    wk_out_re( (9 + 1) * data_width - 1 
               downto 
               9 * data_width
             ) <= to_slv(to_sfixed(0.975702130039, 0, 1- data_width));

    wk_out_im( (9 + 1) * data_width - 1 
               downto 
               9 * data_width
             ) <= to_slv(to_sfixed(-0.219101240157, 0, 1- data_width));
  
    wk_out_re( (10 + 1) * data_width - 1 
               downto 
               10 * data_width
             ) <= to_slv(to_sfixed(0.970031253195, 0, 1- data_width));

    wk_out_im( (10 + 1) * data_width - 1 
               downto 
               10 * data_width
             ) <= to_slv(to_sfixed(-0.242980179903, 0, 1- data_width));
  
    wk_out_re( (11 + 1) * data_width - 1 
               downto 
               11 * data_width
             ) <= to_slv(to_sfixed(0.963776065795, 0, 1- data_width));

    wk_out_im( (11 + 1) * data_width - 1 
               downto 
               11 * data_width
             ) <= to_slv(to_sfixed(-0.266712757475, 0, 1- data_width));
  
    wk_out_re( (12 + 1) * data_width - 1 
               downto 
               12 * data_width
             ) <= to_slv(to_sfixed(0.956940335732, 0, 1- data_width));

    wk_out_im( (12 + 1) * data_width - 1 
               downto 
               12 * data_width
             ) <= to_slv(to_sfixed(-0.290284677254, 0, 1- data_width));
  
    wk_out_re( (13 + 1) * data_width - 1 
               downto 
               13 * data_width
             ) <= to_slv(to_sfixed(0.949528180593, 0, 1- data_width));

    wk_out_im( (13 + 1) * data_width - 1 
               downto 
               13 * data_width
             ) <= to_slv(to_sfixed(-0.313681740399, 0, 1- data_width));
  
    wk_out_re( (14 + 1) * data_width - 1 
               downto 
               14 * data_width
             ) <= to_slv(to_sfixed(0.941544065183, 0, 1- data_width));

    wk_out_im( (14 + 1) * data_width - 1 
               downto 
               14 * data_width
             ) <= to_slv(to_sfixed(-0.336889853392, 0, 1- data_width));
  
    wk_out_re( (15 + 1) * data_width - 1 
               downto 
               15 * data_width
             ) <= to_slv(to_sfixed(0.932992798835, 0, 1- data_width));

    wk_out_im( (15 + 1) * data_width - 1 
               downto 
               15 * data_width
             ) <= to_slv(to_sfixed(-0.359895036535, 0, 1- data_width));
  
    wk_out_re( (16 + 1) * data_width - 1 
               downto 
               16 * data_width
             ) <= to_slv(to_sfixed(0.923879532511, 0, 1- data_width));

    wk_out_im( (16 + 1) * data_width - 1 
               downto 
               16 * data_width
             ) <= to_slv(to_sfixed(-0.382683432365, 0, 1- data_width));
  
    wk_out_re( (17 + 1) * data_width - 1 
               downto 
               17 * data_width
             ) <= to_slv(to_sfixed(0.914209755704, 0, 1- data_width));

    wk_out_im( (17 + 1) * data_width - 1 
               downto 
               17 * data_width
             ) <= to_slv(to_sfixed(-0.405241314005, 0, 1- data_width));
  
    wk_out_re( (18 + 1) * data_width - 1 
               downto 
               18 * data_width
             ) <= to_slv(to_sfixed(0.903989293123, 0, 1- data_width));

    wk_out_im( (18 + 1) * data_width - 1 
               downto 
               18 * data_width
             ) <= to_slv(to_sfixed(-0.42755509343, 0, 1- data_width));
  
    wk_out_re( (19 + 1) * data_width - 1 
               downto 
               19 * data_width
             ) <= to_slv(to_sfixed(0.893224301196, 0, 1- data_width));

    wk_out_im( (19 + 1) * data_width - 1 
               downto 
               19 * data_width
             ) <= to_slv(to_sfixed(-0.449611329655, 0, 1- data_width));
  
    wk_out_re( (20 + 1) * data_width - 1 
               downto 
               20 * data_width
             ) <= to_slv(to_sfixed(0.881921264348, 0, 1- data_width));

    wk_out_im( (20 + 1) * data_width - 1 
               downto 
               20 * data_width
             ) <= to_slv(to_sfixed(-0.471396736826, 0, 1- data_width));
  
    wk_out_re( (21 + 1) * data_width - 1 
               downto 
               21 * data_width
             ) <= to_slv(to_sfixed(0.870086991109, 0, 1- data_width));

    wk_out_im( (21 + 1) * data_width - 1 
               downto 
               21 * data_width
             ) <= to_slv(to_sfixed(-0.49289819223, 0, 1- data_width));
  
    wk_out_re( (22 + 1) * data_width - 1 
               downto 
               22 * data_width
             ) <= to_slv(to_sfixed(0.85772861, 0, 1- data_width));

    wk_out_im( (22 + 1) * data_width - 1 
               downto 
               22 * data_width
             ) <= to_slv(to_sfixed(-0.514102744193, 0, 1- data_width));
  
    wk_out_re( (23 + 1) * data_width - 1 
               downto 
               23 * data_width
             ) <= to_slv(to_sfixed(0.84485356525, 0, 1- data_width));

    wk_out_im( (23 + 1) * data_width - 1 
               downto 
               23 * data_width
             ) <= to_slv(to_sfixed(-0.534997619887, 0, 1- data_width));
  
    wk_out_re( (24 + 1) * data_width - 1 
               downto 
               24 * data_width
             ) <= to_slv(to_sfixed(0.831469612303, 0, 1- data_width));

    wk_out_im( (24 + 1) * data_width - 1 
               downto 
               24 * data_width
             ) <= to_slv(to_sfixed(-0.55557023302, 0, 1- data_width));
  
    wk_out_re( (25 + 1) * data_width - 1 
               downto 
               25 * data_width
             ) <= to_slv(to_sfixed(0.817584813152, 0, 1- data_width));

    wk_out_im( (25 + 1) * data_width - 1 
               downto 
               25 * data_width
             ) <= to_slv(to_sfixed(-0.575808191418, 0, 1- data_width));
  
    wk_out_re( (26 + 1) * data_width - 1 
               downto 
               26 * data_width
             ) <= to_slv(to_sfixed(0.803207531481, 0, 1- data_width));

    wk_out_im( (26 + 1) * data_width - 1 
               downto 
               26 * data_width
             ) <= to_slv(to_sfixed(-0.595699304492, 0, 1- data_width));
  
    wk_out_re( (27 + 1) * data_width - 1 
               downto 
               27 * data_width
             ) <= to_slv(to_sfixed(0.788346427627, 0, 1- data_width));

    wk_out_im( (27 + 1) * data_width - 1 
               downto 
               27 * data_width
             ) <= to_slv(to_sfixed(-0.615231590581, 0, 1- data_width));
  
    wk_out_re( (28 + 1) * data_width - 1 
               downto 
               28 * data_width
             ) <= to_slv(to_sfixed(0.773010453363, 0, 1- data_width));

    wk_out_im( (28 + 1) * data_width - 1 
               downto 
               28 * data_width
             ) <= to_slv(to_sfixed(-0.634393284164, 0, 1- data_width));
  
    wk_out_re( (29 + 1) * data_width - 1 
               downto 
               29 * data_width
             ) <= to_slv(to_sfixed(0.757208846506, 0, 1- data_width));

    wk_out_im( (29 + 1) * data_width - 1 
               downto 
               29 * data_width
             ) <= to_slv(to_sfixed(-0.653172842954, 0, 1- data_width));
  
    wk_out_re( (30 + 1) * data_width - 1 
               downto 
               30 * data_width
             ) <= to_slv(to_sfixed(0.740951125355, 0, 1- data_width));

    wk_out_im( (30 + 1) * data_width - 1 
               downto 
               30 * data_width
             ) <= to_slv(to_sfixed(-0.671558954847, 0, 1- data_width));
  
    wk_out_re( (31 + 1) * data_width - 1 
               downto 
               31 * data_width
             ) <= to_slv(to_sfixed(0.724247082951, 0, 1- data_width));

    wk_out_im( (31 + 1) * data_width - 1 
               downto 
               31 * data_width
             ) <= to_slv(to_sfixed(-0.689540544737, 0, 1- data_width));
  
    wk_out_re( (32 + 1) * data_width - 1 
               downto 
               32 * data_width
             ) <= to_slv(to_sfixed(0.707106781187, 0, 1- data_width));

    wk_out_im( (32 + 1) * data_width - 1 
               downto 
               32 * data_width
             ) <= to_slv(to_sfixed(-0.707106781187, 0, 1- data_width));
  
    wk_out_re( (33 + 1) * data_width - 1 
               downto 
               33 * data_width
             ) <= to_slv(to_sfixed(0.689540544737, 0, 1- data_width));

    wk_out_im( (33 + 1) * data_width - 1 
               downto 
               33 * data_width
             ) <= to_slv(to_sfixed(-0.724247082951, 0, 1- data_width));
  
    wk_out_re( (34 + 1) * data_width - 1 
               downto 
               34 * data_width
             ) <= to_slv(to_sfixed(0.671558954847, 0, 1- data_width));

    wk_out_im( (34 + 1) * data_width - 1 
               downto 
               34 * data_width
             ) <= to_slv(to_sfixed(-0.740951125355, 0, 1- data_width));
  
    wk_out_re( (35 + 1) * data_width - 1 
               downto 
               35 * data_width
             ) <= to_slv(to_sfixed(0.653172842954, 0, 1- data_width));

    wk_out_im( (35 + 1) * data_width - 1 
               downto 
               35 * data_width
             ) <= to_slv(to_sfixed(-0.757208846506, 0, 1- data_width));
  
    wk_out_re( (36 + 1) * data_width - 1 
               downto 
               36 * data_width
             ) <= to_slv(to_sfixed(0.634393284164, 0, 1- data_width));

    wk_out_im( (36 + 1) * data_width - 1 
               downto 
               36 * data_width
             ) <= to_slv(to_sfixed(-0.773010453363, 0, 1- data_width));
  
    wk_out_re( (37 + 1) * data_width - 1 
               downto 
               37 * data_width
             ) <= to_slv(to_sfixed(0.615231590581, 0, 1- data_width));

    wk_out_im( (37 + 1) * data_width - 1 
               downto 
               37 * data_width
             ) <= to_slv(to_sfixed(-0.788346427627, 0, 1- data_width));
  
    wk_out_re( (38 + 1) * data_width - 1 
               downto 
               38 * data_width
             ) <= to_slv(to_sfixed(0.595699304492, 0, 1- data_width));

    wk_out_im( (38 + 1) * data_width - 1 
               downto 
               38 * data_width
             ) <= to_slv(to_sfixed(-0.803207531481, 0, 1- data_width));
  
    wk_out_re( (39 + 1) * data_width - 1 
               downto 
               39 * data_width
             ) <= to_slv(to_sfixed(0.575808191418, 0, 1- data_width));

    wk_out_im( (39 + 1) * data_width - 1 
               downto 
               39 * data_width
             ) <= to_slv(to_sfixed(-0.817584813152, 0, 1- data_width));
  
    wk_out_re( (40 + 1) * data_width - 1 
               downto 
               40 * data_width
             ) <= to_slv(to_sfixed(0.55557023302, 0, 1- data_width));

    wk_out_im( (40 + 1) * data_width - 1 
               downto 
               40 * data_width
             ) <= to_slv(to_sfixed(-0.831469612303, 0, 1- data_width));
  
    wk_out_re( (41 + 1) * data_width - 1 
               downto 
               41 * data_width
             ) <= to_slv(to_sfixed(0.534997619887, 0, 1- data_width));

    wk_out_im( (41 + 1) * data_width - 1 
               downto 
               41 * data_width
             ) <= to_slv(to_sfixed(-0.84485356525, 0, 1- data_width));
  
    wk_out_re( (42 + 1) * data_width - 1 
               downto 
               42 * data_width
             ) <= to_slv(to_sfixed(0.514102744193, 0, 1- data_width));

    wk_out_im( (42 + 1) * data_width - 1 
               downto 
               42 * data_width
             ) <= to_slv(to_sfixed(-0.85772861, 0, 1- data_width));
  
    wk_out_re( (43 + 1) * data_width - 1 
               downto 
               43 * data_width
             ) <= to_slv(to_sfixed(0.49289819223, 0, 1- data_width));

    wk_out_im( (43 + 1) * data_width - 1 
               downto 
               43 * data_width
             ) <= to_slv(to_sfixed(-0.870086991109, 0, 1- data_width));
  
    wk_out_re( (44 + 1) * data_width - 1 
               downto 
               44 * data_width
             ) <= to_slv(to_sfixed(0.471396736826, 0, 1- data_width));

    wk_out_im( (44 + 1) * data_width - 1 
               downto 
               44 * data_width
             ) <= to_slv(to_sfixed(-0.881921264348, 0, 1- data_width));
  
    wk_out_re( (45 + 1) * data_width - 1 
               downto 
               45 * data_width
             ) <= to_slv(to_sfixed(0.449611329655, 0, 1- data_width));

    wk_out_im( (45 + 1) * data_width - 1 
               downto 
               45 * data_width
             ) <= to_slv(to_sfixed(-0.893224301196, 0, 1- data_width));
  
    wk_out_re( (46 + 1) * data_width - 1 
               downto 
               46 * data_width
             ) <= to_slv(to_sfixed(0.42755509343, 0, 1- data_width));

    wk_out_im( (46 + 1) * data_width - 1 
               downto 
               46 * data_width
             ) <= to_slv(to_sfixed(-0.903989293123, 0, 1- data_width));
  
    wk_out_re( (47 + 1) * data_width - 1 
               downto 
               47 * data_width
             ) <= to_slv(to_sfixed(0.405241314005, 0, 1- data_width));

    wk_out_im( (47 + 1) * data_width - 1 
               downto 
               47 * data_width
             ) <= to_slv(to_sfixed(-0.914209755704, 0, 1- data_width));
  
    wk_out_re( (48 + 1) * data_width - 1 
               downto 
               48 * data_width
             ) <= to_slv(to_sfixed(0.382683432365, 0, 1- data_width));

    wk_out_im( (48 + 1) * data_width - 1 
               downto 
               48 * data_width
             ) <= to_slv(to_sfixed(-0.923879532511, 0, 1- data_width));
  
    wk_out_re( (49 + 1) * data_width - 1 
               downto 
               49 * data_width
             ) <= to_slv(to_sfixed(0.359895036535, 0, 1- data_width));

    wk_out_im( (49 + 1) * data_width - 1 
               downto 
               49 * data_width
             ) <= to_slv(to_sfixed(-0.932992798835, 0, 1- data_width));
  
    wk_out_re( (50 + 1) * data_width - 1 
               downto 
               50 * data_width
             ) <= to_slv(to_sfixed(0.336889853392, 0, 1- data_width));

    wk_out_im( (50 + 1) * data_width - 1 
               downto 
               50 * data_width
             ) <= to_slv(to_sfixed(-0.941544065183, 0, 1- data_width));
  
    wk_out_re( (51 + 1) * data_width - 1 
               downto 
               51 * data_width
             ) <= to_slv(to_sfixed(0.313681740399, 0, 1- data_width));

    wk_out_im( (51 + 1) * data_width - 1 
               downto 
               51 * data_width
             ) <= to_slv(to_sfixed(-0.949528180593, 0, 1- data_width));
  
    wk_out_re( (52 + 1) * data_width - 1 
               downto 
               52 * data_width
             ) <= to_slv(to_sfixed(0.290284677254, 0, 1- data_width));

    wk_out_im( (52 + 1) * data_width - 1 
               downto 
               52 * data_width
             ) <= to_slv(to_sfixed(-0.956940335732, 0, 1- data_width));
  
    wk_out_re( (53 + 1) * data_width - 1 
               downto 
               53 * data_width
             ) <= to_slv(to_sfixed(0.266712757475, 0, 1- data_width));

    wk_out_im( (53 + 1) * data_width - 1 
               downto 
               53 * data_width
             ) <= to_slv(to_sfixed(-0.963776065795, 0, 1- data_width));
  
    wk_out_re( (54 + 1) * data_width - 1 
               downto 
               54 * data_width
             ) <= to_slv(to_sfixed(0.242980179903, 0, 1- data_width));

    wk_out_im( (54 + 1) * data_width - 1 
               downto 
               54 * data_width
             ) <= to_slv(to_sfixed(-0.970031253195, 0, 1- data_width));
  
    wk_out_re( (55 + 1) * data_width - 1 
               downto 
               55 * data_width
             ) <= to_slv(to_sfixed(0.219101240157, 0, 1- data_width));

    wk_out_im( (55 + 1) * data_width - 1 
               downto 
               55 * data_width
             ) <= to_slv(to_sfixed(-0.975702130039, 0, 1- data_width));
  
    wk_out_re( (56 + 1) * data_width - 1 
               downto 
               56 * data_width
             ) <= to_slv(to_sfixed(0.195090322016, 0, 1- data_width));

    wk_out_im( (56 + 1) * data_width - 1 
               downto 
               56 * data_width
             ) <= to_slv(to_sfixed(-0.980785280403, 0, 1- data_width));
  
    wk_out_re( (57 + 1) * data_width - 1 
               downto 
               57 * data_width
             ) <= to_slv(to_sfixed(0.17096188876, 0, 1- data_width));

    wk_out_im( (57 + 1) * data_width - 1 
               downto 
               57 * data_width
             ) <= to_slv(to_sfixed(-0.985277642389, 0, 1- data_width));
  
    wk_out_re( (58 + 1) * data_width - 1 
               downto 
               58 * data_width
             ) <= to_slv(to_sfixed(0.146730474455, 0, 1- data_width));

    wk_out_im( (58 + 1) * data_width - 1 
               downto 
               58 * data_width
             ) <= to_slv(to_sfixed(-0.989176509965, 0, 1- data_width));
  
    wk_out_re( (59 + 1) * data_width - 1 
               downto 
               59 * data_width
             ) <= to_slv(to_sfixed(0.122410675199, 0, 1- data_width));

    wk_out_im( (59 + 1) * data_width - 1 
               downto 
               59 * data_width
             ) <= to_slv(to_sfixed(-0.992479534599, 0, 1- data_width));
  
    wk_out_re( (60 + 1) * data_width - 1 
               downto 
               60 * data_width
             ) <= to_slv(to_sfixed(0.0980171403296, 0, 1- data_width));

    wk_out_im( (60 + 1) * data_width - 1 
               downto 
               60 * data_width
             ) <= to_slv(to_sfixed(-0.995184726672, 0, 1- data_width));
  
    wk_out_re( (61 + 1) * data_width - 1 
               downto 
               61 * data_width
             ) <= to_slv(to_sfixed(0.0735645635997, 0, 1- data_width));

    wk_out_im( (61 + 1) * data_width - 1 
               downto 
               61 * data_width
             ) <= to_slv(to_sfixed(-0.997290456679, 0, 1- data_width));
  
    wk_out_re( (62 + 1) * data_width - 1 
               downto 
               62 * data_width
             ) <= to_slv(to_sfixed(0.0490676743274, 0, 1- data_width));

    wk_out_im( (62 + 1) * data_width - 1 
               downto 
               62 * data_width
             ) <= to_slv(to_sfixed(-0.998795456205, 0, 1- data_width));
  
    wk_out_re( (63 + 1) * data_width - 1 
               downto 
               63 * data_width
             ) <= to_slv(to_sfixed(0.0245412285229, 0, 1- data_width));

    wk_out_im( (63 + 1) * data_width - 1 
               downto 
               63 * data_width
             ) <= to_slv(to_sfixed(-0.999698818696, 0, 1- data_width));
  
    wk_out_re( (64 + 1) * data_width - 1 
               downto 
               64 * data_width
             ) <= to_slv(to_sfixed(6.12323399574e-17, 0, 1- data_width));

    wk_out_im( (64 + 1) * data_width - 1 
               downto 
               64 * data_width
             ) <= to_slv(to_sfixed(-1.0, 0, 1- data_width));
  
    wk_out_re( (65 + 1) * data_width - 1 
               downto 
               65 * data_width
             ) <= to_slv(to_sfixed(-0.0245412285229, 0, 1- data_width));

    wk_out_im( (65 + 1) * data_width - 1 
               downto 
               65 * data_width
             ) <= to_slv(to_sfixed(-0.999698818696, 0, 1- data_width));
  
    wk_out_re( (66 + 1) * data_width - 1 
               downto 
               66 * data_width
             ) <= to_slv(to_sfixed(-0.0490676743274, 0, 1- data_width));

    wk_out_im( (66 + 1) * data_width - 1 
               downto 
               66 * data_width
             ) <= to_slv(to_sfixed(-0.998795456205, 0, 1- data_width));
  
    wk_out_re( (67 + 1) * data_width - 1 
               downto 
               67 * data_width
             ) <= to_slv(to_sfixed(-0.0735645635997, 0, 1- data_width));

    wk_out_im( (67 + 1) * data_width - 1 
               downto 
               67 * data_width
             ) <= to_slv(to_sfixed(-0.997290456679, 0, 1- data_width));
  
    wk_out_re( (68 + 1) * data_width - 1 
               downto 
               68 * data_width
             ) <= to_slv(to_sfixed(-0.0980171403296, 0, 1- data_width));

    wk_out_im( (68 + 1) * data_width - 1 
               downto 
               68 * data_width
             ) <= to_slv(to_sfixed(-0.995184726672, 0, 1- data_width));
  
    wk_out_re( (69 + 1) * data_width - 1 
               downto 
               69 * data_width
             ) <= to_slv(to_sfixed(-0.122410675199, 0, 1- data_width));

    wk_out_im( (69 + 1) * data_width - 1 
               downto 
               69 * data_width
             ) <= to_slv(to_sfixed(-0.992479534599, 0, 1- data_width));
  
    wk_out_re( (70 + 1) * data_width - 1 
               downto 
               70 * data_width
             ) <= to_slv(to_sfixed(-0.146730474455, 0, 1- data_width));

    wk_out_im( (70 + 1) * data_width - 1 
               downto 
               70 * data_width
             ) <= to_slv(to_sfixed(-0.989176509965, 0, 1- data_width));
  
    wk_out_re( (71 + 1) * data_width - 1 
               downto 
               71 * data_width
             ) <= to_slv(to_sfixed(-0.17096188876, 0, 1- data_width));

    wk_out_im( (71 + 1) * data_width - 1 
               downto 
               71 * data_width
             ) <= to_slv(to_sfixed(-0.985277642389, 0, 1- data_width));
  
    wk_out_re( (72 + 1) * data_width - 1 
               downto 
               72 * data_width
             ) <= to_slv(to_sfixed(-0.195090322016, 0, 1- data_width));

    wk_out_im( (72 + 1) * data_width - 1 
               downto 
               72 * data_width
             ) <= to_slv(to_sfixed(-0.980785280403, 0, 1- data_width));
  
    wk_out_re( (73 + 1) * data_width - 1 
               downto 
               73 * data_width
             ) <= to_slv(to_sfixed(-0.219101240157, 0, 1- data_width));

    wk_out_im( (73 + 1) * data_width - 1 
               downto 
               73 * data_width
             ) <= to_slv(to_sfixed(-0.975702130039, 0, 1- data_width));
  
    wk_out_re( (74 + 1) * data_width - 1 
               downto 
               74 * data_width
             ) <= to_slv(to_sfixed(-0.242980179903, 0, 1- data_width));

    wk_out_im( (74 + 1) * data_width - 1 
               downto 
               74 * data_width
             ) <= to_slv(to_sfixed(-0.970031253195, 0, 1- data_width));
  
    wk_out_re( (75 + 1) * data_width - 1 
               downto 
               75 * data_width
             ) <= to_slv(to_sfixed(-0.266712757475, 0, 1- data_width));

    wk_out_im( (75 + 1) * data_width - 1 
               downto 
               75 * data_width
             ) <= to_slv(to_sfixed(-0.963776065795, 0, 1- data_width));
  
    wk_out_re( (76 + 1) * data_width - 1 
               downto 
               76 * data_width
             ) <= to_slv(to_sfixed(-0.290284677254, 0, 1- data_width));

    wk_out_im( (76 + 1) * data_width - 1 
               downto 
               76 * data_width
             ) <= to_slv(to_sfixed(-0.956940335732, 0, 1- data_width));
  
    wk_out_re( (77 + 1) * data_width - 1 
               downto 
               77 * data_width
             ) <= to_slv(to_sfixed(-0.313681740399, 0, 1- data_width));

    wk_out_im( (77 + 1) * data_width - 1 
               downto 
               77 * data_width
             ) <= to_slv(to_sfixed(-0.949528180593, 0, 1- data_width));
  
    wk_out_re( (78 + 1) * data_width - 1 
               downto 
               78 * data_width
             ) <= to_slv(to_sfixed(-0.336889853392, 0, 1- data_width));

    wk_out_im( (78 + 1) * data_width - 1 
               downto 
               78 * data_width
             ) <= to_slv(to_sfixed(-0.941544065183, 0, 1- data_width));
  
    wk_out_re( (79 + 1) * data_width - 1 
               downto 
               79 * data_width
             ) <= to_slv(to_sfixed(-0.359895036535, 0, 1- data_width));

    wk_out_im( (79 + 1) * data_width - 1 
               downto 
               79 * data_width
             ) <= to_slv(to_sfixed(-0.932992798835, 0, 1- data_width));
  
    wk_out_re( (80 + 1) * data_width - 1 
               downto 
               80 * data_width
             ) <= to_slv(to_sfixed(-0.382683432365, 0, 1- data_width));

    wk_out_im( (80 + 1) * data_width - 1 
               downto 
               80 * data_width
             ) <= to_slv(to_sfixed(-0.923879532511, 0, 1- data_width));
  
    wk_out_re( (81 + 1) * data_width - 1 
               downto 
               81 * data_width
             ) <= to_slv(to_sfixed(-0.405241314005, 0, 1- data_width));

    wk_out_im( (81 + 1) * data_width - 1 
               downto 
               81 * data_width
             ) <= to_slv(to_sfixed(-0.914209755704, 0, 1- data_width));
  
    wk_out_re( (82 + 1) * data_width - 1 
               downto 
               82 * data_width
             ) <= to_slv(to_sfixed(-0.42755509343, 0, 1- data_width));

    wk_out_im( (82 + 1) * data_width - 1 
               downto 
               82 * data_width
             ) <= to_slv(to_sfixed(-0.903989293123, 0, 1- data_width));
  
    wk_out_re( (83 + 1) * data_width - 1 
               downto 
               83 * data_width
             ) <= to_slv(to_sfixed(-0.449611329655, 0, 1- data_width));

    wk_out_im( (83 + 1) * data_width - 1 
               downto 
               83 * data_width
             ) <= to_slv(to_sfixed(-0.893224301196, 0, 1- data_width));
  
    wk_out_re( (84 + 1) * data_width - 1 
               downto 
               84 * data_width
             ) <= to_slv(to_sfixed(-0.471396736826, 0, 1- data_width));

    wk_out_im( (84 + 1) * data_width - 1 
               downto 
               84 * data_width
             ) <= to_slv(to_sfixed(-0.881921264348, 0, 1- data_width));
  
    wk_out_re( (85 + 1) * data_width - 1 
               downto 
               85 * data_width
             ) <= to_slv(to_sfixed(-0.49289819223, 0, 1- data_width));

    wk_out_im( (85 + 1) * data_width - 1 
               downto 
               85 * data_width
             ) <= to_slv(to_sfixed(-0.870086991109, 0, 1- data_width));
  
    wk_out_re( (86 + 1) * data_width - 1 
               downto 
               86 * data_width
             ) <= to_slv(to_sfixed(-0.514102744193, 0, 1- data_width));

    wk_out_im( (86 + 1) * data_width - 1 
               downto 
               86 * data_width
             ) <= to_slv(to_sfixed(-0.85772861, 0, 1- data_width));
  
    wk_out_re( (87 + 1) * data_width - 1 
               downto 
               87 * data_width
             ) <= to_slv(to_sfixed(-0.534997619887, 0, 1- data_width));

    wk_out_im( (87 + 1) * data_width - 1 
               downto 
               87 * data_width
             ) <= to_slv(to_sfixed(-0.84485356525, 0, 1- data_width));
  
    wk_out_re( (88 + 1) * data_width - 1 
               downto 
               88 * data_width
             ) <= to_slv(to_sfixed(-0.55557023302, 0, 1- data_width));

    wk_out_im( (88 + 1) * data_width - 1 
               downto 
               88 * data_width
             ) <= to_slv(to_sfixed(-0.831469612303, 0, 1- data_width));
  
    wk_out_re( (89 + 1) * data_width - 1 
               downto 
               89 * data_width
             ) <= to_slv(to_sfixed(-0.575808191418, 0, 1- data_width));

    wk_out_im( (89 + 1) * data_width - 1 
               downto 
               89 * data_width
             ) <= to_slv(to_sfixed(-0.817584813152, 0, 1- data_width));
  
    wk_out_re( (90 + 1) * data_width - 1 
               downto 
               90 * data_width
             ) <= to_slv(to_sfixed(-0.595699304492, 0, 1- data_width));

    wk_out_im( (90 + 1) * data_width - 1 
               downto 
               90 * data_width
             ) <= to_slv(to_sfixed(-0.803207531481, 0, 1- data_width));
  
    wk_out_re( (91 + 1) * data_width - 1 
               downto 
               91 * data_width
             ) <= to_slv(to_sfixed(-0.615231590581, 0, 1- data_width));

    wk_out_im( (91 + 1) * data_width - 1 
               downto 
               91 * data_width
             ) <= to_slv(to_sfixed(-0.788346427627, 0, 1- data_width));
  
    wk_out_re( (92 + 1) * data_width - 1 
               downto 
               92 * data_width
             ) <= to_slv(to_sfixed(-0.634393284164, 0, 1- data_width));

    wk_out_im( (92 + 1) * data_width - 1 
               downto 
               92 * data_width
             ) <= to_slv(to_sfixed(-0.773010453363, 0, 1- data_width));
  
    wk_out_re( (93 + 1) * data_width - 1 
               downto 
               93 * data_width
             ) <= to_slv(to_sfixed(-0.653172842954, 0, 1- data_width));

    wk_out_im( (93 + 1) * data_width - 1 
               downto 
               93 * data_width
             ) <= to_slv(to_sfixed(-0.757208846506, 0, 1- data_width));
  
    wk_out_re( (94 + 1) * data_width - 1 
               downto 
               94 * data_width
             ) <= to_slv(to_sfixed(-0.671558954847, 0, 1- data_width));

    wk_out_im( (94 + 1) * data_width - 1 
               downto 
               94 * data_width
             ) <= to_slv(to_sfixed(-0.740951125355, 0, 1- data_width));
  
    wk_out_re( (95 + 1) * data_width - 1 
               downto 
               95 * data_width
             ) <= to_slv(to_sfixed(-0.689540544737, 0, 1- data_width));

    wk_out_im( (95 + 1) * data_width - 1 
               downto 
               95 * data_width
             ) <= to_slv(to_sfixed(-0.724247082951, 0, 1- data_width));
  
    wk_out_re( (96 + 1) * data_width - 1 
               downto 
               96 * data_width
             ) <= to_slv(to_sfixed(-0.707106781187, 0, 1- data_width));

    wk_out_im( (96 + 1) * data_width - 1 
               downto 
               96 * data_width
             ) <= to_slv(to_sfixed(-0.707106781187, 0, 1- data_width));
  
    wk_out_re( (97 + 1) * data_width - 1 
               downto 
               97 * data_width
             ) <= to_slv(to_sfixed(-0.724247082951, 0, 1- data_width));

    wk_out_im( (97 + 1) * data_width - 1 
               downto 
               97 * data_width
             ) <= to_slv(to_sfixed(-0.689540544737, 0, 1- data_width));
  
    wk_out_re( (98 + 1) * data_width - 1 
               downto 
               98 * data_width
             ) <= to_slv(to_sfixed(-0.740951125355, 0, 1- data_width));

    wk_out_im( (98 + 1) * data_width - 1 
               downto 
               98 * data_width
             ) <= to_slv(to_sfixed(-0.671558954847, 0, 1- data_width));
  
    wk_out_re( (99 + 1) * data_width - 1 
               downto 
               99 * data_width
             ) <= to_slv(to_sfixed(-0.757208846506, 0, 1- data_width));

    wk_out_im( (99 + 1) * data_width - 1 
               downto 
               99 * data_width
             ) <= to_slv(to_sfixed(-0.653172842954, 0, 1- data_width));
  
    wk_out_re( (100 + 1) * data_width - 1 
               downto 
               100 * data_width
             ) <= to_slv(to_sfixed(-0.773010453363, 0, 1- data_width));

    wk_out_im( (100 + 1) * data_width - 1 
               downto 
               100 * data_width
             ) <= to_slv(to_sfixed(-0.634393284164, 0, 1- data_width));
  
    wk_out_re( (101 + 1) * data_width - 1 
               downto 
               101 * data_width
             ) <= to_slv(to_sfixed(-0.788346427627, 0, 1- data_width));

    wk_out_im( (101 + 1) * data_width - 1 
               downto 
               101 * data_width
             ) <= to_slv(to_sfixed(-0.615231590581, 0, 1- data_width));
  
    wk_out_re( (102 + 1) * data_width - 1 
               downto 
               102 * data_width
             ) <= to_slv(to_sfixed(-0.803207531481, 0, 1- data_width));

    wk_out_im( (102 + 1) * data_width - 1 
               downto 
               102 * data_width
             ) <= to_slv(to_sfixed(-0.595699304492, 0, 1- data_width));
  
    wk_out_re( (103 + 1) * data_width - 1 
               downto 
               103 * data_width
             ) <= to_slv(to_sfixed(-0.817584813152, 0, 1- data_width));

    wk_out_im( (103 + 1) * data_width - 1 
               downto 
               103 * data_width
             ) <= to_slv(to_sfixed(-0.575808191418, 0, 1- data_width));
  
    wk_out_re( (104 + 1) * data_width - 1 
               downto 
               104 * data_width
             ) <= to_slv(to_sfixed(-0.831469612303, 0, 1- data_width));

    wk_out_im( (104 + 1) * data_width - 1 
               downto 
               104 * data_width
             ) <= to_slv(to_sfixed(-0.55557023302, 0, 1- data_width));
  
    wk_out_re( (105 + 1) * data_width - 1 
               downto 
               105 * data_width
             ) <= to_slv(to_sfixed(-0.84485356525, 0, 1- data_width));

    wk_out_im( (105 + 1) * data_width - 1 
               downto 
               105 * data_width
             ) <= to_slv(to_sfixed(-0.534997619887, 0, 1- data_width));
  
    wk_out_re( (106 + 1) * data_width - 1 
               downto 
               106 * data_width
             ) <= to_slv(to_sfixed(-0.85772861, 0, 1- data_width));

    wk_out_im( (106 + 1) * data_width - 1 
               downto 
               106 * data_width
             ) <= to_slv(to_sfixed(-0.514102744193, 0, 1- data_width));
  
    wk_out_re( (107 + 1) * data_width - 1 
               downto 
               107 * data_width
             ) <= to_slv(to_sfixed(-0.870086991109, 0, 1- data_width));

    wk_out_im( (107 + 1) * data_width - 1 
               downto 
               107 * data_width
             ) <= to_slv(to_sfixed(-0.49289819223, 0, 1- data_width));
  
    wk_out_re( (108 + 1) * data_width - 1 
               downto 
               108 * data_width
             ) <= to_slv(to_sfixed(-0.881921264348, 0, 1- data_width));

    wk_out_im( (108 + 1) * data_width - 1 
               downto 
               108 * data_width
             ) <= to_slv(to_sfixed(-0.471396736826, 0, 1- data_width));
  
    wk_out_re( (109 + 1) * data_width - 1 
               downto 
               109 * data_width
             ) <= to_slv(to_sfixed(-0.893224301196, 0, 1- data_width));

    wk_out_im( (109 + 1) * data_width - 1 
               downto 
               109 * data_width
             ) <= to_slv(to_sfixed(-0.449611329655, 0, 1- data_width));
  
    wk_out_re( (110 + 1) * data_width - 1 
               downto 
               110 * data_width
             ) <= to_slv(to_sfixed(-0.903989293123, 0, 1- data_width));

    wk_out_im( (110 + 1) * data_width - 1 
               downto 
               110 * data_width
             ) <= to_slv(to_sfixed(-0.42755509343, 0, 1- data_width));
  
    wk_out_re( (111 + 1) * data_width - 1 
               downto 
               111 * data_width
             ) <= to_slv(to_sfixed(-0.914209755704, 0, 1- data_width));

    wk_out_im( (111 + 1) * data_width - 1 
               downto 
               111 * data_width
             ) <= to_slv(to_sfixed(-0.405241314005, 0, 1- data_width));
  
    wk_out_re( (112 + 1) * data_width - 1 
               downto 
               112 * data_width
             ) <= to_slv(to_sfixed(-0.923879532511, 0, 1- data_width));

    wk_out_im( (112 + 1) * data_width - 1 
               downto 
               112 * data_width
             ) <= to_slv(to_sfixed(-0.382683432365, 0, 1- data_width));
  
    wk_out_re( (113 + 1) * data_width - 1 
               downto 
               113 * data_width
             ) <= to_slv(to_sfixed(-0.932992798835, 0, 1- data_width));

    wk_out_im( (113 + 1) * data_width - 1 
               downto 
               113 * data_width
             ) <= to_slv(to_sfixed(-0.359895036535, 0, 1- data_width));
  
    wk_out_re( (114 + 1) * data_width - 1 
               downto 
               114 * data_width
             ) <= to_slv(to_sfixed(-0.941544065183, 0, 1- data_width));

    wk_out_im( (114 + 1) * data_width - 1 
               downto 
               114 * data_width
             ) <= to_slv(to_sfixed(-0.336889853392, 0, 1- data_width));
  
    wk_out_re( (115 + 1) * data_width - 1 
               downto 
               115 * data_width
             ) <= to_slv(to_sfixed(-0.949528180593, 0, 1- data_width));

    wk_out_im( (115 + 1) * data_width - 1 
               downto 
               115 * data_width
             ) <= to_slv(to_sfixed(-0.313681740399, 0, 1- data_width));
  
    wk_out_re( (116 + 1) * data_width - 1 
               downto 
               116 * data_width
             ) <= to_slv(to_sfixed(-0.956940335732, 0, 1- data_width));

    wk_out_im( (116 + 1) * data_width - 1 
               downto 
               116 * data_width
             ) <= to_slv(to_sfixed(-0.290284677254, 0, 1- data_width));
  
    wk_out_re( (117 + 1) * data_width - 1 
               downto 
               117 * data_width
             ) <= to_slv(to_sfixed(-0.963776065795, 0, 1- data_width));

    wk_out_im( (117 + 1) * data_width - 1 
               downto 
               117 * data_width
             ) <= to_slv(to_sfixed(-0.266712757475, 0, 1- data_width));
  
    wk_out_re( (118 + 1) * data_width - 1 
               downto 
               118 * data_width
             ) <= to_slv(to_sfixed(-0.970031253195, 0, 1- data_width));

    wk_out_im( (118 + 1) * data_width - 1 
               downto 
               118 * data_width
             ) <= to_slv(to_sfixed(-0.242980179903, 0, 1- data_width));
  
    wk_out_re( (119 + 1) * data_width - 1 
               downto 
               119 * data_width
             ) <= to_slv(to_sfixed(-0.975702130039, 0, 1- data_width));

    wk_out_im( (119 + 1) * data_width - 1 
               downto 
               119 * data_width
             ) <= to_slv(to_sfixed(-0.219101240157, 0, 1- data_width));
  
    wk_out_re( (120 + 1) * data_width - 1 
               downto 
               120 * data_width
             ) <= to_slv(to_sfixed(-0.980785280403, 0, 1- data_width));

    wk_out_im( (120 + 1) * data_width - 1 
               downto 
               120 * data_width
             ) <= to_slv(to_sfixed(-0.195090322016, 0, 1- data_width));
  
    wk_out_re( (121 + 1) * data_width - 1 
               downto 
               121 * data_width
             ) <= to_slv(to_sfixed(-0.985277642389, 0, 1- data_width));

    wk_out_im( (121 + 1) * data_width - 1 
               downto 
               121 * data_width
             ) <= to_slv(to_sfixed(-0.17096188876, 0, 1- data_width));
  
    wk_out_re( (122 + 1) * data_width - 1 
               downto 
               122 * data_width
             ) <= to_slv(to_sfixed(-0.989176509965, 0, 1- data_width));

    wk_out_im( (122 + 1) * data_width - 1 
               downto 
               122 * data_width
             ) <= to_slv(to_sfixed(-0.146730474455, 0, 1- data_width));
  
    wk_out_re( (123 + 1) * data_width - 1 
               downto 
               123 * data_width
             ) <= to_slv(to_sfixed(-0.992479534599, 0, 1- data_width));

    wk_out_im( (123 + 1) * data_width - 1 
               downto 
               123 * data_width
             ) <= to_slv(to_sfixed(-0.122410675199, 0, 1- data_width));
  
    wk_out_re( (124 + 1) * data_width - 1 
               downto 
               124 * data_width
             ) <= to_slv(to_sfixed(-0.995184726672, 0, 1- data_width));

    wk_out_im( (124 + 1) * data_width - 1 
               downto 
               124 * data_width
             ) <= to_slv(to_sfixed(-0.0980171403296, 0, 1- data_width));
  
    wk_out_re( (125 + 1) * data_width - 1 
               downto 
               125 * data_width
             ) <= to_slv(to_sfixed(-0.997290456679, 0, 1- data_width));

    wk_out_im( (125 + 1) * data_width - 1 
               downto 
               125 * data_width
             ) <= to_slv(to_sfixed(-0.0735645635997, 0, 1- data_width));
  
    wk_out_re( (126 + 1) * data_width - 1 
               downto 
               126 * data_width
             ) <= to_slv(to_sfixed(-0.998795456205, 0, 1- data_width));

    wk_out_im( (126 + 1) * data_width - 1 
               downto 
               126 * data_width
             ) <= to_slv(to_sfixed(-0.0490676743274, 0, 1- data_width));
  
    wk_out_re( (127 + 1) * data_width - 1 
               downto 
               127 * data_width
             ) <= to_slv(to_sfixed(-0.999698818696, 0, 1- data_width));

    wk_out_im( (127 + 1) * data_width - 1 
               downto 
               127 * data_width
             ) <= to_slv(to_sfixed(-0.0245412285229, 0, 1- data_width));
  

end FIMP_0;