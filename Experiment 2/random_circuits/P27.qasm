OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.910107373188529) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
u2(3.8054862374623704,5.3705672881051045) q[2];
x q[2];
u2(0.42391259556737965,4.608879290743862) q[2];
h q[3];
cswap q[0],q[1],q[4];
rxx(0.698645079930347) q[1],q[3];
rzx(5.910107373188529) q[4],q[0];
cu1(2.537000719884058) q[0],q[1];
swap q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
