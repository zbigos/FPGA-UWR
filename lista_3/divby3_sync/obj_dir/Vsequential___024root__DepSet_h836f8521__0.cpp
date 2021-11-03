// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsequential.h for the primary calling header

#include "verilated.h"

#include "Vsequential___024root.h"

VL_INLINE_OPT void Vsequential___024root___sequent__TOP__1(Vsequential___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsequential__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsequential___024root___sequent__TOP__1\n"); );
    // Body
    vlSelf->seqdiv__DOT__internal_bcd = ((IData)(vlSelf->reset)
                                          ? 0U : (IData)(vlSelf->seqdiv__DOT__reduced));
    vlSelf->divisible = (0U == (IData)(vlSelf->seqdiv__DOT__internal_bcd));
}

extern const VlUnpacked<CData/*3:0*/, 16> Vsequential__ConstPool__TABLE_ha0e50855_0;

VL_INLINE_OPT void Vsequential___024root___combo__TOP__3(Vsequential___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsequential__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsequential___024root___combo__TOP__3\n"); );
    // Init
    CData/*3:0*/ __Vtableidx1;
    // Body
    __Vtableidx1 = (0xfU & ((IData)(vlSelf->seqdiv__DOT__internal_bcd) 
                            + (IData)(vlSelf->BCD)));
    vlSelf->seqdiv__DOT__reduced = Vsequential__ConstPool__TABLE_ha0e50855_0
        [__Vtableidx1];
}

void Vsequential___024root___eval(Vsequential___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsequential__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsequential___024root___eval\n"); );
    // Body
    if (((IData)(vlSelf->clk) & (~ (IData)(vlSelf->__Vclklast__TOP__clk)))) {
        Vsequential___024root___sequent__TOP__1(vlSelf);
    }
    Vsequential___024root___combo__TOP__3(vlSelf);
    // Final
    vlSelf->__Vclklast__TOP__clk = vlSelf->clk;
}

#ifdef VL_DEBUG
void Vsequential___024root___eval_debug_assertions(Vsequential___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vsequential__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsequential___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->BCD & 0xf0U))) {
        Verilated::overWidthError("BCD");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((vlSelf->clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
}
#endif  // VL_DEBUG
