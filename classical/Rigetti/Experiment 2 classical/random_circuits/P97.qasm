OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
id q[1];
y q[1];
ry(2.3656562342963974) q[2];
id q[2];
cswap q[0],q[3],q[4];
rx(5.375095025820171) q[0];
h q[3];
rx(1.1537821046254417) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];