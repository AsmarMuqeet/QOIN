OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.878192233393787) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
id q[0];
sxdg q[2];
cswap q[3],q[1],q[4];
rzx(3.878192233393787) q[1],q[0];
t q[3];
cx q[4],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
