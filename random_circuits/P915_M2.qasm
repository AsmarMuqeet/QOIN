OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(3.307241629635564) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.4193032573747464) q1; ry(-1.4193032573747464) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-3.307241629635564) q0; }
gate gate_P915 q0,q1,q2,q3,q4 { ry(2.3506155079034228) q2; y q2; csx q0,q3; sx q0; cu(4.782782282197876,1.7725065658723658,5.006977687317782,5.693320083664708) q4,q1; y q1; xx_plus_yy(2.8386065147494928,3.307241629635564) q3,q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[4];
gate_P915 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
