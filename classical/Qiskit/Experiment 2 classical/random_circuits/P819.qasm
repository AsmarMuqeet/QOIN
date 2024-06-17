OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.557632163465023) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.301185312105838) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
h q[0];
ryy(0.557632163465023) q[3],q[2];
rzx(3.301185312105838) q[1],q[4];
swap q[0],q[1];
cswap q[3],q[4],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
