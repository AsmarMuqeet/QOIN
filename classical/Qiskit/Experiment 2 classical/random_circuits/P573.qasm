OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.695544652049819) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
tdg q[2];
cp(5.017357673063508) q[3],q[0];
u1(0.45163920264267526) q[3];
csx q[1],q[4];
ryy(5.695544652049819) q[1],q[0];
cy q[2],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
