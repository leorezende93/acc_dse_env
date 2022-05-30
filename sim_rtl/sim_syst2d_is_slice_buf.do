if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

# Packages for CNN layer simualtion
vcom -work work ../apps/inmem_pkg.vhd
vcom -work work ../apps/gold_pkg.vhd

# Components
vcom -work work ../rtl/components/mem.vhd
vcom -work work ../rtl/components/mac.vhd
vcom -work work ../rtl/components/reg.vhd

# Convolution core
vcom -work work ../rtl/convolution/syst2d_is_slice_buf.vhd

# Testbench
vcom -work work ../tb/tb_rtl.vhd

# Simulation
vsim -voptargs=+acc=lprn -t ps work.tb -f ../apps/generic_file.txt
do wave_syst2d_is_slice_buf.do
onfinish exit
onbreak exit
run -all
exit 
