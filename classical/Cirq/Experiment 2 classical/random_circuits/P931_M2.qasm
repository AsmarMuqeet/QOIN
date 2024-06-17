OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate gate_P931 q0,q1,q2,q3,q4 { sx q2; z q2; cp(0.6568798913860435) q0,q3; y q3; csx q1,q4; csx q0,q1; cx q0,q2; ry(2.749474893755949) q1; u1(6.031858583315723) q4; iswap q4,q3; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[4];
gate_P931 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
