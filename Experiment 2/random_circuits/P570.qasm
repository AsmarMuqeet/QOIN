OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
x q[0];
rz(3.8964606756872513) q[1];
t q[2];
cy q[1],q[2];
tdg q[3];
cy q[3],q[0];
x q[4];
z q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
