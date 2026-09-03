# Sinais mostrados na janela Wave
add wave -divider "Entradas"
add wave -radix hexadecimal sim:/alu_tb/a
add wave -radix hexadecimal sim:/alu_tb/b
add wave -radix binary      sim:/alu_tb/op

add wave -divider "Saidas"
add wave -radix hexadecimal sim:/alu_tb/result
add wave                    sim:/alu_tb/zero
add wave                    sim:/alu_tb/overflow

add wave -divider "Controle do teste"
add wave -radix decimal sim:/alu_tb/testes
add wave -radix decimal sim:/alu_tb/erros

configure wave -timelineunits ns
