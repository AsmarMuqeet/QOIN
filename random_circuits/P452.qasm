OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.168980457857382) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
cx q[0],q[1];
ry(3.9126014875761084) q[0];
cswap q[3],q[4],q[2];
rzx(4.168980457857382) q[1],q[4];
sxdg q[2];
s q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
