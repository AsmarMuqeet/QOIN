OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(5.713325803439902) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.6125955925879203) q1; ry(-1.6125955925879203) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-5.713325803439902) q0; }
gate gate_P752 q0,q1,q2,q3,q4 { rxx(1.4372259372612564) q1,q3; x q1; cswap q4,q0,q2; u2(4.816110292586731,1.7869650215021509) q0; tdg q2; xx_plus_yy(3.2251911851758406,5.713325803439902) q3,q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P752 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
