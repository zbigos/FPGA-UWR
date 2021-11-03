`default_nettype none

module bcd_preprocessor(input wire [3:0] BCD, output reg [3:0] COMP);
    always @ * begin
        case(BCD)
            4'b0000 : COMP = 4'b0000; //0
            4'b0001 : COMP = 4'b0001; //1
            4'b0010 : COMP = 4'b0010; //2
            4'b0011 : COMP = 4'b0000; //3
            4'b0100 : COMP = 4'b0001; //4
            4'b0101 : COMP = 4'b0010; //5
            4'b0110 : COMP = 4'b0000; //6
            4'b0111 : COMP = 4'b0001; //7
            4'b1000 : COMP = 4'b0010; //8
            4'b1001 : COMP = 4'b0000; //9
            4'b1010 : COMP = 4'b0001; //10
            4'b1011 : COMP = 4'b0010; //11
            4'b1100 : COMP = 4'b0000; //12
            4'b1101 : COMP = 4'b0001; //13
            4'b1110 : COMP = 4'b0010; //14
            4'b1111 : COMP = 4'b0000; //15
        endcase
    end
endmodule // bcd_preprocessor

module octsum(
    input wire [3: 0] D1,
    input wire [3: 0] D2,
    input wire [3: 0] D3,
    input wire [3: 0] D4,
    input wire [3: 0] D5,
    input wire [3: 0] D6,
    input wire [3: 0] D7,
    input wire [3: 0] D8,
    output wire [3: 0] Do
);
    assign Do = (D1 + D2 + D3 + D4 + D5 + D6 + D7 + D8);
endmodule

module reductor#(
    parameter digits = 4
) (
    input wire [3: 0] BCD [digits - 1: 0],
    output wire divisible
);
    
    genvar i;

    localparam width = (digits % 8 == 0) ? (digits / 8) : (digits / 8 + 1);

    generate
        wire [3:0] reduced [digits - 1 : 0];
        for (i = 0; i < digits; i = i + 1) begin
            bcd_preprocessor b(.BCD(BCD[i]), .COMP(reduced[i]));
        end

        if (digits == 1) begin
            assign divisible = (reduced[0] == 4'b0000);
        end else begin

            wire [3: 0] compacted [width - 1: 0];
            for(i = 0; i < width; i = i + 1) begin
                octsum o(
                    .D1(reduced[i * 8 + 0]),
                    .D2(reduced[i * 8 + 1]),
                    .D3(reduced[i * 8 + 2]),
                    .D4(reduced[i * 8 + 3]),
                    .D5(reduced[i * 8 + 4]),
                    .D6(reduced[i * 8 + 5]),
                    .D7(reduced[i * 8 + 6]),
                    .D8(reduced[i * 8 + 7]),
                    .Do(compacted[i])
                );
            end

            reductor #(.digits(width)) q(
                .BCD(compacted[width - 1: 0]), 
                .divisible(divisible)
            );
        end
    endgenerate
endmodule // reductor

module top(
    input wire [3: 0] BCD [47: 0],
    output wire divisible
);

    reductor#(.digits(48)) r (
        .BCD(BCD), .divisible(divisible)
    );
endmodule