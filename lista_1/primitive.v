primitive Tlatch(Q, clk, rst, T);
    output Q;
    reg Q;
    input clk, rst, T;

    table
        // clk, rst, T : q : q+
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