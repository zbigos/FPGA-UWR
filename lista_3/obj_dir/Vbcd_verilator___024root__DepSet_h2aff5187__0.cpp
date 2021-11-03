// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vbcd_verilator.h for the primary calling header

#include "verilated.h"

#include "Vbcd_verilator___024root.h"

VL_INLINE_OPT void Vbcd_verilator___024root___sequent__TOP__1(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___sequent__TOP__1\n"); );
    // Init
    CData/*3:0*/ __Vdly__bcd_verilator__DOT__SL__DOT__istate;
    // Body
    __Vdly__bcd_verilator__DOT__SL__DOT__istate = vlSelf->bcd_verilator__DOT__SL__DOT__istate;
    if (vlSelf->reset) {
        __Vdly__bcd_verilator__DOT__SL__DOT__istate = 0U;
        vlSelf->bcd_verilator__DOT__SL__DOT__inext = 0U;
    } else if ((9U == (IData)(vlSelf->bcd_verilator__DOT__SL__DOT__istate))) {
        __Vdly__bcd_verilator__DOT__SL__DOT__istate = 0U;
        vlSelf->bcd_verilator__DOT__SL__DOT__inext = 1U;
    } else {
        if ((1U == (IData)(vlSelf->bcd_verilator__DOT__SL__DOT__istate))) {
            vlSelf->bcd_verilator__DOT__SL__DOT__inext = 0U;
        }
        __Vdly__bcd_verilator__DOT__SL__DOT__istate 
            = (0xfU & ((IData)(1U) + (IData)(vlSelf->bcd_verilator__DOT__SL__DOT__istate)));
    }
    vlSelf->bcd_verilator__DOT__SL__DOT__istate = __Vdly__bcd_verilator__DOT__SL__DOT__istate;
    vlSelf->BCD_SL = vlSelf->bcd_verilator__DOT__SL__DOT__istate;
}

VL_INLINE_OPT void Vbcd_verilator___024root___sequent__TOP__3(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___sequent__TOP__3\n"); );
    // Init
    CData/*3:0*/ __Vdly__bcd_verilator__DOT__SH__DOT__istate;
    // Body
    __Vdly__bcd_verilator__DOT__SH__DOT__istate = vlSelf->bcd_verilator__DOT__SH__DOT__istate;
    if (vlSelf->reset) {
        __Vdly__bcd_verilator__DOT__SH__DOT__istate = 0U;
        vlSelf->bcd_verilator__DOT__SH__DOT__inext = 0U;
    } else if ((5U == (IData)(vlSelf->bcd_verilator__DOT__SH__DOT__istate))) {
        __Vdly__bcd_verilator__DOT__SH__DOT__istate = 0U;
        vlSelf->bcd_verilator__DOT__SH__DOT__inext = 1U;
    } else {
        if ((1U == (IData)(vlSelf->bcd_verilator__DOT__SH__DOT__istate))) {
            vlSelf->bcd_verilator__DOT__SH__DOT__inext = 0U;
        }
        __Vdly__bcd_verilator__DOT__SH__DOT__istate 
            = (0xfU & ((IData)(1U) + (IData)(vlSelf->bcd_verilator__DOT__SH__DOT__istate)));
    }
    vlSelf->bcd_verilator__DOT__SH__DOT__istate = __Vdly__bcd_verilator__DOT__SH__DOT__istate;
    vlSelf->BCD_SH = vlSelf->bcd_verilator__DOT__SH__DOT__istate;
}

VL_INLINE_OPT void Vbcd_verilator___024root___sequent__TOP__4(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___sequent__TOP__4\n"); );
    // Init
    CData/*3:0*/ __Vdly__bcd_verilator__DOT__ML__DOT__istate;
    // Body
    __Vdly__bcd_verilator__DOT__ML__DOT__istate = vlSelf->bcd_verilator__DOT__ML__DOT__istate;
    if (vlSelf->reset) {
        __Vdly__bcd_verilator__DOT__ML__DOT__istate = 0U;
        vlSelf->bcd_verilator__DOT__ML__DOT__inext = 0U;
    } else if ((9U == (IData)(vlSelf->bcd_verilator__DOT__ML__DOT__istate))) {
        __Vdly__bcd_verilator__DOT__ML__DOT__istate = 0U;
        vlSelf->bcd_verilator__DOT__ML__DOT__inext = 1U;
    } else {
        if ((1U == (IData)(vlSelf->bcd_verilator__DOT__ML__DOT__istate))) {
            vlSelf->bcd_verilator__DOT__ML__DOT__inext = 0U;
        }
        __Vdly__bcd_verilator__DOT__ML__DOT__istate 
            = (0xfU & ((IData)(1U) + (IData)(vlSelf->bcd_verilator__DOT__ML__DOT__istate)));
    }
    vlSelf->bcd_verilator__DOT__ML__DOT__istate = __Vdly__bcd_verilator__DOT__ML__DOT__istate;
    vlSelf->BCD_ML = vlSelf->bcd_verilator__DOT__ML__DOT__istate;
}

VL_INLINE_OPT void Vbcd_verilator___024root___sequent__TOP__5(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___sequent__TOP__5\n"); );
    // Body
    vlSelf->bcd_verilator__DOT__MH__DOT__istate = ((IData)(vlSelf->reset)
                                                    ? 0U
                                                    : 
                                                   ((5U 
                                                     == (IData)(vlSelf->bcd_verilator__DOT__MH__DOT__istate))
                                                     ? 0U
                                                     : 
                                                    (0xfU 
                                                     & ((IData)(1U) 
                                                        + (IData)(vlSelf->bcd_verilator__DOT__MH__DOT__istate)))));
    vlSelf->BCD_MH = vlSelf->bcd_verilator__DOT__MH__DOT__istate;
}

void Vbcd_verilator___024root___eval(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___eval\n"); );
    // Body
    if ((((IData)(vlSelf->clk) & (~ (IData)(vlSelf->__Vclklast__TOP__clk))) 
         | ((IData)(vlSelf->reset) & (~ (IData)(vlSelf->__Vclklast__TOP__reset))))) {
        Vbcd_verilator___024root___sequent__TOP__1(vlSelf);
    }
    if ((((IData)(vlSelf->__VinpClk__TOP__bcd_verilator__DOT__SL__DOT__inext) 
          & (~ (IData)(vlSelf->__Vclklast__TOP____VinpClk__TOP__bcd_verilator__DOT__SL__DOT__inext))) 
         | ((IData)(vlSelf->reset) & (~ (IData)(vlSelf->__Vclklast__TOP__reset))))) {
        Vbcd_verilator___024root___sequent__TOP__3(vlSelf);
    }
    if ((((IData)(vlSelf->__VinpClk__TOP__bcd_verilator__DOT__SH__DOT__inext) 
          & (~ (IData)(vlSelf->__Vclklast__TOP____VinpClk__TOP__bcd_verilator__DOT__SH__DOT__inext))) 
         | ((IData)(vlSelf->reset) & (~ (IData)(vlSelf->__Vclklast__TOP__reset))))) {
        Vbcd_verilator___024root___sequent__TOP__4(vlSelf);
    }
    if ((((IData)(vlSelf->__VinpClk__TOP__bcd_verilator__DOT__ML__DOT__inext) 
          & (~ (IData)(vlSelf->__Vclklast__TOP____VinpClk__TOP__bcd_verilator__DOT__ML__DOT__inext))) 
         | ((IData)(vlSelf->reset) & (~ (IData)(vlSelf->__Vclklast__TOP__reset))))) {
        Vbcd_verilator___024root___sequent__TOP__5(vlSelf);
    }
    // Final
    vlSelf->__Vclklast__TOP__clk = vlSelf->clk;
    vlSelf->__Vclklast__TOP__reset = vlSelf->reset;
    vlSelf->__Vclklast__TOP____VinpClk__TOP__bcd_verilator__DOT__SL__DOT__inext 
        = vlSelf->__VinpClk__TOP__bcd_verilator__DOT__SL__DOT__inext;
    vlSelf->__Vclklast__TOP____VinpClk__TOP__bcd_verilator__DOT__SH__DOT__inext 
        = vlSelf->__VinpClk__TOP__bcd_verilator__DOT__SH__DOT__inext;
    vlSelf->__Vclklast__TOP____VinpClk__TOP__bcd_verilator__DOT__ML__DOT__inext 
        = vlSelf->__VinpClk__TOP__bcd_verilator__DOT__ML__DOT__inext;
    vlSelf->__VinpClk__TOP__bcd_verilator__DOT__SL__DOT__inext 
        = vlSelf->bcd_verilator__DOT__SL__DOT__inext;
    vlSelf->__VinpClk__TOP__bcd_verilator__DOT__SH__DOT__inext 
        = vlSelf->bcd_verilator__DOT__SH__DOT__inext;
    vlSelf->__VinpClk__TOP__bcd_verilator__DOT__ML__DOT__inext 
        = vlSelf->bcd_verilator__DOT__ML__DOT__inext;
}

QData Vbcd_verilator___024root___change_request_1(Vbcd_verilator___024root* vlSelf);

VL_INLINE_OPT QData Vbcd_verilator___024root___change_request(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___change_request\n"); );
    // Body
    return (Vbcd_verilator___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData Vbcd_verilator___024root___change_request_1(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    __req |= ((vlSelf->bcd_verilator__DOT__SL__DOT__inext ^ vlSelf->__Vchglast__TOP__bcd_verilator__DOT__SL__DOT__inext)
         | (vlSelf->bcd_verilator__DOT__SH__DOT__inext ^ vlSelf->__Vchglast__TOP__bcd_verilator__DOT__SH__DOT__inext)
         | (vlSelf->bcd_verilator__DOT__ML__DOT__inext ^ vlSelf->__Vchglast__TOP__bcd_verilator__DOT__ML__DOT__inext));
    VL_DEBUG_IF( if(__req && ((vlSelf->bcd_verilator__DOT__SL__DOT__inext ^ vlSelf->__Vchglast__TOP__bcd_verilator__DOT__SL__DOT__inext))) VL_DBG_MSGF("        CHANGE: bcd_verilator.v:14: bcd_verilator.SL.inext\n"); );
    VL_DEBUG_IF( if(__req && ((vlSelf->bcd_verilator__DOT__SH__DOT__inext ^ vlSelf->__Vchglast__TOP__bcd_verilator__DOT__SH__DOT__inext))) VL_DBG_MSGF("        CHANGE: bcd_verilator.v:14: bcd_verilator.SH.inext\n"); );
    VL_DEBUG_IF( if(__req && ((vlSelf->bcd_verilator__DOT__ML__DOT__inext ^ vlSelf->__Vchglast__TOP__bcd_verilator__DOT__ML__DOT__inext))) VL_DBG_MSGF("        CHANGE: bcd_verilator.v:14: bcd_verilator.ML.inext\n"); );
    // Final
    vlSelf->__Vchglast__TOP__bcd_verilator__DOT__SL__DOT__inext 
        = vlSelf->bcd_verilator__DOT__SL__DOT__inext;
    vlSelf->__Vchglast__TOP__bcd_verilator__DOT__SH__DOT__inext 
        = vlSelf->bcd_verilator__DOT__SH__DOT__inext;
    vlSelf->__Vchglast__TOP__bcd_verilator__DOT__ML__DOT__inext 
        = vlSelf->bcd_verilator__DOT__ML__DOT__inext;
    return __req;
}

#ifdef VL_DEBUG
void Vbcd_verilator___024root___eval_debug_assertions(Vbcd_verilator___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vbcd_verilator__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbcd_verilator___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG
