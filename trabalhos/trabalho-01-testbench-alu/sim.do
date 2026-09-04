vlib work
vlog alu.sv
vlog alu_tb.sv
vsim -coverage work.alu_tb
do wave.do
run -all
