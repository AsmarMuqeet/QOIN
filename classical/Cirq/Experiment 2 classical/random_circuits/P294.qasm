OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
sxdg q[0];
s q[2];
u(3.0266576839208104,5.464336007088942,2.4674634652267033) q[2];
rzz(0.8906092435163988) q[1],q[3];
t q[1];
ry(6.07110989210006) q[3];
y q[4];
cz q[0],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];