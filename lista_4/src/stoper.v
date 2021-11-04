`default_nettype none

module stoper(
    input wire clk,
    input wire reset,
    input wire [7:0] dip,
    input wire aux1, 
    input wire aux2, 
    input wire aux3,
    output wire [7:0] sseg,
    output wire [7:0] digit,
);

    // zegar 12MHz. potrzebuję policzyć do 120 000 i to jest trigger
    reg[18:0] prescaler;
    reg tr0;
    reg tick;
    //wire syncreset;
    //syncr s(.clk(clk), .a(reset), .s(syncreset));

    always @(posedge clk) begin
        if (!reset) begin
            prescaler <= 19'b0;
            tr0 <= 1'b0;
            tick <= 1'b0;
        end else begin
            if (tick) begin
                if (!aux1) begin
                    // wylacz zegar
                    tick <= 1'b0;
                end
            end else begin
                if (!aux2) begin
                    // wylacz zegar
                    tick <= 1'b1;
                end
            end

            if (prescaler >= 120000) begin
                tr0 <= 1'b1;
                prescaler <= 19'b0;
            end else if (prescaler > 10) begin
                tr0 <= 1'b0;
                prescaler <= prescaler + 1'b1;
            end else begin
                prescaler <= prescaler + 1'b1;
            end
        end
    end

    wire [3:0] bcd [7:0];
    wire [7:0] nexttr;
    BCDC #(.rstat(9)) C1(.clk(clk), .trigger(tr0 & tick), .reset(reset), .next(nexttr[0]), .BCD(bcd[0]));
    BCDC #(.rstat(9)) C2(.clk(clk), .trigger(nexttr[0] & tick), .reset(reset), .next(nexttr[1]), .BCD(bcd[1]));
    BCDC #(.rstat(9)) C3(.clk(clk), .trigger(nexttr[1] & tick), .reset(reset), .next(nexttr[2]), .BCD(bcd[2]));
    BCDC #(.rstat(9)) C4(.clk(clk), .trigger(nexttr[2] & tick), .reset(reset), .next(nexttr[3]), .BCD(bcd[3]));
    BCDC #(.rstat(9)) C5(.clk(clk), .trigger(nexttr[3] & tick), .reset(reset), .next(nexttr[4]), .BCD(bcd[4]));
    BCDC #(.rstat(9)) C6(.clk(clk), .trigger(nexttr[4] & tick), .reset(reset), .next(nexttr[5]), .BCD(bcd[5]));
    BCDC #(.rstat(9)) C7(.clk(clk), .trigger(nexttr[5] & tick), .reset(reset), .next(nexttr[6]), .BCD(bcd[6]));
    BCDC #(.rstat(9)) C8(.clk(clk), .trigger(nexttr[6] & tick), .reset(reset), .next(nexttr[7]), .BCD(bcd[7]));

    numdriver n(
        .clk(clk),
        .rst(reset),
        .BCD1(bcd[7]),
        .BCD2(bcd[6]),
        .BCD3(bcd[5]),
        .BCD4(bcd[4]),
        .BCD5(bcd[3]),
        .BCD6(bcd[2]),
        .BCD7(bcd[1]),
        .BCD8(bcd[0]),
        .sseg(sseg),
        .digit(digit)
    );

endmodule //top