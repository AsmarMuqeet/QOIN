OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.3319417139787755) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
ry(0.0052541119612638295) q[1];
tdg q[1];
rzx(1.3319417139787755) q[2],q[0];
csx q[2],q[0];
crx(0.3769465626131135) q[4],q[3];
ry(3.776629782179496) q[3];
x q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
