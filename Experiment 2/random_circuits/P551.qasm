OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
cx q[0],q[1];
z q[0];
cp(4.494262167164054) q[3],q[2];
sx q[2];
p(6.145251547745821) q[3];
rx(5.40246382292685) q[4];
h q[4];
sxdg q[5];
u(4.298507597883107,0.3093668214770608,2.7637645438399807) q[5];
rx(4.902690975348113) q[6];
rzz(4.13435459627747) q[1],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
