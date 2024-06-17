OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[7];
creg c[3];
ry(4.411116610484219) q[3];
rz(3.653541991215089) q[4];
cy q[2],q[5];
rx(5.489744047605182) q[2];
cy q[5],q[3];
cswap q[0],q[6],q[1];
u(0.26010679751526616,5.442227083987246,4.56953293984608) q[0];
u1(6.0070059343860205) q[1];
dcx q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
