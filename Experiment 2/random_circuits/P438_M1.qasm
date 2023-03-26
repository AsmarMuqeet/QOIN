OPENQASM 2.0;
include "qelib1.inc";
gate gate_P438 q0,q1,q2,q3,q4 { ry(2.7707403700969606) q0; u3(3.4718347757429706,6.007369367854069,5.592882869981253) q0; x q2; rz(2.916114160172073) q2; u2(4.088504480045027,4.72848720366681) q3; sdg q3; cy q4,q1; s q1; sxdg q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P438 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
