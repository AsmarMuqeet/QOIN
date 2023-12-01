OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
rzz(2.7553503569621296) q[1],q[2];
u2(2.3907803569175434,4.083915228731425) q[1];
u(3.0176263593024064,3.7746146879911344,5.033650090312844) q[1];
sxdg q[3];
rzz(2.4854390380009264) q[3],q[2];
u2(5.688545195837346,0.4460514791873934) q[2];
cx q[0],q[4];
id q[0];
h q[0];
sx q[4];
cy q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];