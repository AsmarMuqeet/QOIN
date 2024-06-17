OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.44811852645491596) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.2508913390903704) q1; cx q0,q1; h q1; }
gate ryy_139921317329168(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.6661968225851034) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
swap q[1],q[0];
ry(4.988286074610193) q[0];
h q[3];
ryy(0.44811852645491596) q[3],q[1];
rzx(1.2508913390903704) q[2],q[4];
sxdg q[4];
x q[5];
ryy_139921317329168(0.6661968225851034) q[2],q[5];
sxdg q[6];
u1(3.3210709709797435) q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
