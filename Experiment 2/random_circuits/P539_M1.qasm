OPENQASM 2.0;
include "qelib1.inc";
gate gate_P539 q0,q1,q2,q3,q4 { tdg q1; z q1; cswap q0,q3,q2; cu1(2.366610755529474) q0,q3; sxdg q4; cx q4,q2; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P539 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
