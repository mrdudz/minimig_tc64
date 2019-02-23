#************************************************************
# THIS IS A WIZARD-GENERATED FILE.                           
#
# Version 11.1 Build 216 11/23/2011 Service Pack 1 SJ Web Edition
#
#************************************************************

# Copyright (C) 1991-2011 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.



# Clock constraints

create_clock -name "clk50m" -period 20.000ns [get_ports {clk50m}] -waveform {0.000 10.00}

# Automatically constrain PLL and other generated clocks
derive_pll_clocks

create_generated_clock -name sdram_clk_pin -source [get_nets {b2v_inst|altpll_component|auto_generated|wire_pll1_clk[0]}] [get_ports {ram_clk}]

#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty;

#**************************************************************
# Set Input Delay
#**************************************************************

# Very narrow window here.
set_input_delay -clock sdram_clk_pin -max [expr 5.4 + 1.0] [get_ports ram_d*]
set_input_delay -clock sdram_clk_pin -min [expr 0 + 1.0 ] [get_ports ram_d*]

#**************************************************************
# Set Output Delay
#**************************************************************

# Routing delay on outputs should pretty much cancel out, since they'll apply to the clock too, yes?
set_output_delay -clock sdram_clk_pin -max [expr 1.5 + 0.1] [get_ports ram_d*]
set_output_delay -clock sdram_clk_pin -min [expr -1.0 - 0.1] [get_ports ram_d*]

set_output_delay -clock sdram_clk_pin -max [expr 1.5 + 0.1] [get_ports ram_a*]
set_output_delay -clock sdram_clk_pin -min [expr -1.0 - 0.1] [get_ports ram_a*]

set_output_delay -clock sdram_clk_pin -max [expr 1.5 + 0.1] [get_ports {ram_*}]
set_output_delay -clock sdram_clk_pin -min [expr -1.0 - 0.1] [get_ports {ram_*}]


# Multicycles

# Without this, Quartus shoots for the wrong clock edge on inputs, due to the phase-shifted clock.
set_multicycle_path -from [get_clocks {sdram_clk_pin}] -to [get_clocks {b2v_inst|altpll_component|auto_generated|pll1|clk[1]}] -setup -end 2

