OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
cp(1.5529714669614472) q[3],q[2];
cswap q[0],q[4],q[1];
cy q[0],q[3];
cy q[1],q[2];
s q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];