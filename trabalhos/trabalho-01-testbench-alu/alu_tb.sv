`timescale 1ns/1ps

module alu_tb;

    parameter WIDTH = 8;

    logic [WIDTH-1:0] a;
    logic [WIDTH-1:0] b;
    logic [3:0] op;
    logic [WIDTH-1:0] result;
    logic zero;
    logic overflow;

    integer erros;

    alu #(.WIDTH(WIDTH)) dut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .zero(zero),
        .overflow(overflow)
    );

    task testar(
        input logic [WIDTH-1:0] valor_a,
        input logic [WIDTH-1:0] valor_b,
        input logic [3:0] operacao,
        input logic [WIDTH-1:0] esperado
    );
        logic zero_esperado;
        logic overflow_esperado;

        begin
            a = valor_a;
            b = valor_b;
            op = operacao;
            #10;

            zero_esperado = (esperado == 0);
            overflow_esperado = (valor_a[7] == valor_b[7]) &&
                                (valor_a[7] != esperado[7]);

            if ((result != esperado) ||
                (zero != zero_esperado) ||
                (overflow != overflow_esperado)) begin
                erros = erros + 1;
                $display("ERRO op=%b a=%h b=%h result=%h esperado=%h", op, a, b, result, esperado);
            end
            else begin
                $display("OK op=%b result=%h", op, result);
            end
        end
    endtask

    initial begin
        erros = 0;

        testar(8'h00, 8'h00, 4'b0000, 8'h00); // soma
        testar(8'h12, 8'h34, 4'b0000, 8'h46); // soma
        testar(8'h55, 8'h33, 4'b0001, 8'h22); // subtracao
        testar(8'hAA, 8'h0F, 4'b0010, 8'h0A); // AND
        testar(8'h55, 8'hAA, 4'b0011, 8'hFF); // OR
        testar(8'hA5, 8'h3C, 4'b0100, 8'h99); // XOR
        testar(8'h0F, 8'h00, 4'b0101, 8'hF0); // NOT
        testar(8'h01, 8'h07, 4'b0110, 8'h80); // shift esquerda
        testar(8'h80, 8'h07, 4'b0111, 8'h01); // shift direita

        if (erros == 0)
            $display("Todos os testes passaram.");
        else
            $display("Total de erros: %0d", erros);

        $finish;
    end

endmodule
