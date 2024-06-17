OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.891136515866814) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
swap q[0],q[1];
h q[0];
u(1.1531762800766145,2.761968142062423,0.9133875619668382) q[3];
rzx(5.891136515866814) q[4],q[2];
cswap q[1],q[4],q[3];
p(0.4693329453875089) q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
