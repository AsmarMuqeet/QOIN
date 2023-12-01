OPENQASM 2.0;
include "qelib1.inc";
gate gate_P704 q0,q1,q2,q3,q4 { h q0; sdg q1; s q1; rxx(4.370518996570358) q2,q3; cy q3,q2; rzz(4.622787718848993) q1,q2; h q3; sdg q4; cp(5.408895709648776) q0,q4; rxx(4.162491066321308) q0,q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P704 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
