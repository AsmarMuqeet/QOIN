OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
p(0.12707975757661397) q[0];
cy q[1],q[2];
rzz(0.2755557853589292) q[1],q[2];
y q[3];
u(1.616293309835608,3.9041028171230834,5.4507251748639955) q[4];
cswap q[4],q[0],q[3];
swap q[0],q[1];
cp(4.297509398627329) q[2],q[4];
sxdg q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
