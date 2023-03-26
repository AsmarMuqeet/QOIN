OPENQASM 2.0;
include "qelib1.inc";
gate gate_P417 q0,q1,q2,q3,q4 { rx(0.7843706533006164) q2; cswap q3,q0,q1; h q0; s q3; t q4; cswap q2,q1,q4; swap q1,q2; cswap q4,q3,q0; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P417 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
