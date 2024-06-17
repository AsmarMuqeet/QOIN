OPENQASM 2.0;
include "qelib1.inc";
gate gate_P517 q0,q1,q2,q3,q4 { sx q2; t q2; cswap q1,q0,q3; h q0; tdg q3; rx(4.204591787702536) q4; cz q4,q1; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P517 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
