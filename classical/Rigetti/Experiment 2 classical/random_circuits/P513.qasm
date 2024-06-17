OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
qreg q[7];
creg c[3];
sx q[0];
tdg q[0];
cp(5.413197494743739) q[2],q[4];
swap q[1],q[5];
cz q[2],q[5];
cp(2.4284255752173896) q[4],q[1];
cy q[3],q[6];
iswap q[3],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
