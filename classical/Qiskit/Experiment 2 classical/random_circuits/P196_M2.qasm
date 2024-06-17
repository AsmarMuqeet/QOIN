OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.2656038905896883) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.359875471641848) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P196 q0,q1,q2,q3,q4 { h q1; sxdg q3; swap q3,q1; cy q1,q3; cswap q4,q0,q2; ryy(5.359875471641848) q0,q2; rz(0.21982780104595617) q0; z q4; rzx(1.2656038905896883) q2,q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P196 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
