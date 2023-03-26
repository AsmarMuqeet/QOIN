OPENQASM 2.0;
include "qelib1.inc";
gate gate_P255 q0,q1,q2,q3,q4 { id q1; s q1; z q2; p(1.1234621488341372) q2; s q3; z q3; cp(0.20403493502064102) q0,q4; s q0; z q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P255 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
