`default_nettype none

module aggregator(
    input wire clk,
    input wire reset,

    input wire [3:0] operand_1, //low
    input wire [3:0] operand_2, //
    input wire [3:0] operand_3, //
    input wire [3:0] operand_4, //high

    output wire [3:0] bcd_1, // (low)
    output wire [3:0] bcd_2,    
    output wire [3:0] bcd_3,    
    output wire [3:0] bcd_4, // (high)

    output wire negative,

    input wire do_add,
    input wire do_sub,
);

    wire carrywire1, carrywire2, carrywire3, carrywire4;
    wire borrowwire1, borrowwire2, borrowwire3, borrowwire4;

    bcd_aug l1(
        .clk(clk), .reset(reset), .operand(operand_1), .bcd(bcd_1), 
        .do_add(do_add), .do_sub(do_sub),
        .in_carry(1'b0), .out_carry(carrywire1),
        .in_borrow(1'b0), .out_borrow(borrowwire1),
    );

    bcd_aug l2(
        .clk(clk), .reset(reset), .operand(operand_2), .bcd(bcd_2), 
        .do_add(do_add), .do_sub(do_sub),
        .in_carry(carrywire1), .out_carry(carrywire2),
        .in_borrow(borrowwire1), .out_borrow(borrowwire2),
    );

    bcd_aug l3(
        .clk(clk), .reset(reset), .operand(operand_3), .bcd(bcd_3), 
        .do_add(do_add), .do_sub(do_sub),
        .in_carry(carrywire2), .out_carry(carrywire3),
        .in_borrow(borrowwire2), .out_borrow(borrowwire3),
    );

    bcd_aug l4(
        .clk(clk), .reset(reset), .operand(operand_4), .bcd(bcd_4), 
        .do_add(do_add), .do_sub(do_sub),
        .in_carry(carrywire3), .out_carry(carrywire4),
        .in_borrow(borrowwire3), .out_borrow(borrowwire4),
    );

endmodule