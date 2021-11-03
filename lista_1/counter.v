`default_nettype none

primitive Tlatch(Q, clk, rst, T);
    output Q;
    reg Q;
    input clk, rst, T;

    table
        ? 1 ? : ? : 0;
        ? (??) ? : ? : -;
        ? ? (??) : ? : -;
        ? (??) (??) : ? : -;
        (01) 0 0 : ? : -;
        (01) 0 1 : 1 : 0; 
        (01) 0 1 : 0 : 1; 
        (10) 0 ? : ? : -; 
    endtable
endprimitive

module counter(
    input wire clk,
    input wire rst,
    output reg[3:0] bcd
);
    wire[3:0] foo;

    reg internal_reset = 0;
    wire neg0, neg1, neg2, neg3;
    
    not #1 n1(neg0, foo[0]);
    Tlatch #(1) a(.Q(foo[0]), .clk(clk), .rst(rst | internal_reset), .T(clk));
    not #1 n2(neg1, foo[1]);
    Tlatch #(1) b(.Q(foo[1]), .clk(neg0), .rst(rst | internal_reset), .T(neg0));
    not #1 n3(neg2, foo[2]);
    Tlatch #(1) c(.Q(foo[2]), .clk(neg1), .rst(rst | internal_reset), .T(neg1));
    not #1 n4(neg3, foo[3]);
    Tlatch #(1) d(.Q(foo[3]), .clk(neg2), .rst(rst | internal_reset), .T(neg2));
    
    always @(negedge clk) begin
        bcd[3:0] = foo[3:0];

        if(bcd == 4'b0000) begin
            internal_reset <= 1'b0;
        end

        if (bcd == 4'b1001) begin
            internal_reset <= 1'b1;
        end
    end
endmodule // counter

module test;
    reg rst = 0;
    reg clk = 0;
    wire [3: 0] bcd;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, test);
        #32 rst = 0;
        #32 rst = 1;
        #32 rst = 0;
        #1000 $finish;
    end

    always #8 clk = !clk;

    counter c(
        .clk(clk),
        .rst(rst),
        .bcd(bcd)
    );

    initial $monitor ("%t %h %h %0d", $time, clk, rst, bcd);
endmodule //test