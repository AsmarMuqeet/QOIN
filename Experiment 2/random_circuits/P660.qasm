OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
sxdg q[0];
p(1.7689908973380943) q[0];
rz(0.6270008267228586) q[1];
x q[1];
cswap q[2],q[3],q[4];
u(0.1354167649428375,4.874148777479807,6.215642929116083) q[3];
cu1(6.239949666168705) q[4],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
