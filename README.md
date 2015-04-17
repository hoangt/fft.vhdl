
**Before Start**

1. Be sure python 2.7 is installed
2. Be sure `jinja2` package is installed for python.
 
**Folder structure**

----
[TOC]

----
# fft
Top folder

+ `fft64_1.tcl`: RC script for 64-point FFT with one radix-2 butterfly operators
+ `fft64_2.tcl`: RC script for 64-point FFT with two radix-2 butterfly operators
+ `fft256_1.tcl`: RC script for 256-point FFT with one radix-2 butterfly operators
+ `fft256_2.tcl`: RC script for 256-point FFT with two radix-2 butterfly operators

## ./lib
library files for synthesis

+ `fixed_float_types_c.vhdl` & `fixed_pkg_c.vhdl`: vhdl-93 library for fixed point numbers support for RTL Compiler
+ `tcbn40lpbwptc.lib`: technology library for gate level synthesis

## ./log
log files for synthesis result

+ `fft64_1.log`: 64-point FFT with one radix-2 bufferfly operators
+ `fft64_2.log`: 64-point FFT with two radix-2 bufferfly operators
+ `fft256_1.log`: 256-point FFT with one radix-2 bufferfly operators
+ `fft256_2.log`: 256-point FFT with two radix-2 bufferfly operators

## ./misc
tcl and twiddle factor generation utilities in python

## ./rpt
synthesis reports

## ./src
vhdl source files
    