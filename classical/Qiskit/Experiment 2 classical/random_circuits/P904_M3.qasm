OPENQASM 2.0;
include "qelib1.inc";
gate gate_P904 q0,q1,q2,q3,q4 { t q0; rx(0.8461861314603487) q1; tdg q1; sxdg q3; cu3(1.7418451239956538,3.9333172519759767,4.468753637055255) q4,q2; id q2; cswap q3,q4,q0; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P904 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
