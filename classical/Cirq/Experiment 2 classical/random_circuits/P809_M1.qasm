OPENQASM 2.0;
include "qelib1.inc";
gate gate_P809 q0,q1,q2,q3,q4,q5,q6 { u(1.5058039923844742,3.5512742489389195,2.945214477830107) q0; s q2; x q4; s q4; cz q3,q5; id q3; cswap q5,q2,q0; cy q6,q1; csx q6,q1; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[2];
gate_P809 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
