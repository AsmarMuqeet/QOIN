OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.527861838711424) q1; cx q0,q1; h q1; }
gate gate_P514 q0,q1,q2,q3,q4 { rzx(3.527861838711424) q1,q2; cy q3,q0; rxx(2.0978992740605555) q1,q0; sx q4; ccx q4,q2,q3; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P514 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
