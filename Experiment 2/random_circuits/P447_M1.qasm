OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate gate_P447 q0,q1,q2,q3,q4,q5,q6 { ry(4.411116610484219) q3; rz(3.653541991215089) q4; cy q2,q5; rx(5.489744047605182) q2; cy q5,q3; cswap q0,q6,q1; u(0.26010679751526616,5.442227083987246,4.56953293984608) q0; u1(6.0070059343860205) q1; dcx q4,q6; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[2];
gate_P447 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
