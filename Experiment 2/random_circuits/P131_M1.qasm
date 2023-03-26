OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-4.969208160639773) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(0.35187116106590405) q0; ry(-0.35187116106590405) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(4.969208160639773) q1; }
gate gate_P131 q0,q1,q2,q3,q4,q5,q6 { id q0; csx q3,q1; tdg q1; rxx(4.187293552150614) q3,q0; rxx(2.2445586155797903) q4,q5; xx_minus_yy(0.7037423221318081,4.969208160639773) q4,q5; rxx(0.18589759285692375) q2,q6; tdg q2; rz(1.2752704449711214) q6; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[4];
gate_P131 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
