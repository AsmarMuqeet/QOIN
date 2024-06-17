OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.5657012104929349) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
t q[1];
h q[1];
rxx(2.156745878133892) q[3],q[0];
csx q[0],q[3];
tdg q[3];
rzx(1.5657012104929349) q[2],q[4];
sxdg q[2];
rzz(5.387342459040072) q[2],q[1];
h q[4];
csx q[0],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
