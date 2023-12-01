OPENQASM 2.0;
include "qelib1.inc";
gate gate_P788 q0,q1,q2,q3,q4 { u2(2.0140507970367167,2.814680622359091) q1; sxdg q2; t q2; rxx(4.4289343931665455) q3,q0; csx q0,q1; z q4; swap q4,q3; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P788 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
