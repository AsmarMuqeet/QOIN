OPENQASM 2.0;
include "qelib1.inc";
gate gate_P939 q0,q1,q2,q3,q4 { cswap q2,q0,q1; cu3(1.820499745566517,4.071473006429841,2.2777886825845446) q1,q2; z q3; cx q0,q3; t q4; rx(1.8947486413801218) q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P939 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
