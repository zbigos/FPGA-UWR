// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsequential.h for the primary calling header

#include "verilated.h"

#include "Vsequential___024root.h"

extern const VlUnpacked<CData/*3:0*/, 16> Vsequential__ConstPool__TABLE_ha0e50855_0;

VL_ATTR_COLD void Vsequential___024root___settle__TOP__2(Vsequential___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsequential__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsequential___024root___settle__TOP__2\n"); );
    // Init
    CData/*3:0*/ __Vtableidx1;
    // Body
    vlSelf->divisible = (0U == (IData)(vlSelf->seqdiv__DOT__internal_bcd));
    __Vtableidx1 = (0xfU & ((IData)(vlSelf->seqdiv__DOT__internal_bcd) 
                            + (IData)(vlSelf->BCD)));
    vlSelf->seqdiv__DOT__reduced = Vsequential__ConstPool__TABLE_ha0e50855_0
        [__Vtableidx1];
}

VL_ATTR_COLD void Vsequential___024root___eval_initial(Vsequential___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsequential__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsequential___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vclklast__TOP__clk = vlSelf->clk;
}

VL_ATTR_COLD void Vsequential___024root___eval_settle(Vsequential___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsequential__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsequential___024root___eval_settle\n"); );
    // Body
    Vsequential___024root___settle__TOP__2(vlSelf);
}

VL_ATTR_COLD void Vsequential___024root___final(Vsequential___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsequential__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsequential___024root___final\n"); );
}

VL_ATTR_COLD void Vsequential___024root___ctor_var_reset(Vsequential___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsequential__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsequential___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->BCD = VL_RAND_RESET_I(4);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->clk = VL_RAND_RESET_I(1);
    vlSelf->divisible = VL_RAND_RESET_I(1);
    vlSelf->seqdiv__DOT__internal_bcd = VL_RAND_RESET_I(4);
    vlSelf->seqdiv__DOT__reduced = VL_RAND_RESET_I(4);
}
