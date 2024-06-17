OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
sx q[1];
s q[1];
z q[2];
cswap q[3],q[0],q[4];
cp(0.010461969850206289) q[3],q[2];
cu3(0.24527523226195952,1.4451530729564974,3.1051283312542384) q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];