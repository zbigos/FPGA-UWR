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


module seqdiv(
    input wire [3:0] BCD,
    input wire reset,
    input wire clk,
    output wire divisible
);
    reg [3:0] internal_bcd;
    wire [3:0] reduced;
    reducer r(.BCD(internal_bcd + BCD), .COMP(reduced));

    always @(posedge clk) begin
        if(reset) begin
            internal_bcd = 4'b0000;
        end else begin
            internal_bcd = reduced;
        end
    end

endmodule // seqdiv