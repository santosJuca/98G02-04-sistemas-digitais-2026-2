# Trabalho 01 - Testbench de uma ALU

Este trabalho apresenta o teste de uma ALU de 8 bits em SystemVerilog.

O testbench aplica manualmente valores nas entradas da ALU para observar as operacoes de soma, subtracao, AND, OR, XOR, NOT e deslocamentos. Os resultados podem ser conferidos na janela Wave do QuestaSim.

## Arquivos

- `alu.sv`: ALU usada no trabalho.
- `alu_tb.sv`: testbench com os estimulos.
- `sim.do`: comandos para compilar e executar a simulacao.
- `wave.do`: adiciona os sinais na janela Wave.

## Execucao

Abra o QuestaSim na pasta do trabalho e execute:

```tcl
do sim.do
```

Ao final, confira os sinais `a`, `b`, `op`, `result`, `zero` e `overflow` na janela Wave.
