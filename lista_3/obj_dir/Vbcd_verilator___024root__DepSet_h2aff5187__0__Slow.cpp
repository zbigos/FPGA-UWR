// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vbcd_verilator.h for the primary calling header

#include "verilated.h"

#include "Vbcd_verilator___024root.h"

VL_ATTR_COLD void Vbcd_verilator___024root___settle__TOP__2(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___settle__TOP__2\n"); );
    // Body
    vlSelf->BCD_SL = vlSelf->bcd_verilator__DOT__SL__DOT__istate;
    vlSelf->BCD_SH = vlSelf->bcd_verilator__DOT__SH__DOT__istate;
    vlSelf->BCD_ML = vlSelf->bcd_verilator__DOT__ML__DOT__istate;
    vlSelf->BCD_MH = vlSelf->bcd_verilator__DOT__MH__DOT__istate;
}

VL_ATTR_COLD void Vbcd_verilator___024root___eval_initial(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vclklast__TOP__clk = vlSelf->clk;
    vlSelf->__Vclklast__TOP__reset = vlSelf->reset;
    vlSelf->__Vclklast__TOP____VinpClk__TOP__bcd_verilator__DOT__SL__DOT__inext 
        = vlSelf->__VinpClk__TOP__bcd_verilator__DOT__SL__DOT__inext;
    vlSelf->__Vclklast__TOP____VinpClk__TOP__bcd_verilator__DOT__SH__DOT__inext 
        = vlSelf->__VinpClk__TOP__bcd_verilator__DOT__SH__DOT__inext;
    vlSelf->__Vclklast__TOP____VinpClk__TOP__bcd_verilator__DOT__ML__DOT__inext 
        = vlSelf->__VinpClk__TOP__bcd_verilator__DOT__ML__DOT__inext;
}

VL_ATTR_COLD void Vbcd_verilator___024root___eval_settle(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___eval_settle\n"); );
    // Body
    Vbcd_verilator___024root___settle__TOP__2(vlSelf);
}

VL_ATTR_COLD void Vbcd_verilator___024root___final(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___final\n"); );
}

VL_ATTR_COLD void Vbcd_verilator___024root___ctor_var_reset(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clk = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->BCD_SL = VL_RAND_RESET_I(4);
    vlSelf->BCD_SH = VL_RAND_RESET_I(4);
    vlSelf->BCD_ML = VL_RAND_RESET_I(4);
    vlSelf->BCD_MH = VL_RAND_RESET_I(4);
    vlSelf->bcd_verilator__DOT__SL__DOT__istate = VL_RAND_RESET_I(4);
    vlSelf->bcd_verilator__DOT__SL__DOT__inext = VL_RAND_RESET_I(1);
    vlSelf->bcd_verilator__DOT__SH__DOT__istate = VL_RAND_RESET_I(4);
    vlSelf->bcd_verilator__DOT__SH__DOT__inext = VL_RAND_RESET_I(1);
    vlSelf->bcd_verilator__DOT__ML__DOT__istate = VL_RAND_RESET_I(4);
    vlSelf->bcd_verilator__DOT__ML__DOT__inext = VL_RAND_RESET_I(1);
    vlSelf->bcd_verilator__DOT__MH__DOT__istate = VL_RAND_RESET_I(4);
    vlSelf->__VinpClk__TOP__bcd_verilator__DOT__SL__DOT__inext = VL_RAND_RESET_I(1);
    vlSelf->__VinpClk__TOP__bcd_verilator__DOT__SH__DOT__inext = VL_RAND_RESET_I(1);
    vlSelf->__VinpClk__TOP__bcd_verilator__DOT__ML__DOT__inext = VL_RAND_RESET_I(1);
    vlSelf->__Vchglast__TOP__bcd_verilator__DOT__SL__DOT__inext = VL_RAND_RESET_I(1);
    vlSelf->__Vchglast__TOP__bcd_verilator__DOT__SH__DOT__inext = VL_RAND_RESET_I(1);
    vlSelf->__Vchglast__TOP__bcd_verilator__DOT__ML__DOT__inext = VL_RAND_RESET_I(1);
}
