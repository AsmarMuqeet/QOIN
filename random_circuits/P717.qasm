OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
rz(1.11881952200147) q[0];
ccx q[2],q[1],q[3];
u(4.831422133259609,3.822045660845887,2.645760794547443) q[2];
cx q[3],q[1];
u2(3.9186963242679935,4.413926692727772) q[4];
rzz(0.4956250815676934) q[0],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];