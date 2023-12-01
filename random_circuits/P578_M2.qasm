OPENQASM 2.0;
include "qelib1.inc";
gate gate_P578 q0,q1,q2,q3,q4 { u1(5.930560186903045) q0; y q2; cy q2,q0; cx q1,q3; csx q3,q1; sxdg q4; sdg q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P578 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
