module prio2(
    input wire[1: 0] i,
    output wire o,
    output wire valid
);

    or #1 or1(valid, i[0], i[1]);
    assign o = i[1];
endmodule

module prio4(
    input wire[3:0] i,
    output wire[1:0] o,
    output wire valid
);

    wire out1, valid1, out2, valid2;
    prio2 #1 p1(.i({i[3], i[2]}), .o(out1), .valid(valid1));
    prio2 #1 p2(.i({i[1], i[0]}), .o(out2), .valid(valid2));
    prio2 #1 p3(.i({valid1, valid2}), .o(o[1]), .valid(valid));

    wire mux1, mux2, muxneg;
    not #1 n1(muxneg, o[1]);
    and #1 a1(mux1, out1, o[1]);
    and #1 a2(mux2, out2, muxneg);

    or #1 or1(o[0], mux1, mux2);
endmodule

module test;
    reg [3:0] in = 0;
    wire valid;
    wire[1:0] out;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, test);
        #15
        in <= 4'b1000;
        #15
        in <= 4'b0100;
        #15
        in <= 4'b0010;
        #15
        in <= 4'b0001;

        #15
        in <= 4'b1100;
        #15
        in <= 4'b1110;
        #15
        in <= 4'b0011;
        #15
        in <= 4'b0001;
        #15
        in <= 4'b0000;
        #15
        in <= 4'b1111;
        #100 $finish;
    end

    prio4 a(
        .i(in),
        .o(out),
        .valid(valid)
    );

    initial $monitor ("%t %h %h %0d", $time, in, out, valid);
endmodule //test