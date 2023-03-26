OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(1.6196484697806708) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-2.500378957986012) q1; ry(-2.500378957986012) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-1.6196484697806708) q0; }
gate r(param0,param1) q0 { u3(3.854944595628864,2.412135477553442,-2.412135477553442) q0; }
gate gate_P699 q0,q1,q2,q3,q4 { u1(4.5542848605077015) q0; sxdg q0; u3(0.704013592366427,3.7003926569657892,2.49002530862114) q2; r(3.854944595628864,3.9829318043483384) q2; rx(1.0685159952850773) q3; csx q1,q4; tdg q1; xx_plus_yy(5.000757915972024,1.6196484697806708) q4,q3; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[4];
gate_P699 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
