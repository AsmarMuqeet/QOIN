OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
cu3(2.1017651848160472,2.3570942357713034,3.476777118507131) q[2],q[1];
x q[1];
p(1.76627614027516) q[2];
csx q[3],q[0];
rx(1.962948488013413) q[4];
cswap q[0],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];