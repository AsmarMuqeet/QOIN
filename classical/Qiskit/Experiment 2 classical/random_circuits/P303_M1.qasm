OPENQASM 2.0;
include "qelib1.inc";
gate gate_P303 q0,q1,q2,q3,q4,q5,q6 { s q0; rx(4.829890538577326) q3; u1(2.5916963055008364) q3; swap q5,q4; tdg q4; rx(4.039959566123153) q5; cswap q1,q6,q2; cp(3.5494009107229316) q0,q6; x q1; s q2; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P303 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
