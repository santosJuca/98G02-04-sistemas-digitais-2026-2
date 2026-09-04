module adder8_tb;

    logic [7:0] a;
    logic [7:0] b;
    logic       cin;
    logic [7:0] sum;
    logic       cout;

    adder8 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    task automatic check(
        input logic [7:0] ta,
        input logic [7:0] tb,
        input logic       tcin
    );
        logic [8:0] expected;
        begin
            a = ta;
            b = tb;
            cin = tcin;
            #1;
            expected = {1'b0, ta} + {1'b0, tb} + tcin;

            if ({cout, sum} !== expected)
                $error("Erro: a=%h b=%h cin=%b resultado=%h esperado=%h", ta, tb, tcin, {cout, sum}, expected);
        end
    endtask

    initial begin
        check(8'h00, 8'h00, 1'b0);
        check(8'h01, 8'h01, 1'b0);
        check(8'h0F, 8'h01, 1'b0);
        check(8'h7F, 8'h01, 1'b0);
        check(8'hFF, 8'h01, 1'b0);
        check(8'h55, 8'hAA, 1'b0);
        check(8'h12, 8'h34, 1'b1);
        check(8'hFF, 8'hFF, 1'b1);

        $display("adder8_tb finalizado");
        $finish;
    end

endmodule
