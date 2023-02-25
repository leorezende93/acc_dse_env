if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vcom -work work ../apps/rtl_code/default_default/layer/0/bram_36Kb.vhd
vcom -work work ../apps/rtl_code/default_default/layer/0/config_pkg.vhd

# Package with utilities - need to be before convolution core
vcom -work work ../rtl/core/util_pkg.vhd

# Get bram generics
set fp [open "../apps/rtl_code/default_default/layer/0/generic_file_bram36k.txt" r]
set bram_generics [read $fp]

# Simulation
vsim -voptargs=+acc=lprn -t ps work.tb -f ../apps/rtl_code/default_default/layer/0/generic_file.txt {*}$bram_generics
#onfinish exit
#onbreak exit
log -r /*
add wave sim:/tb/*
run -all
#run 1222 ns
#exit 
