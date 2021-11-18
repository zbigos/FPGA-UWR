`default_nettype none
`timescale 1ns/1ns

module numdriver(
    input wire clk,
    input wire rst,
    input wire[3:0] BCD1,
    input wire[3:0] BCD2,
    input wire[3:0] BCD3,
    input wire[3:0] BCD4,
    input wire[3:0] BCD5,
    input wire[3:0] BCD6,
    input wire[3:0] BCD7,
    input wire[3:0] BCD8,

    output reg [7:0] sseg,
    output reg [7:0] digit,
);

    wire [7:0] d1; bcdmapper b1(.BCD(BCD1), .segment(d1));
    wire [7:0] d2; bcdmapper b2(.BCD(BCD2), .segment(d2));
    wire [7:0] d3; bcdmapper b3(.BCD(BCD3), .segment(d3));
    wire [7:0] d4; bcdmapper b4(.BCD(BCD4), .segment(d4));
    wire [7:0] d5; bcdmapper b5(.BCD(BCD5), .segment(d5));
    wire [7:0] d6; bcdmapper b6(.BCD(BCD6), .segment(d6));
    wire [7:0] d7; bcdmapper b7(.BCD(BCD7), .segment(d7));
    wire [7:0] d8; bcdmapper b8(.BCD(BCD8), .segment(d8));
    
    reg [2:0] multiplex;

    wire [7:0] ech;
    wire [7:0] mux;
    assign mux = {ech[0], ech[1], ech[2], ech[3], ech[4], ech[5], ech[6], ech[7]};
    assign ech = ((multiplex == 3'b000) ? d1 : 8'b0 
    | (multiplex == 3'b001) ? d2 : 8'b0 
    | (multiplex == 3'b010) ? d3 : 8'b0 
    | (multiplex == 3'b011) ? d4 : 8'b0 
    | (multiplex == 3'b100) ? d5 : 8'b0 
    | (multiplex == 3'b101) ? d6 : 8'b0 
    | (multiplex == 3'b110) ? d7 : 8'b0 
    | (multiplex == 3'b111) ? d8 : 8'b0);

    assign digit = ((multiplex == 3'b000) ? 8'b11111110 : 8'b0 
    | (multiplex == 3'b001) ? 8'b11111101 : 8'b0 
    | (multiplex == 3'b010) ? 8'b11111111 : 8'b0 
    | (multiplex == 3'b011) ? 8'b11110111 : 8'b0 
    | (multiplex == 3'b100) ? 8'b11101111 : 8'b0 
    | (multiplex == 3'b101) ? 8'b11111111 : 8'b0 
    | (multiplex == 3'b110) ? 8'b10111111 : 8'b0 
    | (multiplex == 3'b111) ? 8'b01111111 : 8'b0);

    reg [7:0] pp;

    always @(posedge clk) begin
        if(!rst) begin
            pp <= 0;
            multiplex <= 3'b000;
        end else begin
            if (pp == 0) begin
                pp <= pp + 1'b1;
                multiplex <= multiplex + 1'b1;
            end else if(pp > 0) begin
                pp <= pp + 1'b1;
                sseg <= mux;
                sseg[7] <= (multiplex == 5);
            end
        end
    end
endmodule