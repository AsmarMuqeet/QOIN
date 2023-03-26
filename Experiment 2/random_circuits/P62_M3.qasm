OPENQASM 2.0;
include "qelib1.inc";
gate gate_P62 q0,q1,q2,q3,q4 { t q0; id q0; u3(1.21866923487575,5.830781759821964,5.79376462432185) q0; swap q1,q2; cu1(5.089304151431912) q2,q1; sx q1; id q2; swap q3,q4; tdg q3; z q4; ch q3,q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P62 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
