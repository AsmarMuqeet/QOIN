OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
qreg q[5];
creg c[3];
sx q[2];
z q[2];
cp(0.6568798913860435) q[0],q[3];
y q[3];
csx q[1],q[4];
csx q[0],q[1];
cx q[0],q[2];
ry(2.749474893755949) q[1];
u1(6.031858583315723) q[4];
iswap q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
