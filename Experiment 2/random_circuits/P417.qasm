OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
rx(0.7843706533006164) q[2];
cswap q[3],q[0],q[1];
h q[0];
s q[3];
t q[4];
cswap q[2],q[1],q[4];
swap q[1],q[2];
cswap q[4],q[3],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
