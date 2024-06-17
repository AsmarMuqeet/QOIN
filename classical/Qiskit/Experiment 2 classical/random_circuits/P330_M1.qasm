OPENQASM 2.0;
include "qelib1.inc";
gate gate_P330 q0,q1,q2,q3,q4,q5,q6 { rx(0.7670742986345847) q0; z q0; sdg q2; cx q4,q3; sdg q4; y q5; cy q1,q6; cz q1,q2; rccx q5,q6,q3; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P330 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
