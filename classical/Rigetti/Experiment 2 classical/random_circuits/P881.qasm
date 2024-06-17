OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
cp(6.281345935060197) q[0],q[1];
u(0.6530858201659638,0.038231039740896186,1.7058655550026631) q[0];
rx(0.562887744130004) q[2];
sxdg q[3];
u(0.7623193647806908,2.499343564860292,6.0908036637704015) q[4];
x q[5];
cswap q[2],q[5],q[3];
swap q[2],q[3];
u1(0.6904019845848947) q[5];
u2(2.1229972958508956,1.3068928207079324) q[6];
cswap q[1],q[6],q[4];
cz q[0],q[6];
cu3(5.655282694828738,5.789686193699264,4.896458032103132) q[4],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];