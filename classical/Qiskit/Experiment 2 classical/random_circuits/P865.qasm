OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
qreg q[5];
creg c[3];
t q[1];
p(1.8444752263995898) q[1];
cz q[0],q[2];
h q[0];
id q[2];
z q[3];
u(0.1912601781415962,4.500787465768071,0.14229448058536273) q[4];
iswap q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
