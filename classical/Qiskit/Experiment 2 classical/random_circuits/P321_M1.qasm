OPENQASM 2.0;
include "qelib1.inc";
gate gate_P321 q0,q1,q2,q3,q4,q5,q6 { y q1; z q1; y q3; cswap q0,q2,q5; cu3(1.5276010835137988,0.2934879341872796,2.038422309432966) q3,q0; csx q4,q6; swap q2,q4; ch q6,q5; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P321 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
