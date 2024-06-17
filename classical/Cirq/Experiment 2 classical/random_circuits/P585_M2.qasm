OPENQASM 2.0;
include "qelib1.inc";
gate gate_P585 q0,q1,q2,q3,q4 { h q1; cswap q2,q0,q3; swap q0,q1; u1(0.4143862934171598) q2; h q4; rzz(3.1289989591859406) q3,q4; cswap q2,q4,q0; rzz(1.430885262640508) q3,q1; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P585 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
