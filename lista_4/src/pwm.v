`default_nettype none

module pwm(
    input wire clk,
    input wire reset,
    input wire [7:0] dip,
    input wire aux1, 
    input wire aux2, 
    input wire aux3,
    output wire [7:0] sseg,
    output wire [7:0] digit,
);

    wire [7:0] segmentfeed;

    pwm_feeder p(
        .clk(clk),
        .reset(reset),
        .sseg(sseg),
        .digit(digit)
    );
endmodule //top