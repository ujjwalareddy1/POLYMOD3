pragma circom 2.0.0;


template FirstCircuit () {  
   // input signals
   signal input a;
   signal input b;

   // Internal input signals

   signal x;
   signal y;

   // output signals
   signal output Q;

   // component
   component andGate = AND();
   component orGate = OR();
   component notGate = NOT();

   // logic

   andGate.a <== a;
   andGate.b <== b;
   x <== andGate.y;

   notGate.in <== b;
   y <== notGate.out;

   orGate.a <== x;
   orGate.b <== y;
   Q <== orGate.y;
}

template AND(){
   signal input a;
   signal input b;
   signal output y;
   y <== a*b;
}

template OR(){
   signal input a;
   signal input b;
   signal output y;
   y <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = FirstCircuit();