OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(1.8008042146443013) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-2.5403248303990953) q1; ry(-2.5403248303990953) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-1.8008042146443013) q0; }
qreg q[7];
creg c[3];
u1(4.3495418894178455) q[2];
rz(4.018812886594935) q[2];
cy q[0],q[3];
t q[3];
cx q[4],q[1];
cu1(1.7899572153070584) q[1],q[0];
u1(3.0196103861186043) q[4];
xx_plus_yy(5.080649660798191,1.8008042146443013) q[5],q[6];
rx(1.7646514049479767) q[5];
s q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
