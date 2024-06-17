OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.32901333498882) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
p(3.202564708795079) q[0];
id q[2];
rxx(1.3293362492636027) q[2],q[0];
cswap q[3],q[4],q[1];
ryy(5.32901333498882) q[1],q[4];
tdg q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
