OPENQASM 2.0;
include "qelib1.inc";
gate gate_P505 q0,q1,q2,q3,q4 { tdg q0; tdg q0; cy q2,q3; swap q3,q2; cy q4,q1; s q1; x q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P505 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
