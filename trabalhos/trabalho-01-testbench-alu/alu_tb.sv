`timescale 1ns/1ps

module alu_tb;

    logic [7:0] a;
    logic [7:0] b;
    logic [3:0] op;
    logic [7:0] result;
    logic       zero;
    logic       overflow;

    alu dut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .zero(zero),
        .overflow(overflow)
    );

    initial begin
        // soma: 12 + 34 = 46
        a = 8'h12;
        b = 8'h34;
        op = 4'b0000;
        #10;

        // soma com resultado zero
        a = 8'h00;
        b = 8'h00;
        op = 4'b0000;
        #10;

        // subtracao: 55 - 33 = 22
        a = 8'h55;
        b = 8'h33;
        op = 4'b0001;
        #10;

        // AND: AA & 0F = 0A
        a = 8'hAA;
        b = 8'h0F;
        op = 4'b0010;
        #10;

        // OR: 55 | AA = FF
        a = 8'h55;
        b = 8'hAA;
        op = 4'b0011;
        #10;

        // XOR: A5 ^ 3C = 99
        a = 8'hA5;
        b = 8'h3C;
        op = 4'b0100;
        #10;

        // NOT: ~0F = F0
        a = 8'h0F;
        b = 8'h00;
        op = 4'b0101;
        #10;

        // deslocamento para a esquerda: 01 << 7 = 80
        a = 8'h01;
        b = 8'h07;
        op = 4'b0110;
        #10;

        // deslocamento para a direita: 80 >> 7 = 01
        a = 8'h80;
        b = 8'h07;
        op = 4'b0111;
        #10;

        $display("Fim da simulacao. Confira os resultados na janela Wave.");
        $stop;
    end

endmodule
