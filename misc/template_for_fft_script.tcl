# configure global settings
  set_attribute information_level 0
  set_attribute hdl_unconnected_input_port_value 0 
  set_attribute lp_insert_clock_gating true
  set_attribute ungroup false
  set_attribute auto_ungroup none

# read library
  set_attribute lib_search_path ./lib
  set_attribute library tcbn40lpbwptc.lib 

# read vhdl source
  set_attribute hdl_search_path {./lib ./src}

  # fixed point support
  read_hdl -vhdl -library ieee_proposed fixed_float_types_c.vhdl
  read_hdl -vhdl -library ieee_proposed fixed_pkg_c.vhdl
  
  # FFT 64 RTL code
  read_hdl -vhdl -library ieee_proposed cmul.vhdl
  read_hdl -vhdl -library ieee_proposed bf.vhdl
  read_hdl -vhdl -library ieee_proposed cbf.vhdl
  read_hdl -vhdl -library ieee_proposed twiddle_factor.vhdl
  read_hdl -vhdl -library ieee_proposed agu.vhdl
  read_hdl -vhdl -library ieee_proposed array_slicer.vhdl
  read_hdl -vhdl -library ieee_proposed radix_2_fft_control.vhdl
  read_hdl -vhdl -library ieee_proposed cbf_slv.vhdl
  read_hdl -vhdl -library ieee_proposed fft_top.vhdl

  elaborate -parameters { {{default_data_width}} {{N}} {{stages}} {{NB}}} fft_top

# # synthesis settings
  dc::set_load_unit -picofarads
  dc::set_operating_conditions NCCOM
  dc::set_wire_load_mode segmented 
  
# # clock settings
  define_clock -period 2000 -name clk [clock_ports]
  clock_gating declone -hierarchical

synthesize -to_mapped -effort low

# write gate level netlist
  write_hdl >     ./rpt/fft_{{N}}_{{NB}}_gate_level.v

# write reports
  report timing > ./rpt/timing_rtl_fft_{{N}}_{{NB}}.rep
  report power >  ./rpt/power_rtl_fft_{{N}}_{{NB}}.rep
  report area >   ./rpt/area_rtl_fft_{{N}}_{{NB}}.rep

# write constraints
  write_sdc >     ./rpt/fft_{{N}}_{{NB}}.sdc
  write_sdf >     ./rpt/fft_{{N}}_{{NB}}.sdf

exit


