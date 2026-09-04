module half_adder_tb;

    logic a;
    logic b;
    logic sum;
    logic carry;
    integer i;

    half_adder dut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i[1:0];
            #1;

            if (sum !== (a ^ b) || carry !== (a & b))
                $error("Erro: a=%b b=%b sum=%b carry=%b", a, b, sum, carry);
        end

        $display("half_adder_tb finalizado");
        $finish;
    end

endmodule
