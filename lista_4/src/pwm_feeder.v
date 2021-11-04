`default_nettype none
`timescale 1ns/1ns

module pwm_feeder(
    input wire clk,
    input wire reset,
    output wire [7:0] sseg,
    output wire [7:0] digit
);

    // 24 zones each 8 bits
    reg [7:0] pwm_depth [23:0];

    raw_display_driver rwd(
        .sseg(sseg),
        .digit(digit),
        .clk(clk),
        .reset(reset),
        .pwm_1_l(pwm_depth[0]),
        .pwm_1_m(pwm_depth[1]),
        .pwm_1_r(pwm_depth[2]),
        .pwm_2_l(pwm_depth[3]),
        .pwm_2_m(pwm_depth[4]),
        .pwm_2_r(pwm_depth[5]),
        .pwm_3_l(pwm_depth[6]),
        .pwm_3_m(pwm_depth[7]),
        .pwm_3_r(pwm_depth[8]),
        .pwm_4_l(pwm_depth[9]),
        .pwm_4_m(pwm_depth[10]),
        .pwm_4_r(pwm_depth[11]),
        .pwm_5_l(pwm_depth[12]),
        .pwm_5_m(pwm_depth[13]),
        .pwm_5_r(pwm_depth[14]),
        .pwm_6_l(pwm_depth[15]),
        .pwm_6_m(pwm_depth[16]),
        .pwm_6_r(pwm_depth[17]),
        .pwm_7_l(pwm_depth[18]),
        .pwm_7_m(pwm_depth[19]),
        .pwm_7_r(pwm_depth[20]),
        .pwm_8_l(pwm_depth[21]),
        .pwm_8_m(pwm_depth[22]),
        .pwm_8_r(pwm_depth[23]),        
    );

    integer i;
    reg [6:0] ptr;
    reg dir;
    reg [20:0]prescaler;

    always @(posedge clk) begin
        if (!reset) begin 
            ptr <= 7'b0;
            dir <= 1'b1;
            for(i = 0; i < 24; i = i + 1) begin
                pwm_depth[i] <= 8'b00000000;
            end
        end else begin
            if (prescaler == 0) begin
                prescaler <= prescaler + 1'b1;
                if (ptr == 0) begin
                    ptr <= 7'b1;
                    dir <= 1'b1;
                end else if(ptr == 23) begin
                    ptr <= 22;
                    dir <= 1'b0;
                end else begin
                    if (dir) begin
                        ptr <= ptr + 1'b1;
                    end else begin
                        ptr <= ptr - 1'b1;
                    end
                    
                    pwm_depth[ptr] <= 8'b11111111;
                    pwm_depth[ptr - 1] <= 8'b01111111;
                    pwm_depth[ptr + 1] <= 8'b01111111;
                    pwm_depth[ptr - 2] <= 8'b00111111;
                    pwm_depth[ptr + 2] <= 8'b00111111;
                    pwm_depth[ptr - 3] <= 8'b00011111;
                    pwm_depth[ptr + 3] <= 8'b00011111;
                    pwm_depth[ptr - 4] <= 8'b0;
                    pwm_depth[ptr + 4] <= 8'b0;

                end
            end else begin
                prescaler <= prescaler + 1'b1;
            end
        end
    end

endmodule
