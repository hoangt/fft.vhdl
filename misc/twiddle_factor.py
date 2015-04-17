'''The MIT License (MIT)

  Copyright (c) 2014 Shuo Li

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
  '''

'''Description of make_twiddle_factor_file

  # make_twiddle_factor_file
  ----

  Make a VHDL file containing twiddle factors based on

  1. the number of points: *N*
  2. data component width: *data_width*

  '''

import cmath, math

from jinja2 import Environment, FileSystemLoader

def make_twiddle_factor_file(N, default_data_width = 16,
  template_file_name = 'template_for_twiddle_factor.vhdl',
  output_file_name = 'twiddle_factor.vhdl'):

  env = Environment(loader=FileSystemLoader('.'))
  template = env.get_template(template_file_name)

  output_file = open(output_file_name, 'w')
  twddle_factor_set = []

  for i in range(0, N/2):
    twiddle_factor = {}
    twiddle_factor['i'] = i

    value = cmath.exp( -i * 2j * cmath.pi / N)

    twiddle_factor['re'] = value.real
    twiddle_factor['im'] = value.imag
    twddle_factor_set.append(twiddle_factor)

  output_file.write(
    template.render( N = N,
                     number_of_twiddle_factors = N/2,
                     default_data_width = default_data_width,
                     twddle_factor_set = twddle_factor_set))

  output_file.close()

if __name__ == '__main__':
  import sys
  if len(sys.argv) == 1:
    make_twiddle_factor_file(64)
  if len(sys.argv) == 2:
    make_twiddle_factor_file(int(sys.argv[1]))
  if len(sys.argv) == 3:
    make_twiddle_factor_file(int(sys.argv[1]), int(sys.argv[2]))
  if len(sys.argv) == 4:
    make_twiddle_factor_file(int(sys.argv[1]), int(sys.argv[2]), sys.argv[3])
  if len(sys.argv) == 5:
    make_twiddle_factor_file(int(sys.argv[1]), int(sys.argv[2]), sys.argv[3], sys.argv[4])
