OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
h q[0];
rz(2.21394388901094) q[0];
u1(0.536020206221248) q[2];
u(2.164310116460137,3.9600530507658394,6.148042466004868) q[2];
sxdg q[3];
id q[3];
swap q[4],q[1];
t q[1];
t q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
