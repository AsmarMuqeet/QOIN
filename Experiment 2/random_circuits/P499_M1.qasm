OPENQASM 2.0;
include "qelib1.inc";
gate gate_P499 q0,q1,q2,q3,q4 { h q0; u1(4.6841811502641555) q1; cp(3.692153771999709) q0,q1; rzz(0.6046195556382226) q2,q3; t q2; sdg q3; tdg q4; sx q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P499 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
