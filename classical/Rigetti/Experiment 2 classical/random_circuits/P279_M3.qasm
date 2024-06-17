OPENQASM 2.0;
include "qelib1.inc";
gate gate_P279 q0,q1,q2,q3,q4 { rx(4.85669238868001) q0; cx q3,q2; p(4.399805714619058) q2; rxx(3.103037236516199) q3,q0; swap q1,q4; t q1; sdg q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[0];
gate_P279 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
