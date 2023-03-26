OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.23576402997813) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
sxdg q[2];
ccx q[3],q[1],q[0];
ryy(4.23576402997813) q[0],q[2];
id q[1];
u2(3.986910686789912,6.0194654837223265) q[4];
csx q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
