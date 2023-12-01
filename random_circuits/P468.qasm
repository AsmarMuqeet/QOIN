OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.0517419312100107) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
u1(5.646468104172268) q[0];
x q[1];
rzx(3.0517419312100107) q[1],q[0];
sxdg q[2];
x q[2];
rx(2.4693294128123897) q[3];
y q[4];
swap q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
