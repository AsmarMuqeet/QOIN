OPENQASM 2.0;
include "qelib1.inc";
gate gate_P474 q0,q1,q2,q3,q4 { s q0; csx q1,q2; id q2; cu1(0.4494981335664246) q4,q3; cz q0,q3; swap q1,q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P474 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
