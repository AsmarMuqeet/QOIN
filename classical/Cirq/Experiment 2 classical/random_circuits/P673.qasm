OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[7];
creg c[3];
u2(2.5070191958140446,5.70745364025067) q[1];
swap q[2],q[0];
rx(4.284922797401093) q[2];
cswap q[3],q[4],q[5];
cz q[0],q[5];
rxx(3.0876824610812865) q[3],q[1];
ry(3.3378799518837874) q[6];
dcx q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
