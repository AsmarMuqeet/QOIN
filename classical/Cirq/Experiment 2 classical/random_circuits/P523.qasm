OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
sx q[0];
sxdg q[0];
csx q[1],q[2];
sx q[3];
csx q[2],q[3];
rx(6.095528204562359) q[2];
sx q[4];
csx q[1],q[4];
cswap q[3],q[1],q[0];
ccx q[1],q[0],q[2];
u1(1.420062653706502) q[4];
crx(0.634837988440171) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];