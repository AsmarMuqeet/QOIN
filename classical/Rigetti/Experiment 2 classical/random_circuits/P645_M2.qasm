OPENQASM 2.0;
include "qelib1.inc";
gate gate_P645 q0,q1,q2,q3,q4 { sdg q1; rzz(1.9108312276424237) q0,q2; h q3; ccx q1,q3,q0; u3(0.5373049428434997,5.0676940074825,5.35943345822372) q4; cu3(1.7094005588339631,1.3300586857050796,3.6323760834790386) q2,q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[3];
gate_P645 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
