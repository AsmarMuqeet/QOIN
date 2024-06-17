OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.527861838711424) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
rzx(3.527861838711424) q[1],q[2];
cy q[3],q[0];
rxx(2.0978992740605555) q[1],q[0];
sx q[4];
ccx q[4],q[2],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
