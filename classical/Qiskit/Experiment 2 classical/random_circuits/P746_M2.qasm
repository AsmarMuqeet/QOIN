OPENQASM 2.0;
include "qelib1.inc";
gate gate_P746 q0,q1,q2,q3,q4 { swap q2,q0; u(4.549870227225368,0.8010648710498779,5.766504983479226) q0; sxdg q0; swap q3,q1; sdg q1; swap q3,q2; u2(1.2298946687142287,5.401726092496531) q2; h q4; rz(2.732643228736223) q4; cswap q1,q4,q3; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P746 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
