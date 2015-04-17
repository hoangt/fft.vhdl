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

'''Description of fft_script

  # make_fft_script
  ----

  Make a RTL compiler script

  1. the number of points: *N*
  2. data component width: *data_width*

  '''

import cmath, math

from jinja2 import Environment, FileSystemLoader

def make_fft_script(N, NB, default_data_width = 16,
  template_file_name = 'template_for_fft_script.tcl',
  output_file_name = None):

  if output_file_name == None:
    output_file_name = 'fft{0}_{1}.tcl'.format(N, NB)

  env = Environment(loader=FileSystemLoader('.'))
  template = env.get_template(template_file_name)

  output_file = open(output_file_name, 'w')
  output_file.write(
    template.render( N = N,
                     NB = NB,
                     stages = int(math.log(N, 2)),
                     default_data_width = default_data_width))

  output_file.close()

if __name__ == '__main__':
  import sys
  if len(sys.argv) == 1:
    make_fft_script(64, 2)
  if len(sys.argv) == 2:
    make_fft_script(int(sys.argv[1]))
  if len(sys.argv) == 3:
    make_fft_script(int(sys.argv[1]), int(sys.argv[2]))
  if len(sys.argv) == 4:
    make_fft_script(int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]))
  if len(sys.argv) == 5:
    make_fft_script(int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]), sys.argv[4])
  if len(sys.argv) == 6:
    make_fft_script(int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]), sys.argv[4], sys.argv[5])
