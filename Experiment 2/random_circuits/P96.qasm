OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.8509373234844504) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
ryy(0.8509373234844504) q[2],q[0];
x q[3];
sxdg q[3];
csx q[4],q[1];
cu1(0.8532576918742608) q[0],q[4];
cy q[2],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
