OPENQASM 2.0;
include "qelib1.inc";
gate gate_P283 q0,q1,q2,q3,q4,q5,q6 { s q1; ry(5.746601376454368) q1; cy q2,q0; z q4; swap q4,q2; rzz(0.26389141822473894) q3,q5; cx q5,q3; x q6; cy q0,q6; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[4];
gate_P283 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
