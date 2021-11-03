`default_nettype none

module alu (
    input wire [7:0] A,
    input wire [7:0] B,
    output wire [7:0] O,
    input wire neg,
    input wire [1:0] aluop    
);

    reg [7:0] result;
    assign O = neg ? 8'hff - result : result;
    
    always @ * begin
        case(aluop)
            2'b00 : result = A + B;
            2'b01 : result = A - B;
            2'b10 : result = A & B;
            2'b11 : result = A | B;
        endcase
    end

endmodule //alu
