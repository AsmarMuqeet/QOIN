OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
h q[0];
t q[2];
z q[2];
cx q[1],q[3];
t q[1];
swap q[3],q[0];
tdg q[4];
h q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];