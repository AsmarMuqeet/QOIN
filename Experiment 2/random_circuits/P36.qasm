OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.011432953277890496) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
cz q[1],q[2];
h q[2];
sxdg q[2];
ccx q[3],q[0],q[4];
u(0.14945495214773638,2.81914921032445,5.762037675418347) q[0];
rzx(0.011432953277890496) q[1],q[4];
csx q[0],q[4];
s q[1];
sdg q[3];
rz(1.287536000008686) q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
