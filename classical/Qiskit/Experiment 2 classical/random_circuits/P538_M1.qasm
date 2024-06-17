OPENQASM 2.0;
include "qelib1.inc";
gate gate_P538 q0,q1,q2,q3,q4 { cx q0,q3; ccx q4,q1,q2; id q1; cz q2,q0; cz q3,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P538 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
