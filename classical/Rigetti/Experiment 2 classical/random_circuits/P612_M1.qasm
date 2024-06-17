OPENQASM 2.0;
include "qelib1.inc";
gate gate_P612 q0,q1,q2,q3,q4 { swap q1,q0; sdg q3; cp(4.3167872351709295) q4,q2; ccx q1,q2,q0; rxx(4.2117914495108595) q3,q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P612 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
