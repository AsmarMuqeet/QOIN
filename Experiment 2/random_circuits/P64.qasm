OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
s q[2];
ccx q[3],q[0],q[1];
u2(0.7419837936779291,4.3966335352228745) q[0];
x q[1];
z q[3];
rz(0.7039277744297677) q[4];
cu3(6.157556184370507,4.388622791433297,1.1011485273310306) q[4],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
