OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.359875471641848) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.2656038905896883) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
h q[1];
sxdg q[3];
swap q[3],q[1];
cy q[1],q[3];
cswap q[4],q[0],q[2];
ryy(5.359875471641848) q[0],q[2];
rz(0.21982780104595617) q[0];
z q[4];
rzx(1.2656038905896883) q[2],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
