OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.0248113698453585) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[3];
h q[1];
u2(0.9787768842410906,4.899485181811682) q[2];
cx q[4],q[0];
rzx(3.0248113698453585) q[0],q[3];
id q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
