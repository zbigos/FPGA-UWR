// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vsequential.h for the primary calling header

#ifndef VERILATED_VSEQUENTIAL___024ROOT_H_
#define VERILATED_VSEQUENTIAL___024ROOT_H_  // guard

#include "verilated.h"

class Vsequential__Syms;
VL_MODULE(Vsequential___024root) {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(BCD,3,0);
    VL_IN8(reset,0,0);
    VL_OUT8(divisible,0,0);
    CData/*3:0*/ seqdiv__DOT__internal_bcd;
    CData/*3:0*/ seqdiv__DOT__reduced;
    CData/*0:0*/ __Vclklast__TOP__clk;

    // INTERNAL VARIABLES
    Vsequential__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
    Vsequential___024root(const char* name);
    ~Vsequential___024root();
    VL_UNCOPYABLE(Vsequential___024root);

    // INTERNAL METHODS
    void __Vconfigure(Vsequential__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
