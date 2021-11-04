`default_nettype none
`timescale 1ns/1ns

module raw_display_driver(
    output reg [7:0] sseg,
    output reg [7:0] digit,

    input wire clk,
    input wire reset,
    input wire [7:0] pwm_1_l,
    input wire [7:0] pwm_1_m,
    input wire [7:0] pwm_1_r,

    input wire [7:0] pwm_2_l,
    input wire [7:0] pwm_2_m,
    input wire [7:0] pwm_2_r,

    input wire [7:0] pwm_3_l,
    input wire [7:0] pwm_3_m,
    input wire [7:0] pwm_3_r,

    input wire [7:0] pwm_4_l,
    input wire [7:0] pwm_4_m,
    input wire [7:0] pwm_4_r,

    input wire [7:0] pwm_5_l,
    input wire [7:0] pwm_5_m,
    input wire [7:0] pwm_5_r,

    input wire [7:0] pwm_6_l,
    input wire [7:0] pwm_6_m,
    input wire [7:0] pwm_6_r,

    input wire [7:0] pwm_7_l,
    input wire [7:0] pwm_7_m,
    input wire [7:0] pwm_7_r,

    input wire [7:0] pwm_8_l,
    input wire [7:0] pwm_8_m,
    input wire [7:0] pwm_8_r,
);

    reg [2:0] multiplex;
    reg [7:0] pwmv;
    
    wire [7:0] mux_l;
    assign mux_l = ((multiplex == 3'b000) ? pwm_1_l : 8'b0 
    | (multiplex == 3'b001) ? pwm_2_l : 8'b0 
    | (multiplex == 3'b010) ? pwm_3_l : 8'b0 
    | (multiplex == 3'b011) ? pwm_4_l : 8'b0 
    | (multiplex == 3'b100) ? pwm_5_l : 8'b0 
    | (multiplex == 3'b101) ? pwm_6_l : 8'b0 
    | (multiplex == 3'b110) ? pwm_7_l : 8'b0 
    | (multiplex == 3'b111) ? pwm_8_l : 8'b0);

    wire [7:0] mux_r;
    assign mux_r = ((multiplex == 3'b000) ? pwm_1_r : 8'b0 
    | (multiplex == 3'b001) ? pwm_2_r : 8'b0 
    | (multiplex == 3'b010) ? pwm_3_r : 8'b0 
    | (multiplex == 3'b011) ? pwm_4_r : 8'b0 
    | (multiplex == 3'b100) ? pwm_5_r : 8'b0 
    | (multiplex == 3'b101) ? pwm_6_r : 8'b0 
    | (multiplex == 3'b110) ? pwm_7_r : 8'b0 
    | (multiplex == 3'b111) ? pwm_8_r : 8'b0);

    wire [7:0] mux_m;
    assign mux_m = ((multiplex == 3'b000) ? pwm_1_m : 8'b0 
    | (multiplex == 3'b001) ? pwm_2_m : 8'b0 
    | (multiplex == 3'b010) ? pwm_3_m : 8'b0 
    | (multiplex == 3'b011) ? pwm_4_m : 8'b0 
    | (multiplex == 3'b100) ? pwm_5_m : 8'b0 
    | (multiplex == 3'b101) ? pwm_6_m : 8'b0 
    | (multiplex == 3'b110) ? pwm_7_m : 8'b0 
    | (multiplex == 3'b111) ? pwm_8_m : 8'b0);

    assign digit = ((multiplex == 3'b000) ? 8'b11111110 : 8'b0 
    | (multiplex == 3'b001) ? 8'b11111101 : 8'b0 
    | (multiplex == 3'b010) ? 8'b11111011 : 8'b0 
    | (multiplex == 3'b011) ? 8'b11110111 : 8'b0 
    | (multiplex == 3'b100) ? 8'b11101111 : 8'b0 
    | (multiplex == 3'b101) ? 8'b11011111 : 8'b0 
    | (multiplex == 3'b110) ? 8'b10111111 : 8'b0 
    | (multiplex == 3'b111) ? 8'b01111111 : 8'b0);

    reg [6:0] pp;

    always @(posedge clk) begin
        if(!reset) begin
            pp <= 0;
            multiplex <= 3'b000;
            pwmv <= 8'b0;
        end else begin
            if (pp == 0) begin
                pp <= pp + 1'b1;
                if (multiplex == 0) begin
                    multiplex <= multiplex + 1'b1;
                    pwmv <= pwmv + 1'b1;
                end else begin
                    multiplex <= multiplex + 1'b1;
                end
            end else if(pp > 0) begin
                pp <= pp + 1'b1;
                //lewe, f/e
                sseg[5] <= (pwmv < mux_l);
                sseg[4] <= (pwmv < mux_l);

                // srodek, a/d/g
                sseg[0] <= (pwmv < mux_m);
                sseg[3] <= (pwmv < mux_m);
                sseg[6] <= (pwmv < mux_m);

                // prawe, b/c
                sseg[1] <= (pwmv < mux_r);
                sseg[2] <= (pwmv < mux_r);
            end
        end
    end

endmodule
