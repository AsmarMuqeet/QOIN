OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-2.254677158561785) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(3.059116831165685) q0; ry(-3.059116831165685) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(2.254677158561785) q1; }
gate gate_P922 q0,q1,q2,q3,q4,q5,q6 { y q0; u1(3.0277448968050296) q2; id q2; tdg q3; sxdg q4; xx_minus_yy(6.11823366233137,2.254677158561785) q4,q3; sxdg q5; csx q6,q1; cp(2.046721885106996) q0,q6; cu(5.865421685212811,2.5701457872606306,2.548794850130152,6.112743317426957) q5,q1; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[2];
gate_P922 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
