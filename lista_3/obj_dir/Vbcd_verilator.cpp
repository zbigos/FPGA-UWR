// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vbcd_verilator.h"
#include "Vbcd_verilator__Syms.h"

//============================================================
// Constructors

Vbcd_verilator::Vbcd_verilator(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new Vbcd_verilator__Syms(_vcontextp__, _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , reset{vlSymsp->TOP.reset}
    , BCD_SL{vlSymsp->TOP.BCD_SL}
    , BCD_SH{vlSymsp->TOP.BCD_SH}
    , BCD_ML{vlSymsp->TOP.BCD_ML}
    , BCD_MH{vlSymsp->TOP.BCD_MH}
    , rootp{&(vlSymsp->TOP)}
{
}

Vbcd_verilator::Vbcd_verilator(const char* _vcname__)
    : Vbcd_verilator(nullptr, _vcname__)
{
}

//============================================================
// Destructor

Vbcd_verilator::~Vbcd_verilator() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void Vbcd_verilator___024root___eval_initial(Vbcd_verilator___024root* vlSelf);
void Vbcd_verilator___024root___eval_settle(Vbcd_verilator___024root* vlSelf);
void Vbcd_verilator___024root___eval(Vbcd_verilator___024root* vlSelf);
QData Vbcd_verilator___024root___change_request(Vbcd_verilator___024root* vlSelf);
#ifdef VL_DEBUG
void Vbcd_verilator___024root___eval_debug_assertions(Vbcd_verilator___024root* vlSelf);
#endif  // VL_DEBUG
void Vbcd_verilator___024root___final(Vbcd_verilator___024root* vlSelf);

static void _eval_initial_loop(Vbcd_verilator__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    Vbcd_verilator___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        Vbcd_verilator___024root___eval_settle(&(vlSymsp->TOP));
        Vbcd_verilator___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = Vbcd_verilator___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("bcd_verilator.v", 38, "",
                "Verilated model didn't DC converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = Vbcd_verilator___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vbcd_verilator::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vbcd_verilator::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vbcd_verilator___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        Vbcd_verilator___024root___eval(&(vlSymsp->TOP));
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = Vbcd_verilator___024root___change_request(&(vlSymsp->TOP));
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("bcd_verilator.v", 38, "",
                "Verilated model didn't converge\n"
                "- See https://verilator.org/warn/DIDNOTCONVERGE");
        } else {
            __Vchange = Vbcd_verilator___024root___change_request(&(vlSymsp->TOP));
        }
    } while (VL_UNLIKELY(__Vchange));
}

//============================================================
// Invoke final blocks

void Vbcd_verilator::final() {
    Vbcd_verilator___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* Vbcd_verilator::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* Vbcd_verilator::name() const {
    return vlSymsp->name();
}
