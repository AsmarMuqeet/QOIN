OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.9632548368963865) q1; cx q0,q1; h q1; }
gate xx_plus_yy(param0,param1) q0,q1 { rz(2.7527921342793435) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-2.1943097308547297) q1; ry(-2.1943097308547297) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-2.7527921342793435) q0; }
gate gate_P968 q0,q1,q2,q3,q4,q5,q6 { ccx q1,q0,q2; t q0; cu1(0.4980176075327129) q2,q1; xx_plus_yy(4.388619461709459,2.7527921342793435) q4,q3; s q3; u3(4.892951653684647,2.152878204593308,0.15770619325520446) q5; u1(3.3328825884962114) q5; t q6; rzx(0.9632548368963865) q4,q6; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P968 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
