// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vdiv3_comb.h for the primary calling header

#ifndef VERILATED_VDIV3_COMB___024ROOT_H_
#define VERILATED_VDIV3_COMB___024ROOT_H_  // guard

#include "verilated.h"

class Vdiv3_comb__Syms;
VL_MODULE(Vdiv3_comb___024root) {
  public:

    // DESIGN SPECIFIC STATE
    VL_OUT8(divisible,0,0);
    VL_IN8(BCD[48],3,0);
    VlUnpacked<CData/*3:0*/, 48> top__DOT____Vcellinp__r__BCD;
    VlUnpacked<CData/*3:0*/, 48> top__DOT__r__DOT__reduced;
    VlUnpacked<CData/*3:0*/, 6> top__DOT__r__DOT__genblk2__DOT__compacted;
    VlUnpacked<CData/*3:0*/, 6> top__DOT__r__DOT____Vcellinp__genblk2__DOT__q__BCD;
    VlUnpacked<CData/*3:0*/, 6> top__DOT__r__DOT__genblk2__DOT__q__DOT__reduced;
    VlUnpacked<CData/*3:0*/, 1> top__DOT__r__DOT__genblk2__DOT__q__DOT__genblk2__DOT__compacted;
    VlUnpacked<CData/*3:0*/, 1> top__DOT__r__DOT__genblk2__DOT__q__DOT____Vcellinp__genblk2__DOT__q__BCD;
    VlUnpacked<CData/*3:0*/, 1> top__DOT__r__DOT__genblk2__DOT__q__DOT__genblk2__DOT__q__DOT__reduced;

    // INTERNAL VARIABLES
    Vdiv3_comb__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
    Vdiv3_comb___024root(const char* name);
    ~Vdiv3_comb___024root();
    VL_UNCOPYABLE(Vdiv3_comb___024root);

    // INTERNAL METHODS
    void __Vconfigure(Vdiv3_comb__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
