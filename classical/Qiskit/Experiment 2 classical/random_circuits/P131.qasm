OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-4.969208160639773) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(0.35187116106590405) q0; ry(-0.35187116106590405) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(4.969208160639773) q1; }
qreg q[7];
creg c[3];
id q[0];
csx q[3],q[1];
tdg q[1];
rxx(4.187293552150614) q[3],q[0];
rxx(2.2445586155797903) q[4],q[5];
xx_minus_yy(0.7037423221318081,4.969208160639773) q[4],q[5];
rxx(0.18589759285692375) q[2],q[6];
tdg q[2];
rz(1.2752704449711214) q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
