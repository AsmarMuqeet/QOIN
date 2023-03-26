OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.279466221041608) q1; cx q0,q1; h q1; }
gate xx_plus_yy(param0,param1) q0,q1 { rz(0.054266078391249264) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.684502371096292) q1; ry(-1.684502371096292) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-0.054266078391249264) q0; }
qreg q[5];
creg c[3];
rzx(2.279466221041608) q[0],q[1];
z q[0];
sdg q[1];
u2(4.2286350798871215,3.545100304064341) q[2];
sdg q[2];
ry(5.988200633891811) q[3];
u(4.91298999402952,0.48111028366087927,4.269997672855842) q[4];
xx_plus_yy(3.369004742192584,0.054266078391249264) q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
