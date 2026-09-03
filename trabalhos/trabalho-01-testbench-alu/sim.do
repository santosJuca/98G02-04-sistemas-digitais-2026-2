# Simulacao e cobertura da ALU
transcript on

if {[file exists work]} {
    vdel -lib work -all
}

vlib work
vmap work work

# A cobertura estrutural e aplicada ao circuito, nao ao testbench.
vlog -sv -cover bcestf alu.sv
vlog -sv alu_tb.sv

vsim -coverage work.alu_tb
view wave
do wave.do

coverage save -onexit alu_coverage.ucdb
onfinish stop
run -all
wave zoom full

coverage report -detail -instance /alu_tb/dut
coverage save alu_coverage.ucdb

# Gera o relatorio HTML oficial usando o vcover do Questa.
if {[file exists coverage_report]} {
    file delete -force coverage_report
}

if {[catch {
    exec vcover report -html -source -output coverage_report alu_coverage.ucdb
} mensagem]} {
    puts "ATENCAO: nao foi possivel gerar o HTML automaticamente."
    puts $mensagem
    puts "Execute no terminal: vcover report -html -source -output coverage_report alu_coverage.ucdb"
} else {
    puts "Relatorio criado em coverage_report/index.html"
}

puts "Simulacao concluida. Confira o Transcript, as ondas e o relatorio HTML."
