`default_nettype none


module bcd_aug(
    input wire clk,
    input wire reset,

    input wire [3:0] operand,
    output wire [3:0] bcd,
    
    input wire do_add,
    input wire in_carry,
    output wire out_carry,

    input wire do_sub,
    input wire in_borrow,
    output wire out_borrow,
);

    reg [3:0] bcd_me;
    assign bcd = bcd_me;

    wire out_carry = (bcd_me + in_carry + operand) >= 5'd10;
    wire [4:0] opp_sum = out_carry ? (bcd_me + in_carry + operand - 5'd10) : (bcd_me + in_carry + operand);
    wire out_borrow = bcd_me < (in_borrow + operand);
    wire [4:0] opp_sub = out_borrow ? ((bcd_me + 5'd10) - (in_borrow + operand)) : (bcd_me - (in_borrow + operand));

    always @(posedge clk) begin
        if(!reset) begin
            bcd_me <= 4'b0;        
        end else begin
            if (do_add) begin
                bcd_me <= opp_sum;
            end

            if (do_sub) begin
                bcd_me <= opp_sub;
            end
        end
    end

endmodule


/*
module bcd_aug(
    input wire clk,
    input wire reset,

    input wire [3:0] operand,
    output wire [3:0] bcd,
    
    input wire do_add,
    input wire in_carry,
    output wire out_carry,

    input wire do_sub,
    input wire in_borrow,
    output wire out_borrow,
);

    reg [3:0] bcd_me;
    assign bcd = bcd_me;

    always @(posedge clk) begin
        if(!reset) begin
            bcd_me <= 4'b0;        
            out_carry <= 1'b0;
            out_borrow <= 1'b0;
        end else begin
            if (do_add) begin
                if ((bcd_me + in_carry + operand) < 10) begin
                    bcd_me <= bcd_me + in_carry + operand;
                end else begin // overflow max o 1, 9+9+1 = 1 9
                    bcd_me <= bcd_me + in_carry + operand - 10;
                    out_carry <= 1'b1;
                end
            end else if (do_sub) begin
                if (bcd_me >= (in_borrow + operand)) begin
                    bcd_me <= bcd_me - in_borrow - operand;
                end else begin // zawsze 1 borrow, 10 - 9 - 1 = 0
                    bcd_me <= 10 - (bcd_me - in_borrow - operand);
                    out_borrow <= 1'b1;
                end
            end else begin
                out_carry <= 1'b0;
                out_borrow <= 1'b0;
            end
        end
    end

endmodule
*/