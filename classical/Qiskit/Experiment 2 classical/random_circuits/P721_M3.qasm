OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-2.5462064596653144) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(2.5116071072013084) q0; ry(-2.5116071072013084) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(2.5462064596653144) q1; }
gate xx_plus_yy(param0,param1) q0,q1 { rz(2.387729764945257) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.6630111750406866) q1; ry(-1.6630111750406866) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-2.387729764945257) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.447898740736538) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P721 q0,q1,q2,q3,q4 { rx(5.37407945295297) q0; p(2.708093816117036) q1; ry(5.998944414326408) q1; u1(5.593207837210351) q2; ryy(4.447898740736538) q0,q2; xx_plus_yy(3.3260223500813733,2.387729764945257) q4,q3; xx_minus_yy(5.023214214402617,2.5462064596653144) q4,q3; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P721 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
