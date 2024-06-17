OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.695544652049819) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P573 q0,q1,q2,q3,q4 { tdg q2; cp(5.017357673063508) q3,q0; u1(0.45163920264267526) q3; csx q1,q4; ryy(5.695544652049819) q1,q0; cy q2,q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P573 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
