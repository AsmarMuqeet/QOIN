OPENQASM 2.0;
include "qelib1.inc";
gate gate_P431 q0,q1,q2,q3,q4 { y q1; tdg q1; csx q2,q0; t q0; cp(0.6176228775019398) q3,q4; cz q3,q2; z q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P431 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
