`default_nettype none

module mem(
    input wire clk,
    input wire [7:0] addr,
    output reg [7:0] data_out,
    input wire write,
    input wire [7:0] data_in,
);

    integer i;
    reg [7:0] mem [256:0];
    always @(posedge clk) begin
        if (write) begin
            mem[addr] <= data_in;
        end else begin
            data_out <= mem[addr];
        end   
    end

endmodule

module top(
    input wire clk,
    input wire reset,
    input wire [7:0] dip,
    input wire aux1, 
    input wire aux2, 
    input wire aux3,
    output wire [7:0] sseg,
    output wire [7:0] digit,
);
    wire [3:0] bcd [7:0];
    wire [7:0] memdata;
    reg write;
    reg [7:0] addr;

    reg [8:0] aux1_history;
    reg [8:0] aux2_history;
    reg pre1, pre2, pre3;
    reg [14:0] pp;
    always @(posedge clk) begin
        if (pp == 0) begin
            pp <= pp + 1'b1;
            aux1_history <= {aux1_history[7:0], aux1};
            if (pre1 == 1'b1 & aux1_history == {8{1'b0}}) begin pre1 <= 1'b0; addr <= addr + 1'b1; end
            if (pre1 == 1'b0 & aux1_history == {8{1'b1}}) begin pre1 <= 1'b1; end

            aux2_history <= {aux2_history[7:0], aux2};
            if (pre2 == 1'b1 & aux2_history == {8{1'b0}}) begin pre2 <= 1'b0; addr <= addr - 1'b1; end
            if (pre2 == 1'b0 & aux2_history == {8{1'b1}}) begin pre2 <= 1'b1; end

        end else begin
            pp <= pp + 1'b1;
        end
    end
 
    mem m(
        .clk(clk),
        .addr(addr),
        .data_out(memdata),
        .write(!aux3),
        .data_in(dip),
    );

    numdriver n(
        .clk(clk),
        .rst(1'b1),
        .BCD1(addr[4:7]),
        .BCD2(addr[0:3]),
        .BCD3(4'b0000),
        .BCD4(memdata[4:7]),
        .BCD5(memdata[0:3]),
        .BCD6(4'b0000),
        .BCD7(dip[4:7]),
        .BCD8(dip[0:3]),
        .sseg(sseg),
        .digit(digit)
    );
endmodule