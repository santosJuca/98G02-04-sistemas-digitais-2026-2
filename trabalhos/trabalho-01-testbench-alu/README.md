# Trabalho 01 - Análise de cobertura da ALU

Exercício avaliativo da disciplina de Sistemas Digitais.

O objetivo deste trabalho é testar uma ALU de 8 bits feita em SystemVerilog e analisar a cobertura obtida na simulação. O testbench verifica automaticamente os resultados e as saídas `zero` e `overflow`.

## Arquivos

- `alu.sv`: código da ALU fornecida no exercício.
- `alu_tb.sv`: aplica os valores de teste e compara as saídas com os resultados esperados.
- `sim.do`: compila os arquivos, executa a simulação, salva a cobertura e gera o relatório HTML.
- `wave.do`: organiza os sinais mostrados na janela Wave do QuestaSim.
- `README.md`: explica o trabalho, os testes e como executar a simulação.

Os arquivos `work/`, `coverage_report/`, `transcript`, `vsim.wlf`, `*.ucdb` e `*.mpf` não ficam no repositório porque são gerados pelo QuestaSim.

## Operações testadas

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

## Respostas sobre cobertura

- **Statements:** na contagem do exercício, são esperadas 10 de 11 linhas executáveis, cerca de 90,9%. As oito operações e os dois `assign` são exercitados. Não existe um caso de teste para o `default`.
- **Branches:** são esperados 8 de 9 caminhos do `case`, cerca de 88,9%. As operações de `0000` até `0111` são testadas, mas não foi criado um teste para o caminho `default`.
- **Toggle:** o enunciado cita um sinal `data`, mas esse sinal não existe na ALU fornecida. Considerando o `result` de 8 bits, existem 16 transições possíveis: 8 de 0 para 1 e 8 de 1 para 0.
- **FSM:** não se aplica, pois a ALU é um circuito combinacional e não possui estados nem transições.

Não foram adicionados testes artificiais apenas para forçar 100% de cobertura. O percentual exato pode variar conforme a versão do QuestaSim e deve ser conferido no relatório gerado pela simulação.

## Como executar no VDI da PUCRS

No terminal, dentro da pasta do trabalho:

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
