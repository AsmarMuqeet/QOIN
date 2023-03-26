OPENQASM 2.0;
include "qelib1.inc";
gate gate_P267 q0,q1,q2,q3,q4 { x q0; sxdg q2; swap q0,q2; cx q3,q1; sx q1; h q4; cu1(5.2247765987756605) q3,q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P267 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
