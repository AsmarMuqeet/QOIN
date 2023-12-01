OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.6142906078365757) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy_139921317436864(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.105242683833664) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
p(5.039915235085013) q[0];
rz(5.571191475642004) q[0];
ryy(3.6142906078365757) q[3],q[1];
rx(3.9833847066998866) q[3];
ryy_139921317436864(6.105242683833664) q[2],q[4];
cx q[1],q[4];
x q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
