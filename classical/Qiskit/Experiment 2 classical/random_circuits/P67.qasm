OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
t q[0];
swap q[1],q[3];
rx(2.677748676677843) q[1];
x q[3];
csx q[2],q[4];
cy q[0],q[2];
s q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];