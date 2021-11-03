// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vbcd_verilator.h for the primary calling header

#ifndef VERILATED_VBCD_VERILATOR___024ROOT_H_
#define VERILATED_VBCD_VERILATOR___024ROOT_H_  // guard

#include "verilated.h"

class Vbcd_verilator__Syms;
VL_MODULE(Vbcd_verilator___024root) {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(reset,0,0);
    CData/*0:0*/ bcd_verilator__DOT__SL__DOT__inext;
    CData/*0:0*/ bcd_verilator__DOT__SH__DOT__inext;
    CData/*0:0*/ bcd_verilator__DOT__ML__DOT__inext;
    VL_OUT8(BCD_SL,3,0);
    VL_OUT8(BCD_SH,3,0);
    VL_OUT8(BCD_ML,3,0);
    VL_OUT8(BCD_MH,3,0);
    CData/*3:0*/ bcd_verilator__DOT__SL__DOT__istate;
    CData/*3:0*/ bcd_verilator__DOT__SH__DOT__istate;
    CData/*3:0*/ bcd_verilator__DOT__ML__DOT__istate;
    CData/*3:0*/ bcd_verilator__DOT__MH__DOT__istate;
    CData/*0:0*/ __VinpClk__TOP__bcd_verilator__DOT__SL__DOT__inext;
    CData/*0:0*/ __VinpClk__TOP__bcd_verilator__DOT__SH__DOT__inext;
    CData/*0:0*/ __VinpClk__TOP__bcd_verilator__DOT__ML__DOT__inext;
    CData/*0:0*/ __Vclklast__TOP__clk;
    CData/*0:0*/ __Vclklast__TOP__reset;
    CData/*0:0*/ __Vclklast__TOP____VinpClk__TOP__bcd_verilator__DOT__SL__DOT__inext;
    CData/*0:0*/ __Vclklast__TOP____VinpClk__TOP__bcd_verilator__DOT__SH__DOT__inext;
    CData/*0:0*/ __Vclklast__TOP____VinpClk__TOP__bcd_verilator__DOT__ML__DOT__inext;
    CData/*0:0*/ __Vchglast__TOP__bcd_verilator__DOT__SL__DOT__inext;
    CData/*0:0*/ __Vchglast__TOP__bcd_verilator__DOT__SH__DOT__inext;
    CData/*0:0*/ __Vchglast__TOP__bcd_verilator__DOT__ML__DOT__inext;

    // INTERNAL VARIABLES
    Vbcd_verilator__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
    Vbcd_verilator___024root(const char* name);
    ~Vbcd_verilator___024root();
    VL_UNCOPYABLE(Vbcd_verilator___024root);

    // INTERNAL METHODS
    void __Vconfigure(Vbcd_verilator__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
