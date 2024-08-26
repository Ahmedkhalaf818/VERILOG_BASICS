vlib work
vlog  RAM_SYN.v tb_RAM_SYN.v
vsim -voptargs=+acc work.tb_RAM_SYN
add wave *
add wave -position insertpoint  \
sim:/tb_RAM_SYN/RAM/mem \
sim:/tb_RAM_SYN/RAM/addr_in \
sim:/tb_RAM_SYN/RAM/addr_reg \
sim:/tb_RAM_SYN/RAM/dout_reg \
sim:/tb_RAM_SYN/RAM/mem_out
run -all
#quit -sim