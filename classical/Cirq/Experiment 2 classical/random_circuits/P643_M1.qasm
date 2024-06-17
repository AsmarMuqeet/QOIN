OPENQASM 2.0;
include "qelib1.inc";
gate gate_P643 q0,q1,q2,q3,q4 { cswap q2,q3,q0; s q2; cx q1,q4; cu(1.218870459505023,5.819700645515775,2.1661923627678616,5.4827782286128155) q1,q3; csx q4,q0; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P643 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
