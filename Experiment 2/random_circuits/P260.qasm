OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
cswap q[1],q[2],q[3];
u3(3.508459769549818,3.950079339380783,1.3306415031192091) q[1];
t q[3];
swap q[4],q[0];
cswap q[0],q[2],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
