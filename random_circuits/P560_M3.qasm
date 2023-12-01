OPENQASM 2.0;
include "qelib1.inc";
gate gate_P560 q0,q1,q2,q3,q4 { cx q1,q0; sx q0; t q2; sxdg q3; cswap q2,q3,q1; sx q4; sdg q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P560 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
