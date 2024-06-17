OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.701550392435085) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
sdg q[0];
tdg q[1];
ry(1.0526070473047262) q[1];
p(4.00963643572214) q[2];
rzx(5.701550392435085) q[0],q[2];
rz(5.004809387851271) q[3];
s q[3];
sxdg q[4];
z q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
