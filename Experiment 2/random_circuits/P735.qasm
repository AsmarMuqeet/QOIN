OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
rz(6.164674137488132) q[1];
swap q[2],q[4];
h q[2];
ry(4.092055257591808) q[4];
rz(0.4492269574446878) q[5];
x q[5];
cswap q[3],q[6],q[0];
cu3(1.5632996355810755,2.616432863494672,5.389189258943694) q[1],q[0];
ch q[6],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
