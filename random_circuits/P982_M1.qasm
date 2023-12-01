OPENQASM 2.0;
include "qelib1.inc";
gate gate_P982 q0,q1,q2,q3,q4 { u2(3.8390698513619,3.1956710960471666) q0; sxdg q0; u3(1.6598731054561853,0.22586827456639225,3.9487622902646895) q0; p(4.343554073240351) q1; rx(0.06636149611001854) q1; id q1; ccx q3,q4,q2; sdg q2; p(0.8336843158766413) q3; t q4; ccx q4,q2,q3; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P982 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
