OPENQASM 2.0;
include "qelib1.inc";
gate ryy_139921317329168(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.6661968225851034) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.2508913390903704) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.44811852645491596) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P583 q0,q1,q2,q3,q4,q5,q6 { swap q1,q0; ry(4.988286074610193) q0; h q3; ryy(0.44811852645491596) q3,q1; rzx(1.2508913390903704) q2,q4; sxdg q4; x q5; ryy_139921317329168(0.6661968225851034) q2,q5; sxdg q6; u1(3.3210709709797435) q6; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[4];
gate_P583 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
