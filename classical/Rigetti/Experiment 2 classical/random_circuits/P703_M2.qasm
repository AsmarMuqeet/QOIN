OPENQASM 2.0;
include "qelib1.inc";
gate gate_P703 q0,q1,q2,q3,q4,q5,q6 { cu3(3.3750252662962086,1.9637516354481048,0.49450097108447355) q1,q2; u1(1.6338122680348208) q2; rxx(2.567562702483567) q0,q3; swap q0,q1; rx(0.6623451286824863) q4; cy q4,q3; sdg q5; s q5; sdg q6; id q6; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P703 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
