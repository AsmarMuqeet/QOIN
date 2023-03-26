OPENQASM 2.0;
include "qelib1.inc";
gate gate_P421 q0,q1,q2,q3,q4 { p(0.12707975757661397) q0; cy q1,q2; rzz(0.2755557853589292) q1,q2; y q3; u(1.616293309835608,3.9041028171230834,5.4507251748639955) q4; cswap q4,q0,q3; swap q0,q1; cp(4.297509398627329) q2,q4; sxdg q3; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P421 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
