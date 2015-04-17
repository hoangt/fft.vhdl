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

entity radix_2_fft_control is

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

  end radix_2_fft_control;

-- Function Implementation 0
architecture FIMP_0 of radix_2_fft_control is

  signal data_re : std_logic_vector (number_of_points * data_width - 1 downto 0);
  signal data_im : std_logic_vector (number_of_points * data_width - 1 downto 0);

  signal count_in : std_logic_vector (number_of_butterfly_operators * (number_of_stages - 1) - 1 downto 0);
  
  signal address_out_0 : std_logic_vector (number_of_butterfly_operators * number_of_stages - 1 downto 0);
  signal address_out_1 : std_logic_vector (number_of_butterfly_operators * number_of_stages - 1 downto 0);

  signal current_stage : integer range 0 to number_of_stages;  
  
  constant counter_max : integer := 2**(number_of_stages - 1) - 1;
  signal counter: integer range 0 to counter_max;

  component agu is

    generic ( address_width : integer := 8 );

    port (
      count_in : in std_logic_vector(address_width - 2 downto 0);
      current_stage : in integer range 0 to address_width - 1;
      address_out_0 : out std_logic_vector(address_width - 1 downto 0);
      address_out_1 : out std_logic_vector(address_width - 1 downto 0)      
      );

    end component;

  component array_slicer is

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
    
    end component;

  signal startup_flag : std_logic;

begin

  -- read out twiddle factors
  process (clk, nrst)

    begin
      
      if (nrst = '0') then
        
        x0_re <= (others => '0');
        x0_im <= (others => '0');
        x1_re <= (others => '0');
        x1_im <= (others => '0');

        wk_re <= (others => '0');
        wk_im <= (others => '0');
        
        done <= '0';
        
        startup_flag <= '0';
        current_stage <= 0;
        counter <= 0;

        data_re <= (others => '0');
        data_im <= (others => '0');        

      elsif (clk'event and clk = '1') then
                
        if startup_flag = '0' then
        -- read initial data

          data_re <= data_in_re;
          data_im <= data_in_im;   
          startup_flag <= '1';
        
        elsif done = '1' then
        -- output data
          data_out_re <= data_re;
          data_out_im <= data_im; 

        else
        -- compute
          -- generate data addresses
            for i in 0 to number_of_butterfly_operators - 1 loop
              count_in( (i+1) * (number_of_stages - 1) - 1
                        downto
                        i * (number_of_stages - 1)
                      ) <= std_logic_vector(to_unsigned(counter + i, number_of_stages - 1));
            end loop;
          
          -- output twiddle factor
            for i in 0 to number_of_butterfly_operators - 1 loop
              wk_re( (i+1) * data_width - 1 downto i * data_width ) <= wk_in_re( (counter + i + 1) * data_width - 1 downto (counter + i) * data_width);
              wk_im( (i+1) * data_width - 1 downto i * data_width ) <= wk_in_im( (counter + i + 1) * data_width - 1 downto (counter + i) * data_width);
            end loop;
          
          -- record butterfly operation results in the previous clock cycle
            for i in 0 to number_of_butterfly_operators - 1 loop
              if (counter /= 0 or current_stage /= 0) then
                data_re((to_integer(unsigned(address_out_0( (i+1) * number_of_stages - 1 downto i * number_of_stages))) + 1) * data_width - 1
                         downto 
                         to_integer(unsigned(address_out_0( (i+1) * number_of_stages - 1 downto i * number_of_stages))) * data_width
                        ) <= y0_re( (i+1) * data_width - 1 downto i * data_width );

                data_im((to_integer(unsigned(address_out_0( (i+1) * number_of_stages - 1 downto i * number_of_stages))) + 1) * data_width - 1
                         downto 
                         to_integer(unsigned(address_out_0( (i+1) * number_of_stages - 1 downto i * number_of_stages))) * data_width
                        ) <= y0_im( (i+1) * data_width - 1 downto i * data_width );

                data_re((to_integer(unsigned(address_out_1( (i+1) * number_of_stages - 1 downto i * number_of_stages))) + 1) * data_width - 1
                         downto 
                         to_integer(unsigned(address_out_1( (i+1) * number_of_stages - 1 downto i * number_of_stages))) * data_width
                        ) <= y1_re( (i+1) * data_width - 1 downto i * data_width );

                data_im((to_integer(unsigned(address_out_1( (i+1) * number_of_stages - 1 downto i * number_of_stages))) + 1) * data_width - 1
                         downto 
                         to_integer(unsigned(address_out_1( (i+1) * number_of_stages - 1 downto i * number_of_stages))) * data_width
                        ) <= y1_im( (i+1) * data_width - 1 downto i * data_width );
              end if;
            end loop;
          
          -- update counter and stage
            if counter < counter_max + 1 - number_of_butterfly_operators then

              counter <= counter + number_of_butterfly_operators;
            
              if current_stage = number_of_stages - 1 then
                done <= '1';
              end if;
            
            else
              counter <= 0;

              if (current_stage < number_of_stages) then
                current_stage <= current_stage + 1;  
              end if;

            end if;

          end if;

      end if;
    end process;

  GEN_AGU: for i in 0 to number_of_butterfly_operators - 1 generate
    agu_0: agu
      generic map (number_of_stages)
      port map ( count_in( (i+1) * (number_of_stages - 1) - 1 downto i * (number_of_stages - 1) ),
                 current_stage,
                 address_out_0( (i+1) * number_of_stages - 1 downto i * number_of_stages),
                 address_out_1( (i+1) * number_of_stages - 1 downto i * number_of_stages) );
    end generate GEN_AGU;

  GEN_ARRAY_SLICER: for i in 0 to number_of_butterfly_operators - 1 generate
    
    array_slicer_0_re: array_slicer
      generic map (data_width, number_of_points, number_of_stages)
      port map ( data_re,
                 address_out_0( (i+1) * number_of_stages - 1 downto i * number_of_stages),
                 x0_re( (i+1) * data_width - 1 downto i * data_width) );

    array_slicer_0_im: array_slicer
      generic map (data_width, number_of_points, number_of_stages)
      port map ( data_im,
                 address_out_0( (i+1) * number_of_stages - 1 downto i * number_of_stages),
                 x0_im( (i+1) * data_width - 1 downto i * data_width) );

    array_slicer_1_re: array_slicer
      generic map (data_width, number_of_points, number_of_stages)
      port map ( data_re,
                 address_out_1( (i+1) * number_of_stages - 1 downto i * number_of_stages),
                 x1_re( (i+1) * data_width - 1 downto i * data_width) );

    array_slicer_1_im: array_slicer
      generic map (data_width, number_of_points, number_of_stages)
      port map ( data_im,
                 address_out_1( (i+1) * number_of_stages - 1 downto i * number_of_stages),
                 x1_im( (i+1) * data_width - 1 downto i * data_width) );
  
    end generate GEN_ARRAY_SLICER;

end FIMP_0;
