OPENQASM 2.0;
include "qelib1.inc";
gate gate_P361 q0,q1,q2,q3,q4 { ccx q0,q1,q2; tdg q0; s q3; rz(2.1810199783146946) q3; u2(0.9105101577382928,0.46345079162444036) q4; cswap q1,q4,q2; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[3];
gate_P361 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
