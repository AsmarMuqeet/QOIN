OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.878192233393787) q1; cx q0,q1; h q1; }
gate gate_P562 q0,q1,q2,q3,q4 { id q0; sxdg q2; cswap q3,q1,q4; rzx(3.878192233393787) q1,q0; t q3; cx q4,q2; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P562 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
