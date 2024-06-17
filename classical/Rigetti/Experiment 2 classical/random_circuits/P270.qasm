OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.6427989712120983,0.4891252154644885,-0.4891252154644885) q0; }
qreg q[7];
creg c[3];
sxdg q[0];
x q[0];
r(3.6427989712120983,2.059921542259385) q[2];
ccx q[3],q[1],q[4];
x q[1];
csx q[2],q[3];
z q[4];
crx(3.736992360383013) q[5],q[6];
csx q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
