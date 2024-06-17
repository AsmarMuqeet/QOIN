OPENQASM 2.0;
include "qelib1.inc";
gate gate_P751 q0,q1,q2,q3,q4 { csx q1,q2; cy q0,q3; u2(0.9511096460288126,0.4129949238351132) q0; sdg q3; tdg q4; ccx q4,q1,q2; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P751 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
