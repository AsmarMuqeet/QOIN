OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
id q[0];
p(4.629763720360341) q[1];
tdg q[2];
swap q[4],q[3];
rzz(3.118629813098806) q[1],q[4];
rx(3.30629648191956) q[3];
rx(4.919848887450741) q[5];
u(1.3548103488245218,5.762849148995288,0.061071204112963094) q[5];
h q[6];
cswap q[2],q[6],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];