OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(1.8008042146443013) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-2.5403248303990953) q1; ry(-2.5403248303990953) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-1.8008042146443013) q0; }
gate gate_P327 q0,q1,q2,q3,q4,q5,q6 { u1(4.3495418894178455) q2; rz(4.018812886594935) q2; cy q0,q3; t q3; cx q4,q1; cu1(1.7899572153070584) q1,q0; u1(3.0196103861186043) q4; xx_plus_yy(5.080649660798191,1.8008042146443013) q5,q6; rx(1.7646514049479767) q5; s q6; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P327 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
