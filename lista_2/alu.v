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


module testbench;

    integer x = 0;
    integer status;
    integer file;
    reg [31: 0] testrow;
    wire [7:0] A, B, O, EO; 
    wire [1:0] IV;
    wire NEG;
    
    assign A = testrow[31: 24];
    assign B = testrow[23: 16];
    assign EO = testrow[15: 8];
    assign IV = testrow[7:6];
    assign NEG = testrow[5];    

    alu a(.A(A), .B(B), .O(O), .neg(NEG), .aluop(IV));

    initial begin
        file = $fopen("alu_test.txt", "r");
        forever begin
            status = $fscanf(file, "%h", testrow);

            if (testrow == 32'hffffffff) begin
                $write("all ok");
                $finish;
            end

            #1;
            $write("row = %b, A = %b, B = %b, neg = %b, instr = %b | exp = %b got = %b", testrow, A, B, NEG, IV, EO, O);
            if (O == EO) begin
                $write(", OK \n");
            end else begin
                $write(", FAIL \n");
                $finish;
            end
            #1;
        end

        $finish;
    end

endmodule //testbench