module ula8 (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  logic [2:0] op,
    output logic [7:0] result
);

    // Base inicial da ULA.
    // A codificação das operações será fechada conforme a especificação do trabalho.
    always_comb begin
        result = 8'h00;

        case (op)
            3'b000: result = a + b;   // soma
            3'b001: result = a - b;   // subtração
            3'b010: result = a * b;   // multiplicação, mantém 8 bits menos significativos
            3'b011: result = (a == b) ? 8'h01 : 8'h00; // comparação inicial
            3'b100: result = a & b;   // AND
            3'b101: result = a | b;   // OR
            3'b110: result = ~a;      // NOT de A
            3'b111: result = a ^ b;   // XOR
            default: result = 8'h00;
        endcase
    end

endmodule
