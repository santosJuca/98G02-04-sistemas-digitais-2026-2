module ula8_tb;

    logic [7:0] a;
    logic [7:0] b;
    logic [2:0] op;
    logic [7:0] result;

    ula8 dut (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    task automatic check(
        input logic [7:0] ta,
        input logic [7:0] tb,
        input logic [2:0] top,
        input logic [7:0] expected
    );
        begin
            a = ta;
            b = tb;
            op = top;
            #1;

            if (result !== expected)
                $error("Erro: op=%b a=%h b=%h resultado=%h esperado=%h", top, ta, tb, result, expected);
        end
    endtask

    initial begin
        check(8'h05, 8'h03, 3'b000, 8'h08); // soma
        check(8'h05, 8'h03, 3'b001, 8'h02); // subtração
        check(8'h0C, 8'h0A, 3'b010, 8'h78); // multiplicação
        check(8'h55, 8'h55, 3'b011, 8'h01); // comparação
        check(8'hF0, 8'h0F, 3'b100, 8'h00); // AND
        check(8'hF0, 8'h0F, 3'b101, 8'hFF); // OR
        check(8'h0F, 8'h00, 3'b110, 8'hF0); // NOT
        check(8'hAA, 8'h0F, 3'b111, 8'hA5); // XOR

        $display("ula8_tb finalizado");
        $finish;
    end

endmodule
