# Trabalho 01 - Testbench da ALU

Trabalho da disciplina de Sistemas Digitais.

O objetivo foi testar a ALU de 8 bits no QuestaSim e verificar a cobertura da simulação.

## Arquivos

- `alu.sv`: ALU usada no trabalho.
- `alu_tb.sv`: testbench com os casos de teste.
- `sim.do`: comandos para compilar e rodar a simulação.
- `wave.do`: sinais mostrados na janela Wave.

## Testes

Foram testadas as operações:

- soma
- subtração
- AND
- OR
- XOR
- NOT
- deslocamento para esquerda
- deslocamento para direita

Também foi feito um teste de soma com resultado zero.

## Cobertura

- Statements: o `default` não é executado nos testes.
- Branches: são testadas as 8 operações da ALU, sem testar o `default`.
- Toggle: o sinal `data` citado no enunciado não existe na ALU fornecida.
- FSM: não se aplica, pois a ALU não possui estados.

## Como executar

No VDI da PUCRS:

```bash
source /soft64/source_gaph
module load questa
vsim
```

Depois, no Transcript do QuestaSim:

```tcl
do sim.do
```
