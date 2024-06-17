OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
u1(3.3482882241987895) q[1];
t q[1];
h q[2];
u1(3.735445691424041) q[2];
rxx(2.7033448854799955) q[0],q[3];
x q[0];
t q[4];
cu(1.2759417851299195,3.659505660885604,0.7220860743908281,3.240480809701543) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];