`default_nettype none

module calc(
    input wire clk,
    input wire reset,
    input wire [7:0] dip,
    input wire aux1, 
    input wire aux2, 
    input wire aux3,
    output wire [7:0] sseg,
    output wire [7:0] digit,
    output wire ledg,
);
    // IO
    reg do_add, do_sub;
    reg mk_add, mk_sub;
    reg mk_mul;
    reg zero;
    reg [8:0] aux1_history;
    reg [8:0] aux2_history;
    reg [8:0] aux3_history;
    reg [8:0] mulvalue;
    reg pre1, pre2, pre3;

    reg [14:0] pp;
    assign ledg = mk_mul;

    always @(posedge clk) begin
        if (!reset) begin
            pp <= 20'b0;
            do_add <= 1'b0;
            mk_add <= 1'b0;
            do_sub <= 1'b0;
            mk_sub <= 1'b0;
            mk_mul <= 1'b0;
            mulvalue <= 9'b0;
            zero <= 1'b0;
        end else begin
            if (mk_mul > 0) begin
                if (mulvalue > 0) begin 
                    mulvalue <= mulvalue - 1'b1;
                    if (!zero) begin
                        do_add <= !do_add;
                    end
                end else begin
                    mk_mul <= 1'b0;
                    zero <= 1'b0;
                end
            end else begin
                if (pp == 15'd0) begin
                    pp <= pp + 1'b1;
                    aux1_history <= {aux1_history[7:0], aux1};
                    aux2_history <= {aux2_history[7:0], aux2};
                    aux3_history <= {aux3_history[7:0], aux3};
                end else if (pp == 15'd1) begin
                    pp <= pp + 1'b1;
                    if (pre1 == 1'b1 & aux1_history == {8{1'b0}}) begin pre1 <= 1'b0; mk_sub <= 1'b1; end
                    if (pre1 == 1'b0 & aux1_history == {8{1'b1}}) begin pre1 <= 1'b1; mk_sub <= 1'b0; end
                    if (pre2 == 1'b1 & aux2_history == {8{1'b0}}) begin pre2 <= 1'b0; mk_add <= 1'b1; end
                    if (pre2 == 1'b0 & aux2_history == {8{1'b1}}) begin pre2 <= 1'b1; mk_add <= 1'b0; end
                    if (pre3 == 1'b1 & aux3_history == {8{1'b0}}) begin 
                        if ((9'd10*vola[1] + vola[0]) == 9'b0) begin
                            // razy 0 -> wyzeruj
                            mulvalue <= 9'd2;
                            mk_mul <= 1'b1; 
                            zero <= 1'b1;

                        end else if ((9'd10*vola[1] + vola[0]) == 9'b1) begin
                            // razy 1 -> pass

                        end else begin
                            // razy coś -> mnożymy.
                            mulvalue <= 2*(10*vola[1] + vola[0]) - 9'd2;
                            mk_mul <= 1'b1; 
                            mulkeep[0] <= acc[0];
                            mulkeep[1] <= acc[1];
                            mulkeep[2] <= acc[2];
                            mulkeep[3] <= acc[3];
                        end

                        pre3 <= 1'b0; 
                    end
                    if (pre3 == 1'b0 & aux3_history == {8{1'b1}}) begin pre3 <= 1'b1; end

                end else if (pp == 15'd2) begin
                    // i/o sprawdzone przy pp=0. przy pp=1 przekazujemy mk_add do d_add
                    pp <= pp + 1'b1;

                    if (mk_add == 1'b1) begin
                        do_add <= 1'b1;
                        mk_add <= 1'b0;
                    end 

                    if (mk_sub == 1'b1) begin
                        do_sub <= 1'b1;
                        mk_sub <= 1'b0;
                    end 
                end else if (pp == 15'd3) begin
                    // i/o sprawdzone przy pp=0. przy pp=1 przekazujemy mk_add do d_add
                    // wyłączamy do_add żeby dodać tylko raz.
                    pp <= pp + 1'b1;
                    do_add <= 1'b0;
                    do_sub <= 1'b0;
                end else begin
                    pp <= pp + 1'b1;
                end
            end
        end
    end

    // śmieci
    wire [3:0] acc [3:0];
    wire [3:0] vola [1:0];
    reg [3:0] mulkeep [3:0];

    wire negative;

    volatile_bcd vol(
        .clk(clk),
        .bcd_low(vola[0]),
        .bcd_high(vola[1]),
        .dip(dip),
    );

    aggregator agg(
        .clk(clk),
        .reset(reset & !zero),
        .operand_1(mk_mul ? mulkeep[0] : vola[0]),
        .operand_2(mk_mul ? mulkeep[1] : vola[1]),
        .operand_3(mk_mul ? mulkeep[2] : 4'b0),
        .operand_4(mk_mul ? mulkeep[3] : 4'b0),
        .bcd_1(acc[0]),
        .bcd_2(acc[1]),
        .bcd_3(acc[2]),
        .bcd_4(acc[3]),
        .negative(negative),
        .do_add(do_add),
        .do_sub(do_sub),
    );

    numdriver n(
        .clk(clk),
        .rst(reset),
        .BCD1(4'b1111),
        .BCD2(acc[3]),
        .BCD3(acc[2]),
        .BCD4(acc[1]),
        .BCD5(acc[0]),
        .BCD6(4'b1111),
        .BCD7(vola[1]),
        .BCD8(vola[0]),
        .sseg(sseg),
        .digit(digit)
    );

endmodule