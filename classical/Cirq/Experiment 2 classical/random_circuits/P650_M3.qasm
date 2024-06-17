OPENQASM 2.0;
include "qelib1.inc";
gate gate_P650 q0,q1,q2,q3,q4 { y q0; sdg q0; rx(4.6733029659079035) q1; csx q2,q3; cy q1,q3; ry(3.36082379260299) q4; csx q2,q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P650 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
