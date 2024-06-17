OPENQASM 2.0;
include "qelib1.inc";
gate gate_P766 q0,q1,q2,q3,q4 { h q0; t q2; z q2; cx q1,q3; t q1; swap q3,q0; tdg q4; h q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P766 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
