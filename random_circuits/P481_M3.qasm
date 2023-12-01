OPENQASM 2.0;
include "qelib1.inc";
gate gate_P481 q0,q1,q2,q3,q4 { u2(4.177769106562509,5.159580143140517) q0; swap q3,q2; cswap q0,q3,q2; cz q1,q4; sx q1; tdg q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P481 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
