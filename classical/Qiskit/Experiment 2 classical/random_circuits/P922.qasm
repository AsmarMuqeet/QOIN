OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-2.254677158561785) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(3.059116831165685) q0; ry(-3.059116831165685) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(2.254677158561785) q1; }
qreg q[7];
creg c[3];
y q[0];
u1(3.0277448968050296) q[2];
id q[2];
tdg q[3];
sxdg q[4];
xx_minus_yy(6.11823366233137,2.254677158561785) q[4],q[3];
sxdg q[5];
csx q[6],q[1];
cp(2.046721885106996) q[0],q[6];
cu(5.865421685212811,2.5701457872606306,2.548794850130152,6.112743317426957) q[5],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
