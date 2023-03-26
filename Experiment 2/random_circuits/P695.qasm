OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[7];
creg c[3];
sxdg q[2];
sxdg q[2];
cu1(0.30339558253694454) q[0],q[4];
sdg q[4];
dcx q[5],q[3];
t q[5];
cx q[6],q[1];
csx q[0],q[1];
crz(5.987294271267885) q[6],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
