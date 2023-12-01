OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate gate_P865 q0,q1,q2,q3,q4 { t q1; p(1.8444752263995898) q1; cz q0,q2; h q0; id q2; z q3; u(0.1912601781415962,4.500787465768071,0.14229448058536273) q4; iswap q4,q3; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P865 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
