OPENQASM 2.0;
include "qelib1.inc";
gate gate_P217 q0,q1,q2,q3,q4 { ry(2.304724031270375) q0; rz(4.169724886712672) q1; rx(0.9431100966631242) q1; h q3; swap q0,q3; csx q4,q2; csx q2,q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P217 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
