OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(3.307241629635564) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.4193032573747464) q1; ry(-1.4193032573747464) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-3.307241629635564) q0; }
qreg q[5];
creg c[3];
ry(2.3506155079034228) q[2];
y q[2];
csx q[0],q[3];
sx q[0];
cu(4.782782282197876,1.7725065658723658,5.006977687317782,5.693320083664708) q[4],q[1];
y q[1];
xx_plus_yy(2.8386065147494928,3.307241629635564) q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
