OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
sxdg q[0];
h q[0];
sxdg q[1];
u1(4.915880605235506) q[2];
h q[2];
sx q[4];
cu1(1.6089704207887368) q[5],q[3];
cz q[4],q[3];
x q[5];
t q[6];
swap q[6],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];