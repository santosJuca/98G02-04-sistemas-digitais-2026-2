module alu #(parameter WIDTH = 8) (
    input  logic [WIDTH-1:0] a, b,
    input  logic [3:0]       op,
    output logic [WIDTH-1:0] result,
    output logic             zero, overflow
);

    always_comb begin
        case (op)
            4'b0000: result = a + b;        // ADD
            4'b0001: result = a - b;        // SUB
            4'b0010: result = a & b;        // AND
            4'b0011: result = a | b;        // OR
            4'b0100: result = a ^ b;        // XOR
            4'b0101: result = ~a;           // NOT
            4'b0110: result = a << b[2:0];  // SLL
            4'b0111: result = a >> b[2:0];  // SRL
            default: result = '0;
        endcase
    end

    assign zero = (result == '0);

    assign overflow = (a[WIDTH-1] == b[WIDTH-1]) &&
                      (a[WIDTH-1] != result[WIDTH-1]);

endmodule
