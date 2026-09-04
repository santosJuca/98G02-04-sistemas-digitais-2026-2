# Trabalho T1 - ULA Programável

Base do Trabalho T1 da disciplina de Sistemas Digitais.

## Requisitos anotados em aula

- Trabalho em dupla ou trio.
- Cobertura de código acima de 97%.
- Testbenches `self-checking`.
- Código sintetizável no Vivado.
- Repositório Git com documentação.
- Testar o projeto em uma placa FPGA.

## Módulos do projeto

- `rtl/half_adder.sv`: Half Adder de 1 bit.
- `rtl/full_adder.sv`: Full Adder de 1 bit usando Half Adders.
- `rtl/adder8.sv`: somador de 8 bits usando Full Adders.
- `rtl/ula8.sv`: base inicial da ULA de 8 bits.

## Testbenches

- `tb/half_adder_tb.sv`
- `tb/full_adder_tb.sv`
- `tb/adder8_tb.sv`
- `tb/ula8_tb.sv`
- `tb/sim.do`: compila e executa os testes no QuestaSim.

## Vivado e documentação

- `vivado/constraints.xdc`: base para os pinos da FPGA.
- `vivado/README.md`: observações para o Vivado.
- `docs/requisitos.md`: requisitos anotados e pontos que ainda precisam ser confirmados.

## ULA

A base atual usa as oito operações pedidas em aula: soma, subtração, multiplicação, comparação, AND, OR, NOT e XOR.

A codificação das operações, o tipo de comparação e o tamanho do resultado da multiplicação ainda devem ser conferidos no enunciado completo antes de considerar a implementação final.

A cobertura acima de 97% ainda precisa ser medida e validada durante o desenvolvimento.
