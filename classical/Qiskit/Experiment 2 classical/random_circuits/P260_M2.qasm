OPENQASM 2.0;
include "qelib1.inc";
gate gate_P260 q0,q1,q2,q3,q4 { cswap q1,q2,q3; u3(3.508459769549818,3.950079339380783,1.3306415031192091) q1; t q3; swap q4,q0; cswap q0,q2,q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[2];
gate_P260 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
