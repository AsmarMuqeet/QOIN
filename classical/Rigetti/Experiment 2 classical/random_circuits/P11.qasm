OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.7777054659824579) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
rzx(0.7777054659824579) q[1],q[0];
p(0.9535267565709636) q[2];
cz q[4],q[3];
swap q[1],q[4];
cswap q[2],q[0],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
