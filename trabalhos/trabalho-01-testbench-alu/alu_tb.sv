`timescale 1ns/1ps

module alu_tb;

    parameter WIDTH = 8;

    logic [WIDTH-1:0] a;
    logic [WIDTH-1:0] b;
    logic [3:0]       op;

    logic [WIDTH-1:0] result;
    logic             zero;
    logic             overflow;

    // Instancia a ALU fornecida pelo professor
    alu #(.WIDTH(WIDTH)) dut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .zero(zero),
        .overflow(overflow)
    );

    // Mostra os valores no Transcript
    initial begin
        $monitor(
            "tempo=%0t | op=%b | a=%h | b=%h | result=%h | zero=%b | overflow=%b",
            $time, op, a, b, result, zero, overflow
        );
    end

    // Aplica os testes
    initial begin

        // Valores iniciais
        a  = 8'h00;
        b  = 8'h00;
        op = 4'b0000;
        #10;

        // ADD: 12 + 34 = 46
        a = 8'h12;
        b = 8'h34;
        op = 4'b0000;
        #10;

        // SUB: 55 - 33 = 22
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

        // SLL: 01 deslocado 7 posições = 80
        a = 8'h01;
        b = 8'h07;
        op = 4'b0110;
        #10;

        // SRL: 80 deslocado 7 posições = 01
        a = 8'h80;
        b = 8'h07;
        op = 4'b0111;
        #10;

        // Testa o default
        a = 8'hAA;
        b = 8'h55;
        op = 4'b1111;
        #10;

        // Garante toggle de todos os bits de result: 00 -> FF -> 00
        a = 8'h00;
        b = 8'h00;
        op = 4'b0011;
        #10;

        a = 8'hFF;
        b = 8'h00;
        op = 4'b0011;
        #10;

        a = 8'h00;
        b = 8'h00;
        op = 4'b0011;
        #10;

        $display("Fim da simulacao.");
        $finish;

    end

endmodule
