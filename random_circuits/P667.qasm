OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.050412701040483) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
rzx(4.050412701040483) q[1],q[0];
u1(5.659646022536583) q[0];
sxdg q[1];
sxdg q[4];
z q[4];
csx q[5],q[3];
s q[3];
rxx(0.3570433944694286) q[6],q[2];
cy q[2],q[5];
sxdg q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
