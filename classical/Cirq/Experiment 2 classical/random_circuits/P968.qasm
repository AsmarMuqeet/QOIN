OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(2.7527921342793435) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-2.1943097308547297) q1; ry(-2.1943097308547297) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-2.7527921342793435) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.9632548368963865) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[2];
t q[0];
cu1(0.4980176075327129) q[2],q[1];
xx_plus_yy(4.388619461709459,2.7527921342793435) q[4],q[3];
s q[3];
u3(4.892951653684647,2.152878204593308,0.15770619325520446) q[5];
u1(3.3328825884962114) q[5];
t q[6];
rzx(0.9632548368963865) q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
