OPENQASM 2.0;
include "qelib1.inc";
gate gate_P68 q0,q1,q2,q3,q4 { ry(1.7593414459910837) q1; u1(0.7112157178894141) q2; z q3; swap q3,q1; z q3; swap q4,q0; sxdg q0; cu3(2.188438266444179,4.167363528654553,0.19335944789831808) q1,q0; rzz(4.016126446048291) q2,q4; tdg q2; rx(0.2037931399728088) q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P68 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
