transcript on

if {[file exists work]} {
    vdel -lib work -all
}

vlib work

vlog -sv -cover bcestf alu.sv
vlog -sv alu_tb.sv

vsim -coverage work.alu_tb

do wave.do
run -all

coverage report -detail -instance /alu_tb/dut
coverage save alu_coverage.ucdb
