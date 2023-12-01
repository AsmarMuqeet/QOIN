OPENQASM 2.0;
include "qelib1.inc";
gate gate_P276 q0,q1,q2,q3,q4 { id q0; sx q1; s q1; csx q3,q2; swap q2,q0; tdg q4; cry(5.39667822827565) q3,q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P276 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
