OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.4853865512614854) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
t q[1];
sdg q[3];
cswap q[2],q[4],q[0];
ryy(1.4853865512614854) q[1],q[0];
id q[2];
swap q[6],q[5];
sdg q[5];
cswap q[6],q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
