OPENQASM 2.0;
include "qelib1.inc";
gate gate_P344 q0,q1,q2,q3,q4,q5,q6 { rx(3.939800002645895) q2; z q2; t q3; t q3; cu1(0.47341106653470394) q0,q4; cu1(4.6426733999478715) q5,q1; cswap q0,q4,q1; u2(2.950059491892983,2.006162134168978) q6; cy q5,q6; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P344 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
