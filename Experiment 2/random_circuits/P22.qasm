OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
t q[0];
p(3.5112084170877553) q[0];
sx q[1];
rxx(4.028495014108873) q[2],q[3];
cy q[2],q[3];
sx q[4];
csx q[4],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
