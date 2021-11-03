// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vsequential.h"
#include "Vsequential__Syms.h"

//============================================================
// Constructors

Vsequential::Vsequential(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new Vsequential__Syms(_vcontextp__, _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , BCD{vlSymsp->TOP.BCD}
    , reset{vlSymsp->TOP.reset}
    , divisible{vlSymsp->TOP.divisible}
    , rootp{&(vlSymsp->TOP)}
{
}

Vsequential::Vsequential(const char* _vcname__)
    : Vsequential(nullptr, _vcname__)
{
}

//============================================================
// Destructor

Vsequential::~Vsequential() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void Vsequential___024root___eval_initial(Vsequential___024root* vlSelf);
void Vsequential___024root___eval_settle(Vsequential___024root* vlSelf);
void Vsequential___024root___eval(Vsequential___024root* vlSelf);
#ifdef VL_DEBUG
void Vsequential___024root___eval_debug_assertions(Vsequential___024root* vlSelf);
#endif  // VL_DEBUG
void Vsequential___024root___final(Vsequential___024root* vlSelf);

static void _eval_initial_loop(Vsequential__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    Vsequential___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        Vsequential___024root___eval_settle(&(vlSymsp->TOP));
        Vsequential___024root___eval(&(vlSymsp->TOP));
    } while (0);
}

void Vsequential::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vsequential::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vsequential___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        Vsequential___024root___eval(&(vlSymsp->TOP));
    } while (0);
}

//============================================================
// Invoke final blocks

void Vsequential::final() {
    Vsequential___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* Vsequential::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* Vsequential::name() const {
    return vlSymsp->name();
}
