OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
cu(3.6102655571765974,4.876873490644369,0.17464408107710452,2.794778983725167) q[2],q[3];
cswap q[0],q[1],q[4];
ry(1.4683343528286295) q[0];
u2(0.032847191369439865,4.686057556788718) q[1];
ccx q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
