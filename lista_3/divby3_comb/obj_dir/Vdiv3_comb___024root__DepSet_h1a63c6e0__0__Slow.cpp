// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vdiv3_comb.h for the primary calling header

#include "verilated.h"

#include "Vdiv3_comb___024root.h"

VL_ATTR_COLD void Vdiv3_comb___024root___eval_initial(Vdiv3_comb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vdiv3_comb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdiv3_comb___024root___eval_initial\n"); );
}

void Vdiv3_comb___024root___combo__TOP__1(Vdiv3_comb___024root* vlSelf);

VL_ATTR_COLD void Vdiv3_comb___024root___eval_settle(Vdiv3_comb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vdiv3_comb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdiv3_comb___024root___eval_settle\n"); );
    // Body
    Vdiv3_comb___024root___combo__TOP__1(vlSelf);
}

VL_ATTR_COLD void Vdiv3_comb___024root___final(Vdiv3_comb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vdiv3_comb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdiv3_comb___024root___final\n"); );
}

VL_ATTR_COLD void Vdiv3_comb___024root___ctor_var_reset(Vdiv3_comb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vdiv3_comb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdiv3_comb___024root___ctor_var_reset\n"); );
    // Body
    for (int __Vi0=0; __Vi0<48; ++__Vi0) {
        vlSelf->BCD[__Vi0] = VL_RAND_RESET_I(4);
    }
    vlSelf->divisible = VL_RAND_RESET_I(1);
    for (int __Vi0=0; __Vi0<48; ++__Vi0) {
        vlSelf->top__DOT____Vcellinp__r__BCD[__Vi0] = VL_RAND_RESET_I(4);
    }
    for (int __Vi0=0; __Vi0<48; ++__Vi0) {
        vlSelf->top__DOT__r__DOT__reduced[__Vi0] = VL_RAND_RESET_I(4);
    }
    for (int __Vi0=0; __Vi0<6; ++__Vi0) {
        vlSelf->top__DOT__r__DOT__genblk2__DOT__compacted[__Vi0] = VL_RAND_RESET_I(4);
    }
    for (int __Vi0=0; __Vi0<6; ++__Vi0) {
        vlSelf->top__DOT__r__DOT____Vcellinp__genblk2__DOT__q__BCD[__Vi0] = VL_RAND_RESET_I(4);
    }
    for (int __Vi0=0; __Vi0<6; ++__Vi0) {
        vlSelf->top__DOT__r__DOT__genblk2__DOT__q__DOT__reduced[__Vi0] = VL_RAND_RESET_I(4);
    }
    for (int __Vi0=0; __Vi0<1; ++__Vi0) {
        vlSelf->top__DOT__r__DOT__genblk2__DOT__q__DOT__genblk2__DOT__compacted[__Vi0] = VL_RAND_RESET_I(4);
    }
    for (int __Vi0=0; __Vi0<1; ++__Vi0) {
        vlSelf->top__DOT__r__DOT__genblk2__DOT__q__DOT____Vcellinp__genblk2__DOT__q__BCD[__Vi0] = VL_RAND_RESET_I(4);
    }
    for (int __Vi0=0; __Vi0<1; ++__Vi0) {
        vlSelf->top__DOT__r__DOT__genblk2__DOT__q__DOT__genblk2__DOT__q__DOT__reduced[__Vi0] = VL_RAND_RESET_I(4);
    }
}
