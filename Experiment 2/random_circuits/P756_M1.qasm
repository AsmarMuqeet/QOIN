OPENQASM 2.0;
include "qelib1.inc";
gate gate_P756 q0,q1,q2,q3,q4 { sdg q0; sdg q1; z q1; t q2; sxdg q2; z q3; ry(5.005041691050888) q3; x q4; cx q0,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P756 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
