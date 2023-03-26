OPENQASM 2.0;
include "qelib1.inc";
gate gate_P629 q0,q1,q2,q3,q4 { sxdg q0; id q2; cy q0,q2; z q3; sdg q3; cp(0.48602747845033967) q1,q4; cy q4,q1; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P629 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
