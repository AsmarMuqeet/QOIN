OPENQASM 2.0;
include "qelib1.inc";
gate gate_P814 q0,q1,q2,q3,q4,q5,q6 { p(5.075853924861641) q0; sxdg q3; id q3; sxdg q4; cx q4,q0; cp(5.774077135609417) q5,q1; z q1; u1(4.269107553872259) q5; cu(3.7755871825298213,0.7152704689742209,0.576479075150957,0.9534042628714421) q6,q2; tdg q2; x q6; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P814 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
