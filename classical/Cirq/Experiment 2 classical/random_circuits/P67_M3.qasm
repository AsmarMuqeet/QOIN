OPENQASM 2.0;
include "qelib1.inc";
gate gate_P67 q0,q1,q2,q3,q4 { t q0; swap q1,q3; rx(2.677748676677843) q1; x q3; csx q2,q4; cy q0,q2; s q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P67 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
