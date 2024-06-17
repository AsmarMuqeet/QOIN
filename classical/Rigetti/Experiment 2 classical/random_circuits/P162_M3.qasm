OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.32901333498882) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P162 q0,q1,q2,q3,q4 { p(3.202564708795079) q0; id q2; rxx(1.3293362492636027) q2,q0; cswap q3,q4,q1; ryy(5.32901333498882) q1,q4; tdg q3; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P162 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
