OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
swap q[2],q[0];
ccx q[4],q[1],q[5];
y q[4];
cy q[5],q[1];
cx q[6],q[3];
cu1(0.3976994974781996) q[2],q[3];
cx q[6],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];