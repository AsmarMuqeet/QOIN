OPENQASM 2.0;
include "qelib1.inc";
gate gate_P271 q0,q1,q2,q3,q4 { swap q1,q2; csx q3,q0; p(0.4760840486417024) q0; swap q3,q1; u(4.6420485346471505,1.937567000276202,2.343309338730245) q4; cz q2,q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P271 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
