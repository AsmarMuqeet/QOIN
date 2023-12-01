OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate gate_P513 q0,q1,q2,q3,q4,q5,q6 { sx q0; tdg q0; cp(5.413197494743739) q2,q4; swap q1,q5; cz q2,q5; cp(2.4284255752173896) q4,q1; cy q3,q6; iswap q3,q6; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P513 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
