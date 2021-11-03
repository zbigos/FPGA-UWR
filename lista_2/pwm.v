`default_nettype none

module pwm(
    input wire [15:0] top,
    input wire [15:0] comp,
    input wire clk,
    input wire rst,
    input wire pol,
    input wire mode, 
    output wire out
);

    reg [15: 0] state;
    reg delta;
    assign out = pol ? (state < comp) : (state >= comp);

    always @(posedge clk) begin
        if (rst) begin
            state <= 16'b0;
            delta <= 1'b1;
        end else begin
        
            // jesli jestem w state 0 to zawsze chce isc do gory
            if (state == 0) begin
                delta <= 1'b1;
                state <= 1'b1;
            end else begin
                if (state >= top) begin
                    if (mode) begin
                        // mode 1 == odwracem delta
                        delta <= 1'b0;
                        state <= top - 1'b1;
                    end else begin
                        // mode 0 == zeruje state
                        delta <= 1'b1;
                        state <= 1'b0;
                    end
                end else begin
                    if (delta) begin 
                        state <= state + 1'b1;
                    end else begin
                        state <= state - 1'b1;
                    end
                end
            end
        end
    end 
endmodule // pwm


module testbench;
    reg clk = 0;
    reg rst = 0;
    wire out_simple;
    wire out_neg;
    wire out_vartop;
    wire out_mode;
    reg [15: 0] aaaa = 16;


    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, testbench);
        #2 rst = 0;
        #2 rst = 1;
        #8 rst = 0;
        #1000 aaaa = 64;
        #1000 aaaa = 128;
        #1000 $finish;
    end

    always #1 clk = !clk;

    pwm simple(
        .top( 16'b0000000000010000),
        .comp(16'b0000000000001000),
        .clk(clk),
        .rst(rst),
        .pol(1'b0),
        .mode(1'b0),
        .out(out_simple)
    );

    pwm neg(
        .top( 16'b0000000000010000),
        .comp(16'b0000000000001000),
        .clk(clk),
        .rst(rst),
        .pol(1'b1),
        .mode(1'b0),
        .out(out_neg)
    );

    pwm mode(
        .top( 16'b0000000000010000),
        .comp(16'b0000000000001000),
        .clk(clk),
        .rst(rst),
        .pol(1'b0),
        .mode(1'b1),
        .out(out_mode)
    );

    pwm vartop(
        .top(aaaa),
        .comp(16'b0000000000001000),
        .clk(clk),
        .rst(rst),
        .pol(1'b0),
        .mode(1'b0),
        .out(out_vartop)
    );


    initial $monitor ($time, clk, rst, out_simple, out_neg, out_mode, out_vartop);

endmodule