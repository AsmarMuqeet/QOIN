OPENQASM 2.0;
include "qelib1.inc";
gate gate_P22 q0,q1,q2,q3,q4 { t q0; p(3.5112084170877553) q0; sx q1; rxx(4.028495014108873) q2,q3; cy q2,q3; sx q4; csx q4,q1; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P22 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
