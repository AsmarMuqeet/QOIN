OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.5093857002655454) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
rzx(0.5093857002655454) q[0],q[1];
h q[0];
ccx q[2],q[4],q[3];
cp(2.0980634554179436) q[1],q[2];
u1(4.093937865905606) q[1];
cz q[4],q[3];
swap q[0],q[3];
swap q[4],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
