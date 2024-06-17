OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.2217224459746994) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
cswap q[2],q[0],q[3];
h q[4];
cx q[1],q[5];
swap q[1],q[3];
ryy(1.2217224459746994) q[2],q[5];
ry(3.142387084628769) q[6];
cswap q[4],q[6],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
