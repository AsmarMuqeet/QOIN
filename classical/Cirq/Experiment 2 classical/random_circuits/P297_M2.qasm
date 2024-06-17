OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.04808082919410165) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P297 q0,q1,q2,q3,q4 { h q0; h q0; x q0; s q1; sdg q1; ryy(0.04808082919410165) q3,q2; p(3.734982187529072) q2; rz(3.9356191551158597) q3; cy q1,q3; sxdg q4; y q4; swap q4,q2; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P297 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
