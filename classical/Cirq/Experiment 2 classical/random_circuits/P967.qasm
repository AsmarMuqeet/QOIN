OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.842595404527845) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
u1(2.859538561040956) q[0];
s q[2];
id q[3];
rzx(1.842595404527845) q[3],q[2];
cx q[1],q[4];
swap q[0],q[1];
rx(2.7642948604680804) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
