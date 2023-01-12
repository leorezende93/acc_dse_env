if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

# Packages for CNN layer simualtion
# inmem_pkg is not used in simulation

vcom -work work ../apps/data_hw/default_default/1/inmem_pkg.vhd
vcom -work work ../apps/data_hw/default_default/1/ifmap_pkg.vhd
vcom -work work ../apps/data_hw/default_default/1/iwght_pkg.vhd
vcom -work work ../apps/data_hw/default_default/1/gold_pkg.vhd
vcom -work work ../apps/data_hw/default_default/1/config_pkg.vhd


# Components
vcom -work work ../rtl/components/mac.vhd
vcom -work work ../rtl/components/reg.vhd
vcom -work work ../rtl/components/mem_wght_ifmap.vhd

# Package with utilities - need to be before convolution core
vcom -work work ../rtl/pe/util_pkg.vhd

# Convolution core
vcom -work work ../rtl/convolution/syst2d_ws_split_multi.vhd

# Processing element
vcom -work work ../rtl/pe/pe_serial.vhd

# Testbench
vcom -work work ../tb/tb_rtl_pe_serial.vhd

# Simulation
vsim -voptargs=+acc=lprn -t ps work.tb -f ../apps/data_hw/default_default/1/generic_file.txt
#do wave_syst2d_ws.do
#onfinish exit
#onbreak exit
log -r /*
add wave sim:/tb/*
run -all
#run 1222 ns
#exit 
