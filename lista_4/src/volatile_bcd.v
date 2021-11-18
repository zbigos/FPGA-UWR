`default_nettype none

module volatile_bcd(
    input wire clk,
    output wire [3:0] bcd_low,
    output wire [3:0] bcd_high,    
    input wire [7:0] dip,

);

    assign bcd_high = (dip[3:0] > 4'd9) ? 4'd9 : dip[3:0];
    assign bcd_low = (dip[7:4] > 4'd9) ? 4'd9 : dip[7:4];
endmodule