vlib work
vlog GRAY_COUNTER.v GRAY_COUNTER_tb.v
vsim -voptargs=+acc work.GRAY_COUNTER_tb
add wave *
run -all
#quit -sim