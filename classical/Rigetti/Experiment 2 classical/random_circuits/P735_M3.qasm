OPENQASM 2.0;
include "qelib1.inc";
gate gate_P735 q0,q1,q2,q3,q4,q5,q6 { rz(6.164674137488132) q1; swap q2,q4; h q2; ry(4.092055257591808) q4; rz(0.4492269574446878) q5; x q5; cswap q3,q6,q0; cu3(1.5632996355810755,2.616432863494672,5.389189258943694) q1,q0; ch q6,q3; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P735 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
