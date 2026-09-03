# Trabalho 01 - Análise de cobertura da ALU

Exercício avaliativo da disciplina de Sistemas Digitais.

O trabalho usa uma ALU de 8 bits em SystemVerilog e um testbench automático para verificar as oito operações do circuito. A simulação e a análise de cobertura foram feitas no QuestaSim.

## Arquivos

- `alu.sv`: módulo da ALU fornecido no exercício.
- `alu_tb.sv`: aplica os valores de teste e compara as saídas com os resultados esperados.
- `sim.do`: compila os arquivos, executa a simulação, salva a cobertura e gera o relatório HTML.
- `wave.do`: organiza os sinais exibidos na janela Wave do QuestaSim.

Os arquivos `work/`, `coverage_report/`, `transcript`, `vsim.wlf`, `*.ucdb` e `*.mpf` não ficam no repositório porque são gerados durante a simulação.

## Testes realizados

| Código | Operação | Exemplo verificado |
| --- | --- | --- |
| `0000` | Soma | `12 + 34 = 46` |
| `0001` | Subtração | `55 - 33 = 22` |
| `0010` | AND | `AA & 0F = 0A` |
| `0011` | OR | `55 OR AA = FF` |
| `0100` | XOR | `A5 ^ 3C = 99` |
| `0101` | NOT | `~0F = F0` |
| `0110` | Deslocamento à esquerda | `01 << 7 = 80` |
| `0111` | Deslocamento à direita | `80 >> 7 = 01` |

Também foi testada uma soma com resultado zero. Ao todo, o testbench executa nove testes e informa no Transcript se todos passaram.

## Questões de cobertura

- **Statements:** são esperadas 10 de 11 linhas executáveis, pois as oito operações e os dois `assign` são exercitados. O `default` não é executado.
- **Branches:** são esperados 8 de 9 caminhos do `case`. As operações de `0000` até `0111` são testadas, mas o caminho `default` não é forçado.
- **Toggle:** o enunciado cita um sinal `data`, mas esse sinal não existe na ALU fornecida. A análise foi feita sobre `result`, que possui 8 bits. Não foi criada uma sequência artificial apenas para obter 100%.
- **FSM:** não se aplica, pois a ALU é um circuito combinacional e não possui estados nem transições.

Os percentuais exatos devem ser conferidos no relatório produzido pela versão do QuestaSim usada na execução.

## Como executar no VDI da PUCRS

No terminal:

```bash
source /soft64/source_gaph
module load questa
vsim
```

Depois, no Transcript do QuestaSim:

```tcl
do sim.do
```

O resultado esperado no final é:

```text
RESULTADO FINAL: 9 testes passaram.
```
