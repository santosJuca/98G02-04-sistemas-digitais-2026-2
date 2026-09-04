if {[file exists work]} {
    vdel -lib work -all
}

vlib work

vlog -sv ../rtl/half_adder.sv
vlog -sv ../rtl/full_adder.sv
vlog -sv ../rtl/adder8.sv
vlog -sv ../rtl/ula8.sv

vlog -sv half_adder_tb.sv
vlog -sv full_adder_tb.sv
vlog -sv adder8_tb.sv
vlog -sv ula8_tb.sv

vsim half_adder_tb
run -all
quit -sim

vsim full_adder_tb
run -all
quit -sim

vsim adder8_tb
run -all
quit -sim

vsim ula8_tb
run -all
quit -sim

quit -f
