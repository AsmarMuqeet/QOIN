OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.8357379136274483,0.7405988240845169,-0.7405988240845169) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.166722141610638) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
r(1.8357379136274483,2.3113951508794135) q[2];
sxdg q[2];
cswap q[3],q[1],q[0];
z q[0];
id q[3];
ry(4.941163670815176) q[4];
rzx(5.166722141610638) q[4],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
