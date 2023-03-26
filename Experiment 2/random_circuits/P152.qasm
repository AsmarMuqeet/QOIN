OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.64219771048821) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
u(1.45391984913682,2.65681415000069,0.7535095821474814) q[0];
sxdg q[1];
z q[2];
csx q[1],q[2];
p(4.001349715274581) q[3];
ry(4.205544918952341) q[3];
t q[4];
rzx(1.64219771048821) q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
