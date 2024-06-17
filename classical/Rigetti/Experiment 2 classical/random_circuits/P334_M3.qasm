OPENQASM 2.0;
include "qelib1.inc";
gate gate_P334 q0,q1,q2,q3,q4 { z q1; sxdg q1; cu3(3.5866360269052793,5.738569496694393,4.167258892648037) q2,q0; z q0; sx q0; sxdg q2; sx q2; sdg q3; rz(5.800612118922261) q3; cu1(3.772693227891325) q1,q3; u2(0.10037131532840439,0.7031779842002698) q4; x q4; t q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P334 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
