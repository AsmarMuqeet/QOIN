OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
u1(0.11990599142882752) q[1];
cu1(2.877848073788984) q[3],q[2];
u(2.886298867241224,1.0342440666704997,1.5186836776710602) q[3];
csx q[4],q[0];
ccx q[0],q[2],q[1];
t q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
