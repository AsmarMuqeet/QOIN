OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
tdg q[1];
cu1(4.472441374229275) q[0],q[2];
h q[0];
cx q[1],q[2];
id q[3];
ry(2.901345678267651) q[4];
cu(3.590391055336578,5.238636441799797,3.417686679991033,0.9565186938460075) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];