OPENQASM 2.0;
include "qelib1.inc";
gate gate_P82 q0,q1,q2,q3,q4 { u1(2.6676585462993048) q1; rz(1.6291461340746707) q1; sdg q2; z q3; cz q3,q2; cp(3.6680118030454922) q0,q4; csx q4,q0; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P82 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
