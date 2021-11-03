// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vdiv3_comb.h"
#include "Vdiv3_comb__Syms.h"

//============================================================
// Constructors

Vdiv3_comb::Vdiv3_comb(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new Vdiv3_comb__Syms(_vcontextp__, _vcname__, this)}
    , divisible{vlSymsp->TOP.divisible}
    , BCD{vlSymsp->TOP.BCD}
    , rootp{&(vlSymsp->TOP)}
{
}

Vdiv3_comb::Vdiv3_comb(const char* _vcname__)
    : Vdiv3_comb(nullptr, _vcname__)
{
}

//============================================================
// Destructor

Vdiv3_comb::~Vdiv3_comb() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void Vdiv3_comb___024root___eval_initial(Vdiv3_comb___024root* vlSelf);
void Vdiv3_comb___024root___eval_settle(Vdiv3_comb___024root* vlSelf);
void Vdiv3_comb___024root___eval(Vdiv3_comb___024root* vlSelf);
#ifdef VL_DEBUG
void Vdiv3_comb___024root___eval_debug_assertions(Vdiv3_comb___024root* vlSelf);
#endif  // VL_DEBUG
void Vdiv3_comb___024root___final(Vdiv3_comb___024root* vlSelf);

static void _eval_initial_loop(Vdiv3_comb__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    Vdiv3_comb___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        Vdiv3_comb___024root___eval_settle(&(vlSymsp->TOP));
        Vdiv3_comb___024root___eval(&(vlSymsp->TOP));
    } while (0);
}

void Vdiv3_comb::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vdiv3_comb::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vdiv3_comb___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        Vdiv3_comb___024root___eval(&(vlSymsp->TOP));
    } while (0);
}

//============================================================
// Invoke final blocks

void Vdiv3_comb::final() {
    Vdiv3_comb___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Utilities

VerilatedContext* Vdiv3_comb::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* Vdiv3_comb::name() const {
    return vlSymsp->name();
}
