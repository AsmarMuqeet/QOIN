OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
cswap q[1],q[2],q[0];
t q[0];
u2(4.99612470339186,6.219473724111361) q[1];
rzz(6.054580410444148) q[4],q[3];
u2(3.881439255271535,3.0403650494461063) q[3];
cz q[4],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
