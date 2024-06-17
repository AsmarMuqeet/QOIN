OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(0.1940225542116833) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.5813980327980992) q1; ry(-1.5813980327980992) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-0.1940225542116833) q0; }
gate gate_P516 q0,q1,q2,q3,q4,q5,q6 { rxx(0.33497998993805284) q2,q3; sdg q2; u1(1.5451146789653591) q4; z q5; xx_plus_yy(3.1627960655961984,0.1940225542116833) q3,q5; ccx q0,q6,q1; u3(3.505148282565844,5.286298889951539,0.3727007006813735) q1; rxx(3.0494405970590774) q4,q0; z q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[3];
gate_P516 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
