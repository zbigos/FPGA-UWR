module td_and(output wire o, input wire a, input wire b);
    and #1 and1(o, a, b);
endmodule

module td_or(output wire o, input wire a, b, c, d);
    or #1 or1(o, a, b, c, d);
endmodule

module mux4(
    input wire[1:0]sel,
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire out
);
    wire a1, a2, a3, a4;
    td_and e(a1, a, (sel == 2'b00));
    td_and f(a2, b, (sel == 2'b01));
    td_and g(a3, c, (sel == 2'b10));
    td_and h(a4, d, (sel == 2'b11));
    td_or i(out, a1, a2, a3, a4);
endmodule // mux4

primitive Dlatch(Q, clk, D);
    output Q;
    reg Q;
    input clk, D;

    table
        // clk, D : q : q+
        (10) ? : ? : -;
        (01) 0 : ? : 0;
        (01) 1 : ? : 1; 
        ? (??) : ? : -; 
    endtable
endprimitive

module JKlatch(
    input wire clk,
    input wire j,
    input wire k,
    output wire q
);

    wire mux_out;
    wire Dlatch_out;
    assign q = Dlatch_out;

    mux4 m(.sel({j, k}), .a(Dlatch_out), .b(1'b0), .c(1'b1), .d(~Dlatch_out), .out(mux_out));
    Dlatch #(1) d(.Q(Dlatch_out), .clk(clk), .D(mux_out));
endmodule //JKlatch


module test;
    reg clk = 0;
    reg j = 0;
    reg k = 0;
    wire q;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, test);
        #10
        j = 1;
        k = 0;
        // expect 1

        #40
        j = 0;
        k = 1;
        // expect 0

        #40
        j = 1;
        k = 1;
        // expect toggling

        #100
        j = 0;
        k = 0;
        // expect toggling

        #100 $finish;
    end

    always #1 clk = !clk;

    JKlatch JK(
        .clk(clk),
        .j(j),
        .k(k),
        .q(q)
    );

    initial $monitor ("%t %h %h %0d", $time, clk, j, k, q);
endmodule //test